#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../source/app/main.c ../source/app/irdecoder.c ../source/app/indication.c ../source/app/volume.c ../source/eeprom/eeprom.c ../source/kernel/internal/kernel.c ../source/math/internal/math.c ../source/spi/software_spi.c ../source/system/internal/system.c ../source/time/internal/time.c ../source/uart/internal/uart.c ../source/uart/internal/uart_tx_buffer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1361276380/main.p1 ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 ${OBJECTDIR}/_ext/1361276380/indication.p1 ${OBJECTDIR}/_ext/1361276380/volume.p1 ${OBJECTDIR}/_ext/807898725/eeprom.p1 ${OBJECTDIR}/_ext/1741847670/kernel.p1 ${OBJECTDIR}/_ext/2092781535/math.p1 ${OBJECTDIR}/_ext/1361293671/software_spi.p1 ${OBJECTDIR}/_ext/491974104/system.p1 ${OBJECTDIR}/_ext/1354920378/time.p1 ${OBJECTDIR}/_ext/981298137/uart.p1 ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1361276380/main.p1.d ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d ${OBJECTDIR}/_ext/1361276380/indication.p1.d ${OBJECTDIR}/_ext/1361276380/volume.p1.d ${OBJECTDIR}/_ext/807898725/eeprom.p1.d ${OBJECTDIR}/_ext/1741847670/kernel.p1.d ${OBJECTDIR}/_ext/2092781535/math.p1.d ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d ${OBJECTDIR}/_ext/491974104/system.p1.d ${OBJECTDIR}/_ext/1354920378/time.p1.d ${OBJECTDIR}/_ext/981298137/uart.p1.d ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1361276380/main.p1 ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 ${OBJECTDIR}/_ext/1361276380/indication.p1 ${OBJECTDIR}/_ext/1361276380/volume.p1 ${OBJECTDIR}/_ext/807898725/eeprom.p1 ${OBJECTDIR}/_ext/1741847670/kernel.p1 ${OBJECTDIR}/_ext/2092781535/math.p1 ${OBJECTDIR}/_ext/1361293671/software_spi.p1 ${OBJECTDIR}/_ext/491974104/system.p1 ${OBJECTDIR}/_ext/1354920378/time.p1 ${OBJECTDIR}/_ext/981298137/uart.p1 ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1

# Source Files
SOURCEFILES=../source/app/main.c ../source/app/irdecoder.c ../source/app/indication.c ../source/app/volume.c ../source/eeprom/eeprom.c ../source/kernel/internal/kernel.c ../source/math/internal/math.c ../source/spi/software_spi.c ../source/system/internal/system.c ../source/time/internal/time.c ../source/uart/internal/uart.c ../source/uart/internal/uart_tx_buffer.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18LF2550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1361276380/main.p1: ../source/app/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/main.p1 ../source/app/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/main.d ${OBJECTDIR}/_ext/1361276380/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/irdecoder.p1: ../source/app/irdecoder.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 ../source/app/irdecoder.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/irdecoder.d ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/indication.p1: ../source/app/indication.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/indication.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/indication.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/indication.p1 ../source/app/indication.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/indication.d ${OBJECTDIR}/_ext/1361276380/indication.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/indication.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/volume.p1: ../source/app/volume.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/volume.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/volume.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/volume.p1 ../source/app/volume.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/volume.d ${OBJECTDIR}/_ext/1361276380/volume.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/volume.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/807898725/eeprom.p1: ../source/eeprom/eeprom.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/807898725" 
	@${RM} ${OBJECTDIR}/_ext/807898725/eeprom.p1.d 
	@${RM} ${OBJECTDIR}/_ext/807898725/eeprom.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/807898725/eeprom.p1 ../source/eeprom/eeprom.c 
	@-${MV} ${OBJECTDIR}/_ext/807898725/eeprom.d ${OBJECTDIR}/_ext/807898725/eeprom.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/807898725/eeprom.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1741847670/kernel.p1: ../source/kernel/internal/kernel.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1741847670" 
	@${RM} ${OBJECTDIR}/_ext/1741847670/kernel.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1741847670/kernel.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1741847670/kernel.p1 ../source/kernel/internal/kernel.c 
	@-${MV} ${OBJECTDIR}/_ext/1741847670/kernel.d ${OBJECTDIR}/_ext/1741847670/kernel.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1741847670/kernel.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2092781535/math.p1: ../source/math/internal/math.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2092781535" 
	@${RM} ${OBJECTDIR}/_ext/2092781535/math.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2092781535/math.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2092781535/math.p1 ../source/math/internal/math.c 
	@-${MV} ${OBJECTDIR}/_ext/2092781535/math.d ${OBJECTDIR}/_ext/2092781535/math.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2092781535/math.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361293671/software_spi.p1: ../source/spi/software_spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361293671" 
	@${RM} ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361293671/software_spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361293671/software_spi.p1 ../source/spi/software_spi.c 
	@-${MV} ${OBJECTDIR}/_ext/1361293671/software_spi.d ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/491974104/system.p1: ../source/system/internal/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/491974104" 
	@${RM} ${OBJECTDIR}/_ext/491974104/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/491974104/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/491974104/system.p1 ../source/system/internal/system.c 
	@-${MV} ${OBJECTDIR}/_ext/491974104/system.d ${OBJECTDIR}/_ext/491974104/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/491974104/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1354920378/time.p1: ../source/time/internal/time.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1354920378" 
	@${RM} ${OBJECTDIR}/_ext/1354920378/time.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1354920378/time.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1354920378/time.p1 ../source/time/internal/time.c 
	@-${MV} ${OBJECTDIR}/_ext/1354920378/time.d ${OBJECTDIR}/_ext/1354920378/time.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1354920378/time.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/981298137/uart.p1: ../source/uart/internal/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/981298137" 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/981298137/uart.p1 ../source/uart/internal/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/981298137/uart.d ${OBJECTDIR}/_ext/981298137/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/981298137/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1: ../source/uart/internal/uart_tx_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/981298137" 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1 ../source/uart/internal/uart_tx_buffer.c 
	@-${MV} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.d ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1361276380/main.p1: ../source/app/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/main.p1 ../source/app/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/main.d ${OBJECTDIR}/_ext/1361276380/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/irdecoder.p1: ../source/app/irdecoder.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/irdecoder.p1 ../source/app/irdecoder.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/irdecoder.d ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/irdecoder.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/indication.p1: ../source/app/indication.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/indication.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/indication.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/indication.p1 ../source/app/indication.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/indication.d ${OBJECTDIR}/_ext/1361276380/indication.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/indication.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361276380/volume.p1: ../source/app/volume.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361276380" 
	@${RM} ${OBJECTDIR}/_ext/1361276380/volume.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361276380/volume.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361276380/volume.p1 ../source/app/volume.c 
	@-${MV} ${OBJECTDIR}/_ext/1361276380/volume.d ${OBJECTDIR}/_ext/1361276380/volume.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361276380/volume.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/807898725/eeprom.p1: ../source/eeprom/eeprom.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/807898725" 
	@${RM} ${OBJECTDIR}/_ext/807898725/eeprom.p1.d 
	@${RM} ${OBJECTDIR}/_ext/807898725/eeprom.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/807898725/eeprom.p1 ../source/eeprom/eeprom.c 
	@-${MV} ${OBJECTDIR}/_ext/807898725/eeprom.d ${OBJECTDIR}/_ext/807898725/eeprom.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/807898725/eeprom.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1741847670/kernel.p1: ../source/kernel/internal/kernel.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1741847670" 
	@${RM} ${OBJECTDIR}/_ext/1741847670/kernel.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1741847670/kernel.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1741847670/kernel.p1 ../source/kernel/internal/kernel.c 
	@-${MV} ${OBJECTDIR}/_ext/1741847670/kernel.d ${OBJECTDIR}/_ext/1741847670/kernel.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1741847670/kernel.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2092781535/math.p1: ../source/math/internal/math.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/2092781535" 
	@${RM} ${OBJECTDIR}/_ext/2092781535/math.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2092781535/math.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2092781535/math.p1 ../source/math/internal/math.c 
	@-${MV} ${OBJECTDIR}/_ext/2092781535/math.d ${OBJECTDIR}/_ext/2092781535/math.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2092781535/math.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1361293671/software_spi.p1: ../source/spi/software_spi.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1361293671" 
	@${RM} ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1361293671/software_spi.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1361293671/software_spi.p1 ../source/spi/software_spi.c 
	@-${MV} ${OBJECTDIR}/_ext/1361293671/software_spi.d ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1361293671/software_spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/491974104/system.p1: ../source/system/internal/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/491974104" 
	@${RM} ${OBJECTDIR}/_ext/491974104/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/491974104/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/491974104/system.p1 ../source/system/internal/system.c 
	@-${MV} ${OBJECTDIR}/_ext/491974104/system.d ${OBJECTDIR}/_ext/491974104/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/491974104/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1354920378/time.p1: ../source/time/internal/time.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1354920378" 
	@${RM} ${OBJECTDIR}/_ext/1354920378/time.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1354920378/time.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1354920378/time.p1 ../source/time/internal/time.c 
	@-${MV} ${OBJECTDIR}/_ext/1354920378/time.d ${OBJECTDIR}/_ext/1354920378/time.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1354920378/time.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/981298137/uart.p1: ../source/uart/internal/uart.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/981298137" 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/981298137/uart.p1 ../source/uart/internal/uart.c 
	@-${MV} ${OBJECTDIR}/_ext/981298137/uart.d ${OBJECTDIR}/_ext/981298137/uart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/981298137/uart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1: ../source/uart/internal/uart_tx_buffer.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/981298137" 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1 ../source/uart/internal/uart_tx_buffer.c 
	@-${MV} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.d ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/981298137/uart_tx_buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -mrom=default,-7dc0-7fff -mram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O2 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"../source" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/IR-Digipot.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
