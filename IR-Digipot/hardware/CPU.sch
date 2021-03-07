EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L power:GNDD #PWR010
U 1 1 5FE1F2A3
P 4700 4350
F 0 "#PWR010" H 4700 4100 50  0001 C CNN
F 1 "GNDD" H 4704 4195 50  0000 C CNN
F 2 "" H 4700 4350 50  0001 C CNN
F 3 "" H 4700 4350 50  0001 C CNN
	1    4700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4250 4700 4350
Connection ~ 4700 4250
$Comp
L power:+5VD #PWR09
U 1 1 5FE204AA
P 4650 2350
F 0 "#PWR09" H 4650 2200 50  0001 C CNN
F 1 "+5VD" H 4665 2523 50  0000 C CNN
F 2 "" H 4650 2350 50  0001 C CNN
F 3 "" H 4650 2350 50  0001 C CNN
	1    4650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2350 4650 2450
Wire Wire Line
	4600 4250 4700 4250
$Comp
L Microcontroller:PIC18F2550T-ISO U2
U 1 1 5FE29C8E
P 4650 3350
F 0 "U2" H 5200 4350 50  0000 L BNN
F 1 "PIC18F2550T-ISO" H 5200 4250 50  0000 L BNN
F 2 "Package_SO:SOIC-28_Width7.50mm_Pitch1.27mm" H 6100 4300 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/39632e.pdf" H 6100 4300 50  0001 C CNN
F 4 "IC MCU 8BIT 32KB FLASH 28SOIC" H 4650 3350 50  0001 C CNN "Description"
F 5 "PIC PIC® 18F Microcontroller IC 8-Bit 48MHz 32KB (16K x 16) FLASH 28-SOIC" H 4650 3350 50  0001 C CNN "Detailed Description"
F 6 "PIC18LF2550-I/SO-ND" H 4650 3350 50  0001 C CNN "Digi-Key Part Number"
F 7 "Microchip Technology" H 4650 3350 50  0001 C CNN "Manufacturer"
F 8 "PIC18LF2550-I/SO" H 4650 3350 50  0001 C CNN "Manufacturer Part Number"
	1    4650 3350
	1    0    0    -1  
$EndComp
$Comp
L Capacitor_Ceramic:C C3
U 1 1 5FE20484
P 3550 1550
F 0 "C3" V 3571 1415 50  0000 R CNN
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
L power:+5VD #PWR07
U 1 1 5FE283BF
P 3550 1350
F 0 "#PWR07" H 3550 1200 50  0001 C CNN
F 1 "+5VD" H 3565 1523 50  0000 C CNN
F 2 "" H 3550 1350 50  0001 C CNN
F 3 "" H 3550 1350 50  0001 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR08
U 1 1 5FE290E9
P 3550 1750
F 0 "#PWR08" H 3550 1500 50  0001 C CNN
F 1 "GNDD" H 3554 1595 50  0000 C CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1700 3550 1750
Wire Wire Line
	3050 1800 3050 2700
Wire Wire Line
	3050 2700 3250 2700
$Comp
L Crystal:ABM8W-20.0000MHZ-4-K1Z-T3 X1
U 1 1 5FE286DC
P 1750 3600
F 0 "X1" H 1900 3800 50  0000 L CNN
F 1 "ABM8W-20.0000MHZ-4-K1Z-T3" H 1900 3875 50  0001 L BNN
F 2 "Crystal:Crystal_SMD_4Pin_3.2x2.5mm" H 2150 3600 50  0001 C CNN
F 3 "https://abracon.com/Resonators/ABM8W.pdf" H 2150 3600 50  0001 C CNN
F 4 "CRYSTAL 20.0000MHZ 4PF SMD" H 1750 3600 50  0001 C CNN "Description"
F 5 "20MHz ±10ppm Crystal 4pF 50 Ohms 4-SMD, No Lead" H 1750 3600 50  0001 C CNN "Detailed Description"
F 6 "535-14037-1-ND" H 1750 3600 50  0001 C CNN "Digi-Key Part Number"
F 7 "Abracon LLC" H 1750 3600 50  0001 C CNN "Manufacturer"
F 8 "ABM8W-20.0000MHZ-4-K1Z-T3" H 1750 3600 50  0001 C CNN "Manufacturer Part Number"
F 9 "20MHz" H 1900 3700 50  0000 L BNN "Frequency"
	1    1750 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3500 2200 3250
$Comp
L Capacitor_Ceramic:C C2
U 1 1 5FE2C5B6
P 2100 3800
F 0 "C2" V 2121 3665 50  0000 R CNN
F 1 "4 pF" V 2030 3665 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 1950 4000 50  0001 C CNN
F 3 "" H 1950 4000 50  0001 C CNN
F 4 "CAP CER 4PF 50V C0G/NP0 0402" V 2100 3800 50  0001 C CNN "Description"
F 5 "KEMET" V 2100 3800 50  0001 C CNN "Manufacturer"
F 6 "CBR04C409B5GAC" V 2100 3800 50  0001 C CNN "Manufacturer Part Number"
F 7 "399-13246-1-ND" V 2100 3800 50  0001 C CNN "Digi-Key Part Number"
	1    2100 3800
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR05
U 1 1 5FE2F103
P 2100 4100
F 0 "#PWR05" H 2100 3850 50  0001 C CNN
F 1 "GNDD" H 2104 3945 50  0000 C CNN
F 2 "" H 2100 4100 50  0001 C CNN
F 3 "" H 2100 4100 50  0001 C CNN
	1    2100 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR01
U 1 1 5FE2F5E3
P 1400 4100
F 0 "#PWR01" H 1400 3850 50  0001 C CNN
F 1 "GNDD" H 1404 3945 50  0000 C CNN
F 2 "" H 1400 4100 50  0001 C CNN
F 3 "" H 1400 4100 50  0001 C CNN
	1    1400 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR02
U 1 1 5FE2FF95
P 1750 4100
F 0 "#PWR02" H 1750 3850 50  0001 C CNN
F 1 "GNDD" H 1754 3945 50  0000 C CNN
F 2 "" H 1750 4100 50  0001 C CNN
F 3 "" H 1750 4100 50  0001 C CNN
	1    1750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3600 2100 3600
Wire Wire Line
	1750 3800 1750 3850
Wire Wire Line
	1550 3850 1750 3850
Wire Wire Line
	1550 3350 1750 3350
Connection ~ 1750 3850
Wire Wire Line
	1750 3850 1750 4100
Wire Wire Line
	1400 3600 1400 3650
Wire Wire Line
	1400 3600 1400 3250
Wire Wire Line
	1400 3250 2200 3250
Connection ~ 1400 3600
Wire Wire Line
	2100 3650 2100 3600
Connection ~ 2100 3600
Wire Wire Line
	1750 3350 1750 3400
Text Notes 1050 4500 0    50   ~ 0
Capacitors are calculated for 4pF load\ncapacitors and 2pF stray capacitance.
$Comp
L Connector_Generic:Conn_1x06_Generic J1
U 1 1 5FE3A765
P 6950 2300
F 0 "J1" H 7078 2001 50  0000 L CNN
F 1 "Conn_1x06_Generic" H 7078 1910 50  0000 L CNN
F 2 "Connector_Generic:Conn_1x06_D0.65mm_Pitch2.54mm_staggered" H 6950 2300 50  0001 C CNN
F 3 "" H 6950 2300 50  0001 C CNN
	1    6950 2300
	1    0    0    -1  
$EndComp
Text Label 3050 1800 0    50   ~ 0
MCLR
Text Label 6350 2400 0    50   ~ 0
MCLR
Wire Wire Line
	6350 2400 6800 2400
Wire Wire Line
	6800 2500 6700 2500
$Comp
L power:+5VD #PWR013
U 1 1 5FE36B16
P 6700 2050
F 0 "#PWR013" H 6700 1900 50  0001 C CNN
F 1 "+5VD" H 6715 2223 50  0000 C CNN
F 2 "" H 6700 2050 50  0001 C CNN
F 3 "" H 6700 2050 50  0001 C CNN
	1    6700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2050 6700 2500
Wire Wire Line
	6800 2600 6700 2600
Wire Wire Line
	6700 2600 6700 3050
$Comp
L power:GNDD #PWR014
U 1 1 5FE3ACDF
P 6700 3050
F 0 "#PWR014" H 6700 2800 50  0001 C CNN
F 1 "GNDD" H 6704 2895 50  0000 C CNN
F 2 "" H 6700 3050 50  0001 C CNN
F 3 "" H 6700 3050 50  0001 C CNN
	1    6700 3050
	1    0    0    -1  
$EndComp
Text Notes 6900 2300 0    50   ~ 0
ICSP
Wire Wire Line
	6050 2700 6800 2700
Wire Wire Line
	6050 2800 6800 2800
$Comp
L Interface_Optical:TSOP75438TR U3
U 1 1 5FE45339
P 8550 5000
F 0 "U3" H 8728 4751 50  0000 L CNN
F 1 "TSOP75438TR" H 8728 4660 50  0000 L CNN
F 2 "Interface_Optical:TSOP754" H 8550 5000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/82494/tsop752.pdf" H 8550 5000 50  0001 C CNN
F 4 "SENSOR REMOTE REC 38.0KHZ 45M" H 8550 5000 50  0001 C CNN "Description"
F 5 "Vishay Semiconductor Opto Division" H 8550 5000 50  0001 C CNN "Manufacturer"
F 6 "TSOP75438TR" H 8550 5000 50  0001 C CNN "Manufacturer Part Number"
F 7 "TSOP75438CT-ND" H 8550 5000 50  0001 C CNN "Digi-Key Part Number"
F 8 "Remote Receiver Sensor, 38.0kHz 45m Surface Mount" H 8550 5000 50  0001 C CNN "Detailed Description"
	1    8550 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5400 7850 5500
Connection ~ 7850 5500
Wire Wire Line
	7850 5500 7850 5700
$Comp
L power:GNDD #PWR018
U 1 1 5FE4B614
P 7850 5700
F 0 "#PWR018" H 7850 5450 50  0001 C CNN
F 1 "GNDD" H 7854 5545 50  0000 C CNN
F 2 "" H 7850 5700 50  0001 C CNN
F 3 "" H 7850 5700 50  0001 C CNN
	1    7850 5700
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR016
U 1 1 5FE4C094
P 7500 4850
F 0 "#PWR016" H 7500 4700 50  0001 C CNN
F 1 "+5VD" H 7515 5023 50  0000 C CNN
F 2 "" H 7500 4850 50  0001 C CNN
F 3 "" H 7500 4850 50  0001 C CNN
	1    7500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4850 7500 5100
Wire Wire Line
	6050 3000 6500 3000
Text Label 6150 3000 0    50   ~ 0
IR_SERIAL
Text Label 7850 5250 0    50   ~ 0
IR_SERIAL
Wire Wire Line
	7850 5250 8300 5250
Wire Wire Line
	7500 5100 8300 5100
Wire Wire Line
	7850 5400 8300 5400
Wire Wire Line
	7850 5500 8300 5500
$Comp
L Capacitor_Ceramic:C C4
U 1 1 5FE59FAB
P 7500 5300
F 0 "C4" V 7521 5165 50  0000 R CNN
F 1 "0.1uF" V 7430 5165 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 7350 5500 50  0001 C CNN
F 3 "" H 7350 5500 50  0001 C CNN
F 4 "CAP CER 0.1UF 25V X7R 0402" V 7500 5300 50  0001 C CNN "Description"
F 5 "KEMET" V 7500 5300 50  0001 C CNN "Manufacturer"
F 6 "C0402C104K3RAC7411" V 7500 5300 50  0001 C CNN "Manufacturer Part Number"
F 7 "399-C0402C104K3RAC7411CT-ND" V 7500 5300 50  0001 C CNN "Digi-Key Part Number"
	1    7500 5300
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR017
U 1 1 5FE5B57D
P 7500 5700
F 0 "#PWR017" H 7500 5450 50  0001 C CNN
F 1 "GNDD" H 7504 5545 50  0000 C CNN
F 2 "" H 7500 5700 50  0001 C CNN
F 3 "" H 7500 5700 50  0001 C CNN
	1    7500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5450 7500 5700
$Comp
L Resistor:R R2
U 1 1 5FE392EE
P 3650 4600
F 0 "R2" V 3650 4650 50  0000 L BNN
F 1 "0" V 3650 4500 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 3650 4600 50  0001 C CNN
F 3 "" H 3650 4600 50  0001 C CNN
F 4 "RES SMD 0 OHM JUMPER 1/16W 0402" H 3650 4600 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 3650 4600 50  0001 C CNN "Manufacturer"
F 6 "CRG0402ZR" H 3650 4600 50  0001 C CNN "Manufacturer Part Number"
F 7 "A106025CT-ND" H 3650 4600 50  0001 C CNN "Digi-Key Part Number"
	1    3650 4600
	0    -1   -1   0   
$EndComp
$Comp
L Resistor:R R3
U 1 1 5FE3B9CC
P 3650 4800
F 0 "R3" V 3650 4850 50  0000 L BNN
F 1 "0" V 3650 4700 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 3650 4800 50  0001 C CNN
F 3 "" H 3650 4800 50  0001 C CNN
F 4 "RES SMD 0 OHM JUMPER 1/16W 0402" H 3650 4800 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 3650 4800 50  0001 C CNN "Manufacturer"
F 6 "CRG0402ZR" H 3650 4800 50  0001 C CNN "Manufacturer Part Number"
F 7 "A106025CT-ND" H 3650 4800 50  0001 C CNN "Digi-Key Part Number"
	1    3650 4800
	0    -1   -1   0   
$EndComp
$Comp
L Resistor:R R4
U 1 1 5FE3C3BD
P 3650 5000
F 0 "R4" V 3650 5050 50  0000 L BNN
F 1 "0" V 3650 4900 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 3650 5000 50  0001 C CNN
F 3 "" H 3650 5000 50  0001 C CNN
F 4 "RES SMD 0 OHM JUMPER 1/16W 0402" H 3650 5000 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 3650 5000 50  0001 C CNN "Manufacturer"
F 6 "CRG0402ZR" H 3650 5000 50  0001 C CNN "Manufacturer Part Number"
F 7 "A106025CT-ND" H 3650 5000 50  0001 C CNN "Digi-Key Part Number"
	1    3650 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3250 3700 3100 3700
Wire Wire Line
	3100 3700 3100 4700
Wire Wire Line
	3250 3800 3150 3800
Wire Wire Line
	3150 3800 3150 4900
Wire Wire Line
	3250 3900 3200 3900
Wire Wire Line
	3200 3900 3200 5100
Text GLabel 4050 4700 2    50   Input ~ 0
SPI_CLK
Text GLabel 4050 5100 2    50   Input ~ 0
SPI_CS_DIGIPOT
Text GLabel 4050 4900 2    50   Input ~ 0
SPI_MOSI
Wire Wire Line
	2950 3100 3250 3100
Wire Wire Line
	3550 1350 3550 1400
$Comp
L Capacitor_Ceramic:C C1
U 1 1 5FE2B3B5
P 1400 3800
F 0 "C1" V 1421 3665 50  0000 R CNN
F 1 "4 pF" V 1330 3665 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 1250 4000 50  0001 C CNN
F 3 "" H 1250 4000 50  0001 C CNN
F 4 "CAP CER 4PF 50V C0G/NP0 0402" V 1400 3800 50  0001 C CNN "Description"
F 5 "KEMET" V 1400 3800 50  0001 C CNN "Manufacturer"
F 6 "CBR04C409B5GAC" V 1400 3800 50  0001 C CNN "Manufacturer Part Number"
F 7 "399-13246-1-ND" V 1400 3800 50  0001 C CNN "Digi-Key Part Number"
	1    1400 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 3950 2100 4100
Wire Wire Line
	1400 3950 1400 4100
Wire Wire Line
	7500 5100 7500 5150
Connection ~ 7500 5100
Wire Wire Line
	3800 4700 4050 4700
Wire Wire Line
	3800 4900 4050 4900
Wire Wire Line
	3800 5100 4050 5100
Wire Wire Line
	3200 5100 3500 5100
Wire Wire Line
	3150 4900 3500 4900
Wire Wire Line
	3100 4700 3500 4700
Wire Wire Line
	2200 3500 3250 3500
Wire Wire Line
	2100 3600 3250 3600
Text GLabel 2950 3200 0    50   Input ~ 0
DIGIPOT_SHDN
Text Notes 6900 3600 0    50   ~ 0
UART
Wire Wire Line
	6750 3900 6800 3900
Wire Wire Line
	6750 4000 6750 3900
$Comp
L power:GNDD #PWR015
U 1 1 5FE5ACFD
P 6750 4000
F 0 "#PWR015" H 6750 3750 50  0001 C CNN
F 1 "GNDD" H 6754 3845 50  0000 C CNN
F 2 "" H 6750 4000 50  0001 C CNN
F 3 "" H 6750 4000 50  0001 C CNN
	1    6750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3800 6800 3800
Wire Wire Line
	6050 3700 6800 3700
$Comp
L Connector_Generic:Conn_1x03_Generic J2
U 1 1 5FE58490
P 6950 3600
F 0 "J2" H 7078 3451 50  0000 L CNN
F 1 "Conn_1x03_Generic" H 7078 3360 50  0000 L CNN
F 2 "Connector_Generic:Conn_1x03_D0.65mm_Pitch2.54mm_staggered" H 6950 3600 50  0001 C CNN
F 3 "" H 6950 3600 50  0001 C CNN
	1    6950 3600
	1    0    0    -1  
$EndComp
Text GLabel 2950 3100 0    50   Input ~ 0
+5VA_SHTDN
Wire Wire Line
	2950 3200 3250 3200
Wire Wire Line
	1400 3600 1600 3600
Wire Wire Line
	1550 3350 1550 3850
Wire Wire Line
	3250 2800 2950 2800
Wire Wire Line
	3250 2900 2950 2900
Text Label 2950 2800 2    50   ~ 0
LED0
Text Label 2950 2900 2    50   ~ 0
LED1
Text Label 5650 4850 2    50   ~ 0
LED0
Text Label 5650 4950 2    50   ~ 0
LED1
Wire Wire Line
	5650 4950 6350 4950
Wire Wire Line
	6350 4950 6350 5100
Wire Wire Line
	5650 4850 6000 4850
Wire Wire Line
	6000 4850 6000 5100
$Comp
L LED:HSMG-C170 D3
U 1 1 6018F3C2
P 6350 5600
F 0 "D3" V 6450 5650 50  0000 L CNN
F 1 "HSMG-C170" H 6350 5475 50  0001 C CNN
F 2 "LED:HSMx-C170" H 6360 5750 50  0001 C CNN
F 3 "https://docs.broadcom.com/doc/AV02-0551EN" H 6360 5750 50  0001 C CNN
F 4 "LED GREEN DIFFUSED CHIP SMD" H 6350 5600 50  0001 C CNN "Description"
F 5 "Green 572nm LED Indication - Discrete 2.2V 0805 (2012 Metric)" H 6350 5600 50  0001 C CNN "Detailed Description"
F 6 "516-1434-1-ND" H 6350 5600 50  0001 C CNN "Digi-Key Part Number"
F 7 "Broadcom Limited" H 6350 5600 50  0001 C CNN "Manufacturer"
F 8 "HSMG-C170" H 6350 5600 50  0001 C CNN "Manufacturer Part Number"
	1    6350 5600
	0    -1   -1   0   
$EndComp
$Comp
L Resistor:R R5
U 1 1 6019487D
P 6100 5250
F 0 "R5" H 6070 5296 50  0000 L CNN
F 1 "150" H 6070 5205 50  0000 L CNN
F 2 "Resistor:R_0402_1005Metric" H 6100 5250 50  0001 C CNN
F 3 "" H 6100 5250 50  0001 C CNN
F 4 "CRGCQ 0402 150R 1%" H 6100 5250 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 6100 5250 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F150R" H 6100 5250 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129617CT-ND" H 6100 5250 50  0001 C CNN "Digi-Key Part Number"
	1    6100 5250
	1    0    0    -1  
$EndComp
$Comp
L Resistor:R R6
U 1 1 6019624A
P 6450 5250
F 0 "R6" H 6420 5296 50  0000 L CNN
F 1 "150" H 6420 5205 50  0000 L CNN
F 2 "Resistor:R_0402_1005Metric" H 6450 5250 50  0001 C CNN
F 3 "" H 6450 5250 50  0001 C CNN
F 4 "CRGCQ 0402 150R 1%" H 6450 5250 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 6450 5250 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F150R" H 6450 5250 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129617CT-ND" H 6450 5250 50  0001 C CNN "Digi-Key Part Number"
	1    6450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR011
U 1 1 6019674C
P 6000 5800
F 0 "#PWR011" H 6000 5550 50  0001 C CNN
F 1 "GNDD" H 6004 5645 50  0000 C CNN
F 2 "" H 6000 5800 50  0001 C CNN
F 3 "" H 6000 5800 50  0001 C CNN
	1    6000 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR012
U 1 1 60196DAF
P 6350 5800
F 0 "#PWR012" H 6350 5550 50  0001 C CNN
F 1 "GNDD" H 6354 5645 50  0000 C CNN
F 2 "" H 6350 5800 50  0001 C CNN
F 3 "" H 6350 5800 50  0001 C CNN
	1    6350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 5750 6350 5800
Wire Wire Line
	6000 5750 6000 5800
Wire Wire Line
	6000 5400 6000 5450
Wire Wire Line
	6350 5400 6350 5450
$Comp
L LED:HSMG-C170 D2
U 1 1 60180CAB
P 6000 5600
F 0 "D2" V 6100 5650 50  0000 L CNN
F 1 "HSMG-C170" H 6000 5475 50  0001 C CNN
F 2 "LED:HSMx-C170" H 6010 5750 50  0001 C CNN
F 3 "https://docs.broadcom.com/doc/AV02-0551EN" H 6010 5750 50  0001 C CNN
F 4 "LED GREEN DIFFUSED CHIP SMD" H 6000 5600 50  0001 C CNN "Description"
F 5 "Green 572nm LED Indication - Discrete 2.2V 0805 (2012 Metric)" H 6000 5600 50  0001 C CNN "Detailed Description"
F 6 "516-1434-1-ND" H 6000 5600 50  0001 C CNN "Digi-Key Part Number"
F 7 "Broadcom Limited" H 6000 5600 50  0001 C CNN "Manufacturer"
F 8 "HSMG-C170" H 6000 5600 50  0001 C CNN "Manufacturer Part Number"
	1    6000 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2400 2150 2400 2250
Wire Wire Line
	2400 1800 2700 1800
Connection ~ 2400 1800
Wire Wire Line
	2400 1850 2400 1800
Wire Wire Line
	2300 1800 2400 1800
Wire Wire Line
	1850 2150 1850 2250
$Comp
L power:GNDD #PWR06
U 1 1 5FE43D04
P 2400 2250
F 0 "#PWR06" H 2400 2000 50  0001 C CNN
F 1 "GNDD" H 2404 2095 50  0000 C CNN
F 2 "" H 2400 2250 50  0001 C CNN
F 3 "" H 2400 2250 50  0001 C CNN
	1    2400 2250
	1    0    0    -1  
$EndComp
$Comp
L Resistor:R R1
U 1 1 5FE4251D
P 2500 2000
F 0 "R1" H 2470 2046 50  0000 L CNN
F 1 "100K" H 2470 1955 50  0000 L CNN
F 2 "Resistor:R_0402_1005Metric" H 2500 2000 50  0001 C CNN
F 3 "" H 2500 2000 50  0001 C CNN
F 4 "CRGCQ 0402 100K 1%" H 2500 2000 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 2500 2000 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F100K" H 2500 2000 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129651CT-ND" H 2500 2000 50  0001 C CNN "Digi-Key Part Number"
	1    2500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1400 1850 1450
$Comp
L power:GNDD #PWR04
U 1 1 5FE2B9AA
P 1850 2250
F 0 "#PWR04" H 1850 2000 50  0001 C CNN
F 1 "GNDD" H 1854 2095 50  0000 C CNN
F 2 "" H 1850 2250 50  0001 C CNN
F 3 "" H 1850 2250 50  0001 C CNN
	1    1850 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5VD #PWR03
U 1 1 5FE2B259
P 1850 1400
F 0 "#PWR03" H 1850 1250 50  0001 C CNN
F 1 "+5VD" H 1865 1573 50  0000 C CNN
F 2 "" H 1850 1400 50  0001 C CNN
F 3 "" H 1850 1400 50  0001 C CNN
	1    1850 1400
	1    0    0    -1  
$EndComp
$Comp
L Power_Supervisor:TCM809LVNB713 U1
U 1 1 5FE25880
P 1850 1750
F 0 "U1" H 1722 1746 50  0000 R CNN
F 1 "TCM809LVNB713" H 1722 1655 50  0000 R CNN
F 2 "Package_TO_SOT:SOT-23" H 2300 1950 50  0001 C CNN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 2300 1950 50  0001 C CNN
F 4 "IC SUPERVISOR 1 CHANNEL SOT23-3" H 1850 1750 50  0001 C CNN "Description"
F 5 "Supervisor Push-Pull, Totem Pole 1 Channel SOT-23-3" H 1850 1750 50  0001 C CNN "Detailed Description"
F 6 "TCM809LVNB713CT-ND" H 1850 1750 50  0001 C CNN "Digi-Key Part Number"
F 7 "Microchip Technology" H 1850 1750 50  0001 C CNN "Manufacturer"
F 8 "TCM809LVNB713" H 1850 1750 50  0001 C CNN "Manufacturer Part Number"
	1    1850 1750
	1    0    0    -1  
$EndComp
$Comp
L Diode:SS14HE D1
U 1 1 60460A64
P 2850 1800
F 0 "D1" H 2850 1585 50  0000 C CNN
F 1 "SS14HE" H 2850 1676 50  0000 C CNN
F 2 "Diode:SOD-323HE" H 2860 1950 50  0001 C CNN
F 3 "https://www.onsemi.com/pdf/datasheet/ss13he-d.pdf" H 2860 1950 50  0001 C CNN
F 4 "DIODE SCHOTTKY 40V 1A SOD323HE" H 2850 1800 50  0001 C CNN "Description"
F 5 "Diode Schottky 40V 1A Surface Mount SOD-323HE" H 2850 1800 50  0001 C CNN "Detailed Description"
F 6 "ON Semiconductor" H 2850 1800 50  0001 C CNN "Manufacturer"
F 7 "SS14HE" H 2850 1800 50  0001 C CNN "Manufacturer Part Number"
F 8 "SS14HECT-ND" H 2850 1800 50  0001 C CNN "Digi-Key Part Number"
F 9 "SS14" H 2850 1800 50  0001 C CNN "Base Part Number"
	1    2850 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 1800 3050 1800
$EndSCHEMATC
