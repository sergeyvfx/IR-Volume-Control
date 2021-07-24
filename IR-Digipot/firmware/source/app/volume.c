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

#include "app/volume.h"

#include <xc.h>

#include "app/indication.h"
#include "app/irdecoder.h"
#include "eeprom/eeprom.h"
#include "math/math.h"
#include "spi/software_spi.h"
#include "system/configuration.h"
#include "time/time.h"
#include "uart/uart.h"

// Incremental update submits new resistance value in gradual increments as
// opposite of submitting the final value.
// This is an experiment to reduce amount of crackling on volume change.
#define USE_INCREMENTAL_UPDATE 1

// Limit number of incremental steps, to avoid too long of an update sequence.
// Additionally, this reduces hearable noise when the digipot is latched too
// often.
#define INCREMENTAL_MAX_STEPS 4

typedef struct VolumeContext {
  // Volume which is configured by the software.
  // Note that it might not yet ebe communicated to the digipot.
  uint8_t volume;

  // Transmission of the resistance value to the digipot.
  //
  // The need_transmit is set when new value is to be transmitted to the
  // digipot. It is cleared when transmission begins.
  //
  // The transmit_channel indicates which channel is to be transmitted next.
  // The value of -1 indicates that there is no transmittion scheduled.
  //
  // transmit_target_resistance indicates the final resistance which is to be
  // sent to all the channels.
  // Is derived from volume at the beginning of transmittance, allowing to:
  //   - Reliably submit the same value to all channels.
  //   - Allow volume control is possible during transmittance.
  //   - Allow gradual change of resistance, to cope with crackling.
  bool need_transmit;
  uint8_t transmit_target_resistance;
  int8_t transmit_channel;

#if USE_INCREMENTAL_UPDATE
  // Delta of resistance value per update step.
  int8_t transmit_resistance_delta;
#endif

  // Currently effective resistance of the digipot.
  uint8_t current_resistance;
  bool has_current_resistance;

  // Indicates that value stored in EEPROM is to be updated.
  bool eeprom_need_update;
  // Countdown timer which is used to delay EEPROM update on continuous value
  // changes. Allows to prolong lifespan of the chip.
  uint8_t eeprom_update_countdown;
} VolumeContext;

VolumeContext global_context;

// Timer value which makes it to run at 99.29Hz.
#define TIMER3_VALUE 35322

#define AUDIO_POWER_SHTD LATAbits.LATA3
#define POT_SHTD LATAbits.LATA4

// Change in the pot value per one volume step.
#define VOLUME_STEP 1
#define MAX_VOLUME 32

////////////////////////////////////////////////////////////////////////////////
// Context.

static void CONTEXT_Initialize(VolumeContext* context) {
  context->volume = 0x80;

  context->need_transmit = false;
  context->transmit_target_resistance = 0;
  context->transmit_channel = -1;

#if USE_INCREMENTAL_UPDATE
  context->transmit_resistance_delta = 0;
#endif

  context->current_resistance = 0;
  context->has_current_resistance = false;

  context->eeprom_need_update = false;
  context->eeprom_update_countdown = 0;
}

static void CONTEXT_VolumeSet(VolumeContext* context,
                              const uint8_t new_volume) {
  // UART_WriteString("Setting volume to ");
  // UART_WriteHexByte(new_volume);
  // UART_WriteBuffer("\r\n", 2);

  context->volume = new_volume;
  context->need_transmit = true;
}

static void CONTEXT_VolumeSetIfNeeded(VolumeContext* context,
                                      const uint8_t new_volume) {
  if (context->volume == new_volume) {
    return;
  }
  CONTEXT_VolumeSet(context, new_volume);

  context->eeprom_need_update = true;

  // Half of second delay to confirm the value.
  context->eeprom_update_countdown = 50;
}

// Returns truth if the volume did change.
static bool CONTEXT_VolumeStepUp(VolumeContext* context) {
  const uint8_t step = VOLUME_STEP;
  if (context->volume == MAX_VOLUME) {
    return false;
  }
  if (context->volume >= MAX_VOLUME - step) {
    CONTEXT_VolumeSetIfNeeded(context, MAX_VOLUME);
    return true;
  }
  CONTEXT_VolumeSetIfNeeded(context, context->volume + step);
  return true;
}

// Returns truth if the volume did change.
static bool CONTEXT_VolumeStepDown(VolumeContext* context) {
  const uint8_t step = VOLUME_STEP;
  if (context->volume == 0) {
    return false;
  }
  if (context->volume <= step) {
    CONTEXT_VolumeSetIfNeeded(context, 0);
    return true;
  }
  CONTEXT_VolumeSetIfNeeded(context, context->volume - step);
  return true;
}

static uint8_t VolumeToResistance(const uint8_t volume) {
  if (volume >= 32) {
    return 255;
  }
  return volume * 8;
}

static void CONTEXT_FinishTransmissionIfNeeded(VolumeContext* context) {
  if (context->transmit_channel == -1) {
    // No transmission going on.
    return;
  }

  if (SPI_IsBusy()) {
    // Can not transmit because SPI bus is busy.
    return;
  }

  uint8_t new_resistance;
  if (!context->has_current_resistance) {
    new_resistance = context->transmit_target_resistance;
  } else {
#if USE_INCREMENTAL_UPDATE
    new_resistance = AddOrSubtractClamped(context->current_resistance,
                                          context->transmit_resistance_delta,
                                          context->transmit_target_resistance,
                                          context->transmit_target_resistance);
#else
    new_resistance = context->transmit_target_resistance;
#endif
  }

  const uint16_t data =
      ((uint16_t)new_resistance) | ((uint16_t)context->transmit_channel << 8);

  SPI_Transmit(data, 9);

  ++context->transmit_channel;
  if (context->transmit_channel == 2) {
    context->current_resistance = new_resistance;
    context->has_current_resistance = true;

    if (new_resistance == context->transmit_target_resistance) {
      // Indicate that transmission is fully done.
      context->transmit_channel = -1;
    } else {
      // Go back to first channel to keep gradually changing the value.
      context->transmit_channel = 0;
    }
  }
}

static void CONTEXT_ScheduleTransmissionIfNeeded(VolumeContext* context) {
  if (!context->need_transmit) {
    // Volume did not change, nothing to be transmitted.
    return;
  }

  if (context->transmit_channel != -1) {
    // Transmission is in progress.
    return;
  }

  context->need_transmit = false;
  context->transmit_channel = 0;
  context->transmit_target_resistance = VolumeToResistance(context->volume);

#if USE_INCREMENTAL_UPDATE
  if (context->has_current_resistance) {
    static const uint8_t max_steps = INCREMENTAL_MAX_STEPS;
    const uint8_t resistance_change =
        (context->current_resistance < context->transmit_target_resistance)
            ? context->transmit_target_resistance - context->current_resistance
            : context->current_resistance - context->transmit_target_resistance;

    const uint8_t delta = (resistance_change + max_steps - 1) / max_steps;
    if (context->transmit_target_resistance > context->current_resistance) {
      context->transmit_resistance_delta = (int8_t)delta;
    } else {
      context->transmit_resistance_delta = -(int8_t)delta;
    }
  }
#endif
}

static void CONTEXT_UpdateEEPROMIfNeeded(VolumeContext* context) {
  if (!context->eeprom_need_update) {
    // No changes to EEPROM.
    return;
  }

  if (context->eeprom_update_countdown != 0) {
    // Keep waiting to confirm value is not going to change soon.
    return;
  }

  context->eeprom_need_update = false;
  EEPROM_Write(EEMPROM_ADDR_VOLUME, context->volume);

  UART_WriteString("Volume written to EEPROM is ");
  UART_WriteHexByte(context->volume);
  UART_WriteBuffer("\r\n", 2);
}

static void CONTEXT_Tasks(VolumeContext* context) {
  CONTEXT_ScheduleTransmissionIfNeeded(context);
  CONTEXT_FinishTransmissionIfNeeded(context);
  CONTEXT_UpdateEEPROMIfNeeded(context);
}

////////////////////////////////////////////////////////////////////////////////
// Volume system.

static void VOLUME_InitializePorts(void) {
  // TODO(sergey): Make TRIS bits configuration more flexible.
  TRISAbits.TRISA3 = 0;
  TRISAbits.TRISA4 = 0;

  AUDIO_POWER_SHTD = 1;
  POT_SHTD = 0;
}

static void VOLUME_InitializeTimer(void) {
  PIE2bits.TMR3IE = 1;  // Enable Timer3 Overflow Interrupt.
  PIR2bits.TMR3IF = 0;

  // Set prescaler to 1:4.
  T3CONbits.T3CKPS0 = 0;
  T3CONbits.T3CKPS1 = 1;

  T3CONbits.T3SYNC = 1;  // Do not synchronize external clock input.

  // Timer3 Clock Source Select bit to Internal clock (Fosc/4)
  T3CONbits.TMR3CS = 0;

  TMR3 = TIMER3_VALUE;

  T3CONbits.TMR3ON = 1;  // Turn ON Timer3.

  INTCONbits.GIEH = 1;  // Enable Global Interrupt.
  INTCONbits.PEIE = 1;  // Peripheral Interrupt Enable bit (required for TMR2).
}

void VOLUME_Initialize(void) {
  VOLUME_InitializePorts();
  VOLUME_InitializeTimer();

  CONTEXT_Initialize(&global_context);
}

void VOLUME_UpdateOnStartup(void) {
  global_context.volume = EEPROM_Read(EEMPROM_ADDR_VOLUME);
  UART_WriteString("Read volume from EEPROM: ");
  UART_WriteHexByte(global_context.volume);
  UART_WriteBuffer("\r\n", 2);

  // TODO(sergey): Gradually bring power on.
  AUDIO_POWER_SHTD = 0;

  CONTEXT_VolumeSet(&global_context, global_context.volume);
  POT_SHTD = 1;

  // Wait for the chip to come online.
  DelayMilliseconds(5);
}

static bool IsVolumeDownTransmission(const IRTransmission* transmission) {
  if (transmission->protocol == PROTOCOL_RC6) {
    return transmission->rc6.address == 0 && transmission->rc6.command == 0x11;
  }
  return false;
}

static bool IsVolumeUpTransmission(const IRTransmission* transmission) {
  if (transmission->protocol == PROTOCOL_RC6) {
    return transmission->rc6.address == 0 && transmission->rc6.command == 0x10;
  }
  return false;
}

void VOLUME_Tasks(void) {
  IRTransmission transmission;
  if (IRDECODER_TryPopTransmission(&transmission)) {
    if (IsVolumeDownTransmission(&transmission)) {
      if (CONTEXT_VolumeStepDown(&global_context)) {
        INDICATOR_FlashLED(0);
      } else {
        INDICATOR_FlashLED(0);
        INDICATOR_FlashLED(1);
      }
    }
    if (IsVolumeUpTransmission(&transmission)) {
      if (CONTEXT_VolumeStepUp(&global_context)) {
        INDICATOR_FlashLED(1);
      } else {
        INDICATOR_FlashLED(0);
        INDICATOR_FlashLED(1);
      }
    }
  }

  CONTEXT_Tasks(&global_context);
}

void VOLUME_InterruptHandler(void) {
  if (!PIR2bits.TMR3IF) {
    return;
  }

  if (global_context.eeprom_update_countdown > 0) {
    --global_context.eeprom_update_countdown;
  }

  TMR3 = TIMER3_VALUE;

  PIR2bits.TMR3IF = 0;
}
