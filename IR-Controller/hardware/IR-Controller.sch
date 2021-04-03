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
Wire Wire Line
	4200 4050 4200 4000
Wire Wire Line
	4200 4000 4300 4000
Wire Wire Line
	4300 4000 4300 3950
Connection ~ 4200 4000
Wire Wire Line
	4200 4000 4200 3950
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
$Comp
L Switches:MCSLPT4644B1TR SW1
U 1 1 6068B9D5
P 7300 2150
F 0 "SW1" H 7300 2313 50  0000 C CNN
F 1 "MCSLPT4644B1TR" H 7300 2314 50  0001 C CNN
F 2 "Switches:MCSLPT4644B1TR" H 7300 2150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Tyco%20Electronics%20Alcoswitch%20PDFs/2337232-1_DS.pdf" H 7300 2150 50  0001 C CNN
F 4 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2337234&DocType=Customer+Drawing&DocLang=English" H 7300 2150 50  0001 C CNN "Drawing"
F 5 "TACT MICRO JB 4.6X4.4X0.55 P3.5" H 7300 2150 50  0001 C CNN "Description"
F 6 "Tactile Switch SPST-NO Top Actuated Surface Mount" H 7300 2150 50  0001 C CNN "Detailed Description"
F 7 "TE Connectivity ALCOSWITCH Switches" H 7300 2150 50  0001 C CNN "Manufacturer"
F 8 "MCSLPT4644B1TR" H 7300 2150 50  0001 C CNN "Manufacturer Part Number"
F 9 "450-3379-1-ND" H 7300 2150 50  0001 C CNN "Digi-Key Part Number"
F 10 "LPT" H 7300 2150 50  0001 C CNN "Series"
F 11 "Cut Tape (CT)" H 7300 2150 50  0001 C CNN "Packaging"
F 12 "SPST-NO" H 7300 2150 50  0001 C CNN "Circuit"
F 13 "Off-Mom" H 7300 2150 50  0001 C CNN "Switch Function"
F 14 "0.05A @ 12VDC" H 7300 2150 50  0001 C CNN "Contact Rating @ Voltage"
F 15 "Flush" H 7300 2150 50  0001 C CNN "Actuator Type"
F 16 "Surface Mount" H 7300 2150 50  0001 C CNN "Mounting Type"
F 17 "0.55mm" H 7300 2150 50  0001 C CNN "Actuator Height off PCB, Vertical"
F 18 "Top Actuated" H 7300 2150 50  0001 C CNN "Actuator Orientation"
F 19 "J Lead" H 7300 2150 50  0001 C CNN "Termination Style"
F 20 "4.60mm x 4.40mm" H 7300 2150 50  0001 C CNN "Outline"
F 21 "Non-Illuminated" H 7300 2150 50  0001 C CNN "Illumination"
F 22 "100gf" H 7300 2150 50  0001 C CNN "Operating Force"
F 23 "-20°C ~ 70°C" H 7300 2150 50  0001 C CNN "Operating Temperature"
F 24 "Polyamide (PA), Nylon" H 7300 2150 50  0001 C CNN "Actuator Material"
F 25 "0.20mm" H 7300 2150 50  0001 C CNN "Switch Travel"
F 26 "1,000,000 Cycles" H 7300 2150 50  0001 C CNN "Mechanical Life"
F 27 "MCSLPT" H 7300 2150 50  0001 C CNN "Base Part Number"
	1    7300 2150
	1    0    0    -1  
$EndComp
$Comp
L Power:GND #PWR04
U 1 1 6068530C
P 1550 3850
F 0 "#PWR04" H 1550 3650 50  0001 C CNN
F 1 "GND" H 1555 3712 50  0000 C CNN
F 2 "" H 1550 3850 50  0001 C CNN
F 3 "" H 1550 3850 50  0001 C CNN
	1    1550 3850
	1    0    0    -1  
$EndComp
$Comp
L Power:GND #PWR07
U 1 1 60685DB1
P 4200 4050
F 0 "#PWR07" H 4200 3850 50  0001 C CNN
F 1 "GND" H 4205 3912 50  0000 C CNN
F 2 "" H 4200 4050 50  0001 C CNN
F 3 "" H 4200 4050 50  0001 C CNN
	1    4200 4050
	1    0    0    -1  
$EndComp
$Comp
L Power:GND #PWR02
U 1 1 60686759
P 1550 1850
F 0 "#PWR02" H 1550 1650 50  0001 C CNN
F 1 "GND" H 1555 1712 50  0000 C CNN
F 2 "" H 1550 1850 50  0001 C CNN
F 3 "" H 1550 1850 50  0001 C CNN
	1    1550 1850
	1    0    0    -1  
$EndComp
$Comp
L Power:GND #PWR06
U 1 1 60686FF1
P 3550 1750
F 0 "#PWR06" H 3550 1550 50  0001 C CNN
F 1 "GND" H 3555 1612 50  0000 C CNN
F 2 "" H 3550 1750 50  0001 C CNN
F 3 "" H 3550 1750 50  0001 C CNN
	1    3550 1750
	1    0    0    -1  
$EndComp
$Comp
L Power:+3V #PWR01
U 1 1 606853B1
P 1550 1450
F 0 "#PWR01" H 1550 1300 50  0001 C CNN
F 1 "+3V" H 1565 1623 50  0000 C CNN
F 2 "" H 1550 1450 50  0001 C CNN
F 3 "" H 1550 1450 50  0001 C CNN
	1    1550 1450
	1    0    0    -1  
$EndComp
$Comp
L Power:+3V #PWR05
U 1 1 60685E70
P 3550 1350
F 0 "#PWR05" H 3550 1200 50  0001 C CNN
F 1 "+3V" H 3565 1523 50  0000 C CNN
F 2 "" H 3550 1350 50  0001 C CNN
F 3 "" H 3550 1350 50  0001 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
$Comp
L Power:+3V #PWR08
U 1 1 60686867
P 4250 2050
F 0 "#PWR08" H 4250 1900 50  0001 C CNN
F 1 "+3V" H 4265 2223 50  0000 C CNN
F 2 "" H 4250 2050 50  0001 C CNN
F 3 "" H 4250 2050 50  0001 C CNN
	1    4250 2050
	1    0    0    -1  
$EndComp
Text Label 6750 2600 2    50   ~ 0
SW_ROW_1
Text Label 6750 2700 2    50   ~ 0
SW_ROW_0
Wire Wire Line
	7500 2400 8550 2400
$Comp
L Switches:MCSLPT4644B1TR SW2
U 1 1 6068E3F1
P 7300 2600
F 0 "SW2" H 7300 2763 50  0000 C CNN
F 1 "MCSLPT4644B1TR" H 7300 2764 50  0001 C CNN
F 2 "Switches:MCSLPT4644B1TR" H 7300 2600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Tyco%20Electronics%20Alcoswitch%20PDFs/2337232-1_DS.pdf" H 7300 2600 50  0001 C CNN
F 4 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2337234&DocType=Customer+Drawing&DocLang=English" H 7300 2600 50  0001 C CNN "Drawing"
F 5 "TACT MICRO JB 4.6X4.4X0.55 P3.5" H 7300 2600 50  0001 C CNN "Description"
F 6 "Tactile Switch SPST-NO Top Actuated Surface Mount" H 7300 2600 50  0001 C CNN "Detailed Description"
F 7 "TE Connectivity ALCOSWITCH Switches" H 7300 2600 50  0001 C CNN "Manufacturer"
F 8 "MCSLPT4644B1TR" H 7300 2600 50  0001 C CNN "Manufacturer Part Number"
F 9 "450-3379-1-ND" H 7300 2600 50  0001 C CNN "Digi-Key Part Number"
F 10 "LPT" H 7300 2600 50  0001 C CNN "Series"
F 11 "Cut Tape (CT)" H 7300 2600 50  0001 C CNN "Packaging"
F 12 "SPST-NO" H 7300 2600 50  0001 C CNN "Circuit"
F 13 "Off-Mom" H 7300 2600 50  0001 C CNN "Switch Function"
F 14 "0.05A @ 12VDC" H 7300 2600 50  0001 C CNN "Contact Rating @ Voltage"
F 15 "Flush" H 7300 2600 50  0001 C CNN "Actuator Type"
F 16 "Surface Mount" H 7300 2600 50  0001 C CNN "Mounting Type"
F 17 "0.55mm" H 7300 2600 50  0001 C CNN "Actuator Height off PCB, Vertical"
F 18 "Top Actuated" H 7300 2600 50  0001 C CNN "Actuator Orientation"
F 19 "J Lead" H 7300 2600 50  0001 C CNN "Termination Style"
F 20 "4.60mm x 4.40mm" H 7300 2600 50  0001 C CNN "Outline"
F 21 "Non-Illuminated" H 7300 2600 50  0001 C CNN "Illumination"
F 22 "100gf" H 7300 2600 50  0001 C CNN "Operating Force"
F 23 "-20°C ~ 70°C" H 7300 2600 50  0001 C CNN "Operating Temperature"
F 24 "Polyamide (PA), Nylon" H 7300 2600 50  0001 C CNN "Actuator Material"
F 25 "0.20mm" H 7300 2600 50  0001 C CNN "Switch Travel"
F 26 "1,000,000 Cycles" H 7300 2600 50  0001 C CNN "Mechanical Life"
F 27 "MCSLPT" H 7300 2600 50  0001 C CNN "Base Part Number"
	1    7300 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2750 8550 2750
Text Label 8550 2400 2    50   ~ 0
SW_ROW_1
Text Label 8550 2750 2    50   ~ 0
SW_ROW_0
Wire Wire Line
	7100 2600 7100 2150
Wire Wire Line
	7100 2150 7100 1300
Connection ~ 7100 2150
Text Label 6750 3100 2    50   ~ 0
SW_COL_0
Text Label 7100 1300 3    50   ~ 0
SW_COL_0
Wire Wire Line
	7500 2150 7500 2400
Wire Wire Line
	7500 2600 7500 2750
$Comp
L Resistor:CRGCQ0402F10K R3
U 1 1 6069684D
P 6350 4050
F 0 "R3" H 6320 4096 50  0000 L CNN
F 1 "CRGCQ0402F10K" H 6300 4050 50  0001 L BNN
F 2 "Resistor:R_0402_1005Metric" H 6350 4050 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773204-3&DocType=DS&DocLang=English" H 6350 4050 50  0001 C CNN
F 4 "CRGCQ 0402 10K 1%" H 6350 4050 50  0001 C CNN "Description"
F 5 "10 kOhms ±1% 0.063W, 1/16W Chip Resistor 0402 (1005 Metric) Automotive AEC-Q200, Moisture Resistant Thick Film" H 6350 4050 50  0001 C CNN "Detailed Description"
F 6 "TE Connectivity Passive Product" H 6350 4050 50  0001 C CNN "Manufacturer"
F 7 "CRGCQ0402F10K" H 6350 4050 50  0001 C CNN "Manufacturer Part Number"
F 8 "A129639CT-ND" H 6350 4050 50  0001 C CNN "Digi-Key Part Number"
F 9 "10k" H 6320 4005 50  0000 L CNN "Resistance"
F 10 "CRGCQ" H 6350 4050 50  0001 C CNN "Series"
F 11 "Cut Tape (CT)" H 6350 4050 50  0001 C CNN "Packaging"
F 12 "±1%" H 6350 4050 50  0001 C CNN "Tolerance"
F 13 "0.063W, 1/16W" H 6350 4050 50  0001 C CNN "Power (Watts)"
F 14 "Thick Film" H 6350 4050 50  0001 C CNN "Composition"
F 15 "Automotive AEC-Q200, Moisture Resistant" H 6350 4050 50  0001 C CNN "Features"
F 16 "±100ppm/°C" H 6350 4050 50  0001 C CNN "Temperature Coefficient"
F 17 "-55°C ~ 155°C" H 6350 4050 50  0001 C CNN "Operating Temperature"
F 18 "0402 (1005 Metric)" H 6350 4050 50  0001 C CNN "Package / Case"
F 19 "AEC-Q200" H 6350 4050 50  0001 C CNN "Ratings"
F 20 "0402" H 6350 4050 50  0001 C CNN "Supplier Device Package"
F 21 "0.039\" L x 0.020\" W (1.00mm x 0.50mm)" H 6350 4050 50  0001 C CNN "Size / Dimension"
F 22 "0.016\" (0.40mm)" H 6350 4050 50  0001 C CNN "Height - Seated (Max)"
F 23 "2" H 6350 4050 50  0001 C CNN "Number of Terminations"
F 24 "CRGCQ0402" H 6350 4050 50  0001 C CNN "Base Part Number"
	1    6350 4050
	1    0    0    -1  
$EndComp
$Comp
L Power:GND #PWR09
U 1 1 6069D06B
P 6250 4250
F 0 "#PWR09" H 6250 4050 50  0001 C CNN
F 1 "GND" H 6255 4112 50  0000 C CNN
F 2 "" H 6250 4250 50  0001 C CNN
F 3 "" H 6250 4250 50  0001 C CNN
	1    6250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4200 6250 4250
$Comp
L Power:+3V #PWR03
U 1 1 606A50F2
P 1550 2650
F 0 "#PWR03" H 1550 2500 50  0001 C CNN
F 1 "+3V" H 1565 2823 50  0000 C CNN
F 2 "" H 1550 2650 50  0001 C CNN
F 3 "" H 1550 2650 50  0001 C CNN
	1    1550 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_1x06_Generic J1
U 1 1 6068768D
P 8100 3800
F 0 "J1" H 8050 3850 50  0000 L CNN
F 1 "Conn_1x06_Generic" H 8228 3410 50  0001 L CNN
F 2 "Connector_Generic:Conn_1x06_Socket_Pitch2.54mm_sideways" H 8100 3800 50  0001 C CNN
F 3 "" H 8100 3800 50  0001 C CNN
	1    8100 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4400 7350 4400
Wire Wire Line
	7950 4100 7350 4100
Wire Wire Line
	7350 4000 7950 4000
Text Label 7350 4400 0    50   ~ 0
MCLR
Text Label 7350 4100 0    50   ~ 0
PGD
Text Label 7350 4000 0    50   ~ 0
PGC
Wire Wire Line
	7950 4300 7650 4300
Wire Wire Line
	7650 4300 7650 3650
Wire Wire Line
	7950 4200 7700 4200
Wire Wire Line
	7700 4200 7700 4600
$Comp
L Power:GND #PWR0101
U 1 1 6068FA1F
P 7700 4600
F 0 "#PWR0101" H 7700 4400 50  0001 C CNN
F 1 "GND" H 7705 4462 50  0000 C CNN
F 2 "" H 7700 4600 50  0001 C CNN
F 3 "" H 7700 4600 50  0001 C CNN
	1    7700 4600
	-1   0    0    -1  
$EndComp
$Comp
L Power:+3V #PWR0102
U 1 1 60690747
P 7650 3650
F 0 "#PWR0102" H 7650 3500 50  0001 C CNN
F 1 "+3V" H 7665 3823 50  0000 C CNN
F 2 "" H 7650 3650 50  0001 C CNN
F 3 "" H 7650 3650 50  0001 C CNN
	1    7650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2400 2200 2400
Text Label 2200 2400 0    50   ~ 0
MCLR
Wire Wire Line
	5650 2500 6750 2500
Wire Wire Line
	5650 2400 6750 2400
Text Label 6750 2400 2    50   ~ 0
PGD
Text Label 6750 2500 2    50   ~ 0
PGC
Wire Wire Line
	5650 2600 6750 2600
Wire Wire Line
	5650 2700 6750 2700
Wire Wire Line
	6250 3100 6250 3900
Connection ~ 6250 3100
Wire Wire Line
	6250 3100 6750 3100
Wire Wire Line
	5650 3100 6250 3100
Wire Wire Line
	5650 3700 5700 3700
$Comp
L Power:GND #PWR?
U 1 1 6069341C
P 5700 4250
F 0 "#PWR?" H 5700 4050 50  0001 C CNN
F 1 "GND" H 5705 4112 50  0000 C CNN
F 2 "" H 5700 4250 50  0001 C CNN
F 3 "" H 5700 4250 50  0001 C CNN
	1    5700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3600 5900 3600
$Comp
L Power:GND #PWR?
U 1 1 6069472C
P 5900 4250
F 0 "#PWR?" H 5900 4050 50  0001 C CNN
F 1 "GND" H 5905 4112 50  0000 C CNN
F 2 "" H 5900 4250 50  0001 C CNN
F 3 "" H 5900 4250 50  0001 C CNN
	1    5900 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3700 5700 4250
Wire Wire Line
	5900 3600 5900 4250
$EndSCHEMATC
