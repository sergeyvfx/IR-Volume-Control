EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Microcontroller:PIC18LF2550-ISO U1
U 1 1 6002E7CC
P 4250 3050
F 0 "U1" H 5150 4000 50  0000 L BNN
F 1 "PIC18LF2550-ISO" H 5150 3900 50  0000 L BNN
F 2 "Package_SO:SOIC-28_Width7.50mm_Pitch1.27mm" H 5700 4000 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/39632e.pdf" H 6100 4300 50  0001 C CNN
F 4 "IC MCU 8BIT 32KB FLASH 28SOIC" H 4250 3050 50  0001 C CNN "Description"
F 5 "PIC PIC® 18F Microcontroller IC 8-Bit 48MHz 32KB (16K x 16) FLASH 28-SOIC" H 4250 3050 50  0001 C CNN "Detailed Description"
F 6 "PIC18F2550T-I/SOCT-ND" H 4250 3050 50  0001 C CNN "Digi-Key Part Number"
F 7 "Microchip Technology" H 4250 3050 50  0001 C CNN "Manufacturer"
F 8 "PIC18F2550T-I/SO" H 4250 3050 50  0001 C CNN "Manufacturer Part Number"
	1    4250 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60030E14
P 4200 4050
F 0 "#PWR06" H 4200 3800 50  0001 C CNN
F 1 "GND" H 4205 3877 50  0000 C CNN
F 2 "" H 4200 4050 50  0001 C CNN
F 3 "" H 4200 4050 50  0001 C CNN
	1    4200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4050 4200 4000
Wire Wire Line
	4200 4000 4300 4000
Wire Wire Line
	4300 4000 4300 3950
Connection ~ 4200 4000
Wire Wire Line
	4200 4000 4200 3950
$Comp
L power:+3V0 #PWR07
U 1 1 60031C1A
P 4250 2050
F 0 "#PWR07" H 4250 1900 50  0001 C CNN
F 1 "+3V0" H 4265 2223 50  0000 C CNN
F 2 "" H 4250 2050 50  0001 C CNN
F 3 "" H 4250 2050 50  0001 C CNN
	1    4250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2050 4250 2150
$Comp
L Connector_Battery:BC-2003 BT1
U 1 1 60036241
P 1550 1600
F 0 "BT1" H 1703 1596 50  0000 L CNN
F 1 "BC-2003" H 1703 1505 50  0000 L CNN
F 2 "Connector_Battery:BC-2003" H 1550 1600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Memory%20Protection%20PDFs/Coin_Cell_Guide.pdf" H 1550 1600 50  0001 C CNN
F 4 "BATTERY HOLDER COIN 20MM SMD" H 1550 1600 50  0001 C CNN "Description"
F 5 "Battery Retainer Coin, 20.0mm 1 Cell SMD (SMT) Tab" H 1550 1600 50  0001 C CNN "Detailed Description"
F 6 "BC-2003-ND" H 1550 1600 50  0001 C CNN "Digi-Key Part Number"
F 7 "https://www.memoryprotectiondevices.com/datasheets/BC-2003-datasheet.pdf" H 1550 1600 50  0001 C CNN "Drawing"
F 8 "MPD (Memory Protection Devices)" H 1550 1600 50  0001 C CNN "Manufacturer"
F 9 "BC-2003" H 1550 1600 50  0001 C CNN "Manufacturer Part Number"
	1    1550 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V0 #PWR01
U 1 1 600382A6
P 1550 1450
F 0 "#PWR01" H 1550 1300 50  0001 C CNN
F 1 "+3V0" H 1565 1623 50  0000 C CNN
F 2 "" H 1550 1450 50  0001 C CNN
F 3 "" H 1550 1450 50  0001 C CNN
	1    1550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 60038C3B
P 1550 1850
F 0 "#PWR02" H 1550 1600 50  0001 C CNN
F 1 "GND" H 1555 1677 50  0000 C CNN
F 2 "" H 1550 1850 50  0001 C CNN
F 3 "" H 1550 1850 50  0001 C CNN
	1    1550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1450 1550 1500
Wire Wire Line
	1550 1800 1550 1850
$Comp
L Capacitor_Ceramic:C C1
U 1 1 5FE20484
P 3550 1550
F 0 "C1" V 3571 1415 50  0000 R CNN
F 1 "0.1uF" V 3480 1415 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 3400 1750 50  0001 C CNN
F 3 "" H 3400 1750 50  0001 C CNN
F 4 "CAP CER 0.1UF 25V X7R 0402" V 3550 1550 50  0001 C CNN "Description"
F 5 "KEMET" V 3550 1550 50  0001 C CNN "Manufacturer"
F 6 "C0402C104K3RAC7411" V 3550 1550 50  0001 C CNN "Manufacturer Part Number"
F 7 "399-C0402C104K3RAC7411CT-ND" V 3550 1550 50  0001 C CNN "Digi-Key Part Number"
	1    3550 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V0 #PWR04
U 1 1 60030181
P 3550 1350
F 0 "#PWR04" H 3550 1200 50  0001 C CNN
F 1 "+3V0" H 3565 1523 50  0000 C CNN
F 2 "" H 3550 1350 50  0001 C CNN
F 3 "" H 3550 1350 50  0001 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 60030711
P 3550 1750
F 0 "#PWR05" H 3550 1500 50  0001 C CNN
F 1 "GND" H 3555 1577 50  0000 C CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1400 3550 1350
Wire Wire Line
	3550 1750 3550 1700
$Comp
L Transistor_BJT:MMBT3904LT1G Q1
U 1 1 5FE4DCB4
P 1650 3600
F 0 "Q1" H 1500 3800 50  0000 L BNN
F 1 "MMBT3904LT1G" H 1840 3600 50  0001 L BNN
F 2 "Package_TO_SOT:SOT-23" H 1650 3600 50  0001 C CNN
F 3 "https://www.onsemi.com/pdf/datasheet/mmbt3904lt1-d.pdf" H 1650 3600 50  0001 C CNN
F 4 "MMBT3904" H 1200 3700 50  0000 L BNN "Base Part Number"
F 5 "TRANS NPN 40V 200MA SOT23-3" H 1650 3600 50  0001 C CNN "Description"
F 6 "Bipolar (BJT) Transistor NPN 40V 200mA 300MHz 300mW Surface Mount SOT-23-3 (TO-236)" H 1650 3600 50  0001 C CNN "Detailed Description"
F 7 "MMBT3904LT1GOSCT-ND" H 1650 3600 50  0001 C CNN "Digi-Key Part Number"
F 8 "ON Semiconductor" H 1650 3600 50  0001 C CNN "Manufacturer"
F 9 "MMBT3904LT1G" H 1650 3600 50  0001 C CNN "Manufacturer Part Number"
	1    1650 3600
	-1   0    0    -1  
$EndComp
$Comp
L LED:IN-S126ESGHIR D1
U 1 1 60035D25
P 1550 2850
F 0 "D1" V 1550 2700 50  0000 R TNN
F 1 "IN-S126ESGHIR" H 1550 2725 50  0001 C CNN
F 2 "LED:IN-S126ESGHIR" H 1560 3000 50  0001 C CNN
F 3 "http://www.inolux-corp.com/datasheet/IR/Emitter/940%20nm%20SMD/IN-S126ESGHIR_V1.1.pdf" H 1560 3000 50  0001 C CNN
F 4 "SIDE VIEW / 1210 / 3.0X2.55X1.6" H 1550 2850 50  0001 C CNN "Description"
F 5 "Inolux" H 1550 2850 50  0001 C CNN "Manufacturer"
F 6 "IN-S126ESGHIR" H 1550 2850 50  0001 C CNN "Manufacturer Part Number"
F 7 "1830-IN-S126ESGHIRCT-ND" H 1550 2850 50  0001 C CNN "Digi-Key Part Number"
F 8 "Infrared (IR) Emitter 940nm 1.46V 100mA 92mW/sr @ 100mA (Typ) 30° 1210 (3225 Metric)" H 1550 2850 50  0001 C CNN "Detailed Description"
	1    1550 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60033686
P 1550 3850
F 0 "#PWR03" H 1550 3600 50  0001 C CNN
F 1 "GND" H 1555 3677 50  0000 C CNN
F 2 "" H 1550 3850 50  0001 C CNN
F 3 "" H 1550 3850 50  0001 C CNN
	1    1550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3800 1550 3850
$Comp
L Resistor:R R1
U 1 1 5FE58D04
P 1450 3200
F 0 "R1" H 1200 3150 50  0000 R TNN
F 1 "15" H 1200 3250 50  0000 R TNN
F 2 "Resistor:R_0402_1005Metric" H 1450 3200 50  0001 C CNN
F 3 "" H 1450 3200 50  0001 C CNN
F 4 "CRGCQ 0402 15R 1%" H 1450 3200 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 1450 3200 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F15R" H 1450 3200 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129605CT-ND" H 1450 3200 50  0001 C CNN "Digi-Key Part Number"
	1    1450 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 3350 1550 3400
Wire Wire Line
	1550 3000 1550 3050
$Comp
L power:+3V0 #PWR08
U 1 1 60035A12
P 1550 2650
F 0 "#PWR08" H 1550 2500 50  0001 C CNN
F 1 "+3V0" H 1565 2823 50  0000 C CNN
F 2 "" H 1550 2650 50  0001 C CNN
F 3 "" H 1550 2650 50  0001 C CNN
	1    1550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2650 1550 2700
$Comp
L Resistor:R R2
U 1 1 60036624
P 2300 3500
F 0 "R2" V 2050 3550 50  0000 R TNN
F 1 "2.7k" V 1950 3550 50  0000 R TNN
F 2 "Resistor:R_0402_1005Metric" H 2300 3500 50  0001 C CNN
F 3 "" H 2300 3500 50  0001 C CNN
F 4 "CRGCQ 0402 2K7 1%" H 2300 3500 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 2300 3500 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F2K7" H 2300 3500 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129632CT-ND" H 2300 3500 50  0001 C CNN "Digi-Key Part Number"
	1    2300 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3600 2450 3600
Wire Wire Line
	2150 3600 1850 3600
$EndSCHEMATC