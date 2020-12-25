// Copyright (c) 2020, Sergey Sharybin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// Author: Sergey Sharybin (sergey.vfx@gmail.com)

#include "app/irdecoder.h"

#include <stdint.h>
#include <string.h>
#include <xc.h>

#include "uart/uart.h"

// Maximum await time for the timer. is used to avoid overflows on a bogus
// transmissions.
//
// Measures in the 1/10th of a millisecond.
#define MAX_TIMER_WAIT_IN_TICKS 120

// Note on the RC6 protocol decode.
//
// The idea is to align self to the leading edge of the start bit, and them
// start counting bits and decode them from the Bi-phase Modulation (or
// Manchester coding). The decoding is done by re-alignment of our timing to the
// edge of the data bit (which happens in the middle of time tick period). This
// way it seems to be easier to get away with possibly unstable core frequency
// and the remote control itself.
//
// There might be other ideas, like start clock ticking at the start of the
// start bit, but it turned out to be harder to make sure all data bits are
// properly aligned. It might be due to instability of core frequency, or remote
// control, or maybe even bug in the implementation.
//
// The code seems a bit messy and needs verification from experts, but seems to
// work (tm).
//
// Useful links:
// - http://wiki.lemaker.org/LeMaker_Guitar:IR#NEC_Protocol.288_bit.29
// - http://www.pcbheaven.com/userpages/The_Philips_RC6_Protocol/
// - https://www.electroschematics.com/ir-decoder-encoder-part-1/

// Number of bits in the RC6 transmission.
// This value excluders leader bit but includes start bit.
#define RC6_NUM_BITS_IN_TRANSMISSION 21

// 0-based index of a bit corresponding to the T section of the transmission.
// This bit has wider timing diagram than the rest of the bits.
#define RC6_T_BIT_INDEX 4

// It is possible that the state machine is asked to wait for a data bit edge
// prior to the actual data from received has switched value to the first half
// of the encoded bit.
// This value denotes a blanking period to allow the initial value of the first
// half of the bit transmission to settle down.
//
// The value is measured in numver if TMR2 ticks which are configured to 100us
// intervals.
#define RC6_DATA_BIT_EDGE_BLANK_PERIOD 2

// Maximum time to wait for a data bit edge for T bit.
//
// The value is calculated as 75% of the expected full duration of the bit
// (which is 1.79us), rounded down to the closest value which is multiple to
// 100us.
//
// The value is measured in numver if TMR2 ticks which are configured to 100us
// intervals.
#define RC6_DATA_BIT_EDGE_MAX_WAIT_T 13

// Maximum time to wait for a data bit edge for T bit.
//
// The value is calculated as 75% of the expected full duration of the bit
// (which is 0.895us), rounded down to the closest value which is multiple to
// 100us.
//
// The value is measured in numver if TMR2 ticks which are configured to 100us
// intervals.
#define RC6_DATA_BIT_EDGE_MAX_WAIT_REGULAR 6

// Time to wait for the end of the T bit data (second half of the encoded bit
// value).
//
// The value is calculated as rounded down 80% of the expected half-bit duration
// (which is 895us), rounded down to the closest value which is multiple to
// 100us.
//
// Lower values cause mis-alignment of the "regular" bits after the T bit.
//
// The value is measured in numver if TMR2 ticks which are configured to 100us
// intervals.
#define RC6_DATA_BIT_END_WAIT_T 7

// Time to wait for the end of the T bit data (second half of the encoded bit
// value).
//
// The value is calculated as rounded down 75% of the expected half-bit duration
// (which is 447us), rounded down to the closest value which is multiple to
// 100us.
//
// The value is measured in numver if TMR2 ticks which are configured to 100us
// intervals.
#define RC6_DATA_BIT_END_WAIT_REGULAR 3

// States of the decoding machine.
typedef enum IRDecoderMachineState {
  // Wait for a leading edge of a leader bit pulse of the sequence.
  MACHINE_STATE_WAIT_FOR_LEADER_BIT,

  // In this state the beginning leader bit has been detected and it duration
  // is being measured. The duration of the pulse is used to do sanity check on
  // transmission validness, and also to deduct exact protocol used by the
  // transmission.
  // If the pulse is taking too long, or is not recognized by any supported
  // protocols the machine is returned to its initial state.
  MACHINE_STATE_MEASURE_LEADER_BIT,

  // Wait for the first edge of the start bit.
  // Start bit is the bit which indicates beginning of transmission right after
  // the leader bit.
  MACHINE_STATE_RC6_WAIT_START_BIT,

  // Wait for an edge of data bit.
  MACHINE_STATE_RC6_WAIT_DATA_BIT_EDGE,

  // Wait from data bit edge (which happens in the middle of the clock tick)
  // until end of the clock tick which is allocated for the data bit.
  MACHINE_STATE_RC6_WAIT_REGULAR_DATA_BIT_END,
  MACHINE_STATE_RC6_WAIT_T_DATA_BIT_END,

  // The edge of the last data bit has been handled. Now need to wait for the
  // second part of the bit to finish.
  MACHINE_STATE_RC6_WAIT_LAST_HALF_BIT,

  // The last bit was fully read.
  // Now wait for the transmission to be over, monitoring possible unexpected
  // data bits.
  MACHINE_STATE_RC6_WAIT_TRANSMISSION_END,
} IRDecoderMachineState;

// State machine of the protocol decoding.
typedef struct ISStateMachine {
  IRDecoderMachineState state;

  // Transmission which is being currently received.
  IRTransmission transmission;

  // Fully decoded transmission.
  // It is ready for use.
  IRTransmission decoded_transmission;
  bool has_decoded_transmission;

  // Number of TMR2 ticks counted.
  // The actual usage depends on the current state of the machine.
  uint8_t num_timer_ticks;

  // Number of currently received data bits from the transmission.
  uint8_t num_bits_received;

  // Last error message reported by this submodule.
  const char* error_message;
  bool has_error_message;
} ISStateMachine;

// Context of the infrared decoder subsystem.
typedef struct IRDecoderContext {
  ISStateMachine state_machine;

  // Most recently decoded transmission.
  IRTransmission transmission;
  bool has_transmission;
} IRDecoderContext;

static IRDecoderContext global_context;

////////////////////////////////////////////////////////////////////////////////
// Timer utilities.
//
// NOTE: Periods are calculated using 48MHz Fosc.
//
// TODO(sergey): Make period, pre/post-scaler calculation adaptive to the
// configured FOSC_FREQ.

static inline void TimerReset(void) {
  T2CONbits.TMR2ON = 0;
  TMR2 = 0;
  T2CONbits.TMR2ON = 1;
}

// Start TMR2 at 100us period.
static inline void TimerStart100us(void) {
  TimerReset();

  PR2 = 120;
  PIE1bits.TMR2IE = 1;
  T2CONbits.TMR2ON = 1;
}

// Stop timer ticks.
static inline void TimerStop(void) {
  PIE1bits.TMR2IE = 0;
  T2CONbits.TMR2ON = 0;
}

////////////////////////////////////////////////////////////////////////////////
// Transmission.

static void TRANSMISSION_Initialize(IRTransmission* transmission) {
  memset(transmission, 0, sizeof(IRTransmission));

  transmission->protocol = PROTOCOL_UNKNOWN;
}

////////////////////////////////////////////////////////////////////////////////
// Protocol.

const char* PROTOCOL_AsString(IRProtocol protocol) {
  switch (protocol) {
    case PROTOCOL_UNKNOWN: return "UNKNOWN";
    case PROTOCOL_RC6: return "RC6";
  }

  return "UNKNOWN";
}

// Deduct protocol from width of the start pulse measured in number of 100us
// ticks.
static IRProtocol PROTOCOL_DeductFromLeaderBitDuration(
    const uint8_t duration_in_ticks) {
  // RC6 protocol: start pulse width is 2.685ms.
  if (duration_in_ticks >= 24 && duration_in_ticks <= 28) {
    return PROTOCOL_RC6;
  }

  return PROTOCOL_UNKNOWN;
}

////////////////////////////////////////////////////////////////////////////////
// State machine.

static void MACHINE_Initialize(ISStateMachine* state_machine) {
  state_machine->state = MACHINE_STATE_WAIT_FOR_LEADER_BIT;
  state_machine->has_error_message = false;

  TRANSMISSION_Initialize(&state_machine->transmission);
}

// Start measuring number of 100us ticks.
// The counting starts from 0 ticks, and from timer started from this point in
// time.
static inline void MACHINE_Start100usTimerTicks(ISStateMachine* state_machine) {
  state_machine->num_timer_ticks = 0;
  TimerStart100us();
}

// Reset current state of timer (start timer counter from 0) and also reset
// the number of counted ticks.
static inline void MACHINE_ResetTimerAndTicks(ISStateMachine* state_machine) {
  TimerReset();
  state_machine->num_timer_ticks = 0;
}

// Reset machine state on protocol error.
static inline void MACHINE_ResetOnError(ISStateMachine* state_machine,
                                        const char* error_message) {
  TimerStop();
  state_machine->state = MACHINE_STATE_WAIT_FOR_LEADER_BIT;
  state_machine->error_message = error_message;
  state_machine->has_error_message = true;
}

// Commit current transmission and start being ready for a new one.
static inline void MACHINE_CommitTransmission(ISStateMachine* state_machine) {
  TimerStop();
  state_machine->state = MACHINE_STATE_WAIT_FOR_LEADER_BIT;

  state_machine->decoded_transmission = state_machine->transmission;
  state_machine->has_decoded_transmission = true;
}

static inline IRProtocol MACHINE_DeductProtocolFromTimer(
    const ISStateMachine* state_machine) {
  return PROTOCOL_DeductFromLeaderBitDuration(state_machine->num_timer_ticks);
}

// Move machine to the next state which follows the state right after the leader
// bit was fully processed. This is the first state where transmission protocol
// is known.
static void MACHINE_MoveToFirstProtocolState(ISStateMachine* state_machine) {
  switch (state_machine->transmission.protocol) {
    case PROTOCOL_UNKNOWN:
      MACHINE_ResetOnError(state_machine, "Unknown protocol");
      break;
    case PROTOCOL_RC6:
      state_machine->transmission.rc6.start_bit = 0;
      state_machine->transmission.rc6.field = 0;
      state_machine->transmission.rc6.t = 0;
      state_machine->transmission.rc6.address = 0;
      state_machine->transmission.rc6.command = 0;

      MACHINE_Start100usTimerTicks(state_machine);

      state_machine->state = MACHINE_STATE_RC6_WAIT_START_BIT;
      break;
  }
}

// Update the state and the state machine for an updated data coming from the
// infrared sensor.
// Call this function on every change of the data coming from the sensor.
//
// Note that the transmission bit is actual value of intended bit, it is an
// inversion of bit read from the infrared sensor.
static void MACHINE_HandleRawSensorDataChange(ISStateMachine* state_machine,
                                              const uint8_t transmission_bit) {
  switch (state_machine->state) {
    case MACHINE_STATE_WAIT_FOR_LEADER_BIT:
      if (state_machine->has_error_message) {
        // Allow main routine to finish handling the error message.
        break;
      }

      // Only detect the leading edge edge (raising edge).
      // This way the machine behaves correctly when it was started in the
      // middle of transmission, or when it was reset from a protocol error
      // state (more generically, when machine was started from an unknown value
      // coming from the sensor).
      if (transmission_bit == 1) {
        MACHINE_Start100usTimerTicks(state_machine);

        state_machine->state = MACHINE_STATE_MEASURE_LEADER_BIT;
      }
      break;

    case MACHINE_STATE_MEASURE_LEADER_BIT:
      // Detect the raising edge (trailing edge of the start pulse).
      if (transmission_bit == 0) {
        TimerStop();

        state_machine->transmission.protocol =
            MACHINE_DeductProtocolFromTimer(state_machine);

        MACHINE_MoveToFirstProtocolState(state_machine);
      }
      break;

    case MACHINE_STATE_RC6_WAIT_START_BIT:
      TimerStop();

      if (transmission_bit == 0) {
        // From the falling edge of the leader bit to the raising edge of the
        // start bit there is supposed to be only transition from low to high.
        MACHINE_ResetOnError(state_machine,
                             "RC6: Start bit is expectedt to be 1");
        break;
      }

      if (state_machine->num_timer_ticks < 8 ||
          state_machine->num_timer_ticks > 10) {
        // Thew start bit starts after 895us of signal being low after the
        // leader bit.
        // If the start bit timing is too far off, consider it a protocol error.
        MACHINE_ResetOnError(state_machine, "RC6: Bad timing of start bit");
        break;
      }

      state_machine->num_bits_received = 0;

      MACHINE_Start100usTimerTicks(state_machine);

      state_machine->state = MACHINE_STATE_RC6_WAIT_DATA_BIT_EDGE;

      break;

    case MACHINE_STATE_RC6_WAIT_DATA_BIT_EDGE:
      if (state_machine->num_timer_ticks <= RC6_DATA_BIT_EDGE_BLANK_PERIOD) {
        // Edge is too close. Probably because of transition from 0 to 1 or from
        // 1 to 0 after the end of the previous bit.
        break;
      }

      // If the bit took too long to come. Consider it a protocol error.
      if (state_machine->num_bits_received == RC6_T_BIT_INDEX) {
        if (state_machine->num_timer_ticks > RC6_DATA_BIT_EDGE_MAX_WAIT_T) {
          MACHINE_ResetOnError(state_machine,
                               "RC6: Bad timing of T data bit edge");
          break;
        }
      } else {
        if (state_machine->num_timer_ticks >
            RC6_DATA_BIT_EDGE_MAX_WAIT_REGULAR) {
          MACHINE_ResetOnError(state_machine,
                               "RC6: Bad timing of regular data bit edge");
          break;
        }
      }

      ++state_machine->num_bits_received;

      if (state_machine->num_bits_received > RC6_NUM_BITS_IN_TRANSMISSION) {
        // Transmission is too long, can not be valid RC6 packet.
        MACHINE_ResetOnError(state_machine, "RC6: Too many received bits");
        break;
      }

      {
        // Decode bit from Manchester code.
        //
        // If the first half of the bit period the value was low, then the
        // encoded bit was 0. Otherwise it was 1.
        // Here we know value during second half of clock period, so the value
        // is inverted.
        //
        // Append bit to the corresponding field of decoded RC6 transmission
        // based on the number of the currently received bit.
        const uint8_t decoded_bit = transmission_bit ? 0 : 1;
        if (state_machine->num_bits_received == 1) {
          state_machine->transmission.rc6.start_bit = decoded_bit;
        } else if (state_machine->num_bits_received < 4) {
          state_machine->transmission.rc6.field <<= 1;
          state_machine->transmission.rc6.field |= decoded_bit;
        } else if (state_machine->num_bits_received == 5) {
          state_machine->transmission.rc6.t = decoded_bit;
        } else if (state_machine->num_bits_received < 14) {
          state_machine->transmission.rc6.address <<= 1;
          state_machine->transmission.rc6.address |= decoded_bit;
        } else if (state_machine->num_bits_received < 22) {
          state_machine->transmission.rc6.command <<= 1;
          state_machine->transmission.rc6.command |= decoded_bit;
        }
      }

      MACHINE_ResetTimerAndTicks(state_machine);

      if (state_machine->num_bits_received == RC6_NUM_BITS_IN_TRANSMISSION) {
        state_machine->state = MACHINE_STATE_RC6_WAIT_LAST_HALF_BIT;
      } else if (state_machine->num_bits_received == RC6_T_BIT_INDEX + 1) {
        state_machine->state = MACHINE_STATE_RC6_WAIT_T_DATA_BIT_END;
      } else {
        state_machine->state = MACHINE_STATE_RC6_WAIT_REGULAR_DATA_BIT_END;
      }

      break;

      // There is supposed to be no data change at the second part of the bit
      // encoding. This is because timer is quite conservative, and if there is
      // data change during this period it will indicate a protocol error.
    case MACHINE_STATE_RC6_WAIT_REGULAR_DATA_BIT_END:
      MACHINE_ResetOnError(
          state_machine,
          "RC6: Unexpected data change at the end of regular bit");
      break;
    case MACHINE_STATE_RC6_WAIT_T_DATA_BIT_END:
      MACHINE_ResetOnError(state_machine,
                           "RC6: Unexpected data change at the end of T bit");
      break;

    case MACHINE_STATE_RC6_WAIT_LAST_HALF_BIT:
      MACHINE_ResetTimerAndTicks(state_machine);
      state_machine->state = MACHINE_STATE_RC6_WAIT_TRANSMISSION_END;
      break;

    case MACHINE_STATE_RC6_WAIT_TRANSMISSION_END:
      // No data is expected for some time right after the transmission is over.
      MACHINE_ResetOnError(state_machine,
                           "RC6: Unexpected data at the end of transmission");
      break;
  }
}

// Handle single timer tick.
// The elapsed time since previous timer tick is defined by the machine state.
static void MACHINE_HandleTimerTick(ISStateMachine* state_machine) {
  ++state_machine->num_timer_ticks;

  if (state_machine->num_timer_ticks > MAX_TIMER_WAIT_IN_TICKS) {
    MACHINE_ResetOnError(state_machine, "RC6: Number of timer ticks overflow");
    return;
  }

  switch (state_machine->state) {
    case MACHINE_STATE_RC6_WAIT_REGULAR_DATA_BIT_END:
      // Wait for 300us.
      //
      // In theory, wait period should be 400us (closest value multiple to
      // 100us which does not exceed 444us of the protocol). However, waiting
      // for that "long" makes us to miss the next bit.
      //
      // Could be something with the jitter of the clock, timer, or the remote
      // controller.
      if (state_machine->num_timer_ticks == RC6_DATA_BIT_END_WAIT_REGULAR) {
        MACHINE_ResetTimerAndTicks(state_machine);
        state_machine->state = MACHINE_STATE_RC6_WAIT_DATA_BIT_EDGE;
      }
      break;

    // Similarly to the "regular" bit, conservatively wait 700us, which is below
    // the theoretical 800us (closest value multiple of 100us to 895us, ot
    // exceeding it), but it causes the machine to miss the data edge after this
    // bit.
    case MACHINE_STATE_RC6_WAIT_T_DATA_BIT_END:
      if (state_machine->num_timer_ticks == RC6_DATA_BIT_END_WAIT_T) {
        MACHINE_ResetTimerAndTicks(state_machine);

        state_machine->state = MACHINE_STATE_RC6_WAIT_DATA_BIT_EDGE;
      }
      break;

    case MACHINE_STATE_RC6_WAIT_LAST_HALF_BIT:
      // Allow a bit longer period to wait, to make sure the possible last bit
      // transition at its very end (when signal goes from last transmission
      // value to the default pulled-up state on the receiver) is included into
      // this waiting process.
      //
      // Wait longer than expected 500us (smallest value multiple of 100us which
      // is greater than 444us). This way it is guaranteed to cover the
      // transition back to idle state is covered by this waiting routine.
      if (state_machine->num_timer_ticks == 6) {
        MACHINE_ResetTimerAndTicks(state_machine);
        state_machine->state = MACHINE_STATE_RC6_WAIT_TRANSMISSION_END;
      }
      break;

    case MACHINE_STATE_RC6_WAIT_TRANSMISSION_END:
      // Allow 3ms of "cooldown" after the packet.
      if (state_machine->num_timer_ticks == 30) {
        MACHINE_CommitTransmission(state_machine);
      }
      break;

    default: break;
  }
}

////////////////////////////////////////////////////////////////////////////////
// Context.

static void CONTEXT_Initialize(IRDecoderContext* context) {
  MACHINE_Initialize(&context->state_machine);
  context->has_transmission = false;
}

// Update the context and the state machine for an updated data coming from the
// infrared sensor.
//
// This function is called from an interrupt, and is called on both falling an
// rising edge of the data from the infrared sensor.
//
// Note that the transmission bit is actual value of intended bit, it is an
// inversion of bit read from the infrared sensor.
static void CONTEXT_HandleRawSensorDataChange(IRDecoderContext* context,
                                              const uint8_t transmission_bit) {
  MACHINE_HandleRawSensorDataChange(&context->state_machine, transmission_bit);
}

// Handle single timer tick.
// The elapsed time since previos timer tick is defined by the machine state.
//
// This function is called from an interrupt.
static void CONTEXT_HandleTimerTick(IRDecoderContext* context) {
  MACHINE_HandleTimerTick(&context->state_machine);
}

////////////////////////////////////////////////////////////////////////////////
// Infrader decoder subsystem.

// Notes on hardware configuration.
//
// - The serial IR decoder is connected to RB4 port.
// - TMR2 is used to provide timing for width-based demodulation.

static void InitializePort(void) {
  // Configure RB4 as an input.
  TRISBbits.TRISB4 = 1;

  // Configure rest of the Port B pins as outputs, which allows them to be left
  // floated without false-triggering the interrupt.
  TRISBbits.TRISB5 = 0;
  TRISBbits.TRISB6 = 0;
  TRISBbits.TRISB7 = 0;
}

// Initialize timer on startup.
static void InitializeTimer(void) {
  T2CONbits.TMR2ON = 0;

  // Set pre-scaler to 1.
  T2CONbits.T2CKPS0 = 0;
  T2CONbits.T2CKPS1 = 0;

  // Set post-scaler to 1.
  T2CONbits.T2OUTPS0 = 1;
  T2CONbits.T2OUTPS1 = 0;
  T2CONbits.T2OUTPS2 = 0;
  T2CONbits.T2OUTPS3 = 1;
}

static void InitializeInterrupts(void) {
  INTCONbits.RBIF = 0;  // Clear the interrupt flag of Port B.
  INTCONbits.RBIE = 1;  // Enable Port B change interrupt.

  IPR1bits.TMR2IP = 1;  // Configure TMR2 interrupt as High Priority.

  PIR1bits.TMR2IF = 0;  // Clear the interrupt flag of Timer 2.
  PIE1bits.TMR2IE = 0;  // Keep timer interrupt disabled, for until it's needed.

  INTCONbits.GIEH = 1;  // Enable Global Interrupt.
  INTCONbits.PEIE = 1;  // Peripheral Interrupt Enable bit (required for TMR2).
}

void IRDECODER_Initialize(void) {
  InitializePort();
  InitializeTimer();
  InitializeInterrupts();

  CONTEXT_Initialize(&global_context);
}

////////////////////////////////////////////////////////////////////////////////
// Periodic tasks.

static void IRDECODER_DumpTransmission(IRTransmission* transmission) {
  UART_WriteString("Received transmission: ");

  UART_WriteString("PROTO:");
  UART_WriteString(PROTOCOL_AsString(transmission->protocol));

  switch (transmission->protocol) {
    case PROTOCOL_UNKNOWN:
      // Nothing to do.
      break;

    case PROTOCOL_RC6:
      UART_WriteString(" START:");
      UART_WriteHexByte(transmission->rc6.start_bit);

      UART_WriteString(" T:");
      UART_WriteHexByte(transmission->rc6.t);

      UART_WriteString(" ADDRESS:");
      UART_WriteHexByte(transmission->rc6.address);

      UART_WriteString(" COMMAND:");
      UART_WriteHexByte(transmission->rc6.command);

      break;
  }

  UART_WriteBuffer("\r\n", 2);
}

void IRDECODER_Tasks(void) {
  IRDecoderContext* context = &global_context;

  if (context->state_machine.has_error_message) {
    UART_WriteString(context->state_machine.error_message);
    UART_WriteBuffer("\r\n", 2);
    context->state_machine.has_error_message = false;
  }

  if (context->state_machine.has_decoded_transmission) {
    context->transmission = context->state_machine.decoded_transmission;
    context->has_transmission = true;
    context->state_machine.has_decoded_transmission = false;

    // IRDECODER_DumpTransmission(&context->transmission);
  }
}

////////////////////////////////////////////////////////////////////////////////
// Interrupts handler.

static void HandlePortBInterrupt(void) {
  if (!INTCONbits.RBIF) {
    // The Port B did not change.
    return;
  }

  // Note from the datasheet section 9.2 INTCON Registers,
  // REGISTER 9-1: INTCON: INTERRUPT CONTROL REGISTER
  //
  // A mismatch condition will continue to set this bit. Reading PORTB will end
  // the mismatch condition and allow the bit to be cleared.
  if (PORTB) {
    asm("nop");
  }

  // Inverse the raw value from sensor to protocol bit. Makes it easier to
  // follow protocol specification diagrams.
  const uint8_t transmission_bit = PORTBbits.RB4 ? 0 : 1;

  CONTEXT_HandleRawSensorDataChange(&global_context, transmission_bit);

  // Clear the interrupt flag.
  INTCONbits.RBIF = 0;
}

static void HandleTimerInterrupt(void) {
  if (PIE1bits.TMR2IE == 0 || PIR1bits.TMR2IF == 0) {
    // Timer did not trigger.
    return;
  }

  CONTEXT_HandleTimerTick(&global_context);

  // Clear the interrupt flag.
  PIR1bits.TMR2IF = 0;
}

void IRDECODER_InterruptHandler(void) {
  HandlePortBInterrupt();
  HandleTimerInterrupt();
}

bool IRDECODER_TryPopTransmission(IRTransmission* transmission) {
  IRDecoderContext* context = &global_context;

  if (!context->has_transmission) {
    return false;
  }

  *transmission = context->transmission;
  context->has_transmission = false;

  return true;
}
