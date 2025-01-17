EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L Power_Management:L7985TR U8
U 1 1 5FE50960
P 3100 1350
F 0 "U8" H 3200 1500 50  0000 L BNN
F 1 "L7985TR" H 3200 1400 50  0000 L BNN
F 2 "Package_DFN_QFN:VFDFPN-10_EP_3x3mm_P0.5mm" H 2800 1350 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/group3/4f/f5/7f/c3/c3/ee/4b/de/DM00041559/files/DM00041559.pdf/jcr:content/translations/en.DM00041559.pdf" H 2800 1350 50  0001 C CNN
F 4 "IC REG BUCK ADJUSTABLE 2A" H 3100 1350 50  0001 C CNN "Description"
F 5 "Buck Switching Regulator IC Positive Adjustable 0.6V 1 Output 2A 10-VFDFN Exposed Pad" H 3100 1350 50  0001 C CNN "Detailed Description"
F 6 "497-13223-1-ND" H 3100 1350 50  0001 C CNN "Digi-Key Part Number"
F 7 "STMicroelectronics" H 3100 1350 50  0001 C CNN "Manufacturer"
F 8 "L7985TR" H 3100 1350 50  0001 C CNN "Manufacturer Part Number"
	1    3100 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR077
U 1 1 5FE5D3AF
P 3050 2450
F 0 "#PWR077" H 3050 2200 50  0001 C CNN
F 1 "GND" H 3055 2277 50  0000 C CNN
F 2 "" H 3050 2450 50  0001 C CNN
F 3 "" H 3050 2450 50  0001 C CNN
	1    3050 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2250 3150 2350
Wire Wire Line
	3150 2350 3050 2350
Wire Wire Line
	3050 2350 3050 2450
Wire Wire Line
	3050 2250 3050 2350
Connection ~ 3050 2350
Wire Wire Line
	2550 1450 2500 1450
Wire Wire Line
	2500 1450 2500 1550
Wire Wire Line
	2500 1550 2550 1550
Wire Wire Line
	2550 1750 2500 1750
Wire Wire Line
	2500 1750 2500 1550
Connection ~ 2500 1550
Wire Wire Line
	3700 1450 3750 1450
Wire Wire Line
	3750 1450 3750 1550
Wire Wire Line
	3750 1550 3700 1550
$Comp
L Capacitor_Ceramic:C C33
U 1 1 5FE6CE98
P 2050 1650
F 0 "C33" V 2071 1515 50  0000 R CNN
F 1 "220nF" V 1980 1515 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0603_1608Metric" H 1900 1850 50  0001 C CNN
F 3 "" H 1900 1850 50  0001 C CNN
F 4 "CAP CER 0.22UF 50V X7R 0603" V 2050 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 2050 1650 50  0001 C CNN "Manufacturer"
F 6 "UMK107B7224KA-TR" V 2050 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-5958-1-ND" V 2050 1650 50  0001 C CNN "Digi-Key Part Number"
	1    2050 1650
	0    -1   -1   0   
$EndComp
$Comp
L Capacitor_Ceramic:C C32
U 1 1 5FE6CEA2
P 1550 1650
F 0 "C32" V 1571 1515 50  0000 R CNN
F 1 "10uF" V 1480 1515 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_1210_3225Metric" H 1400 1850 50  0001 C CNN
F 3 "" H 1400 1850 50  0001 C CNN
F 4 "CAP CER 10UF 50V X7R 1210" V 1550 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 1550 1650 50  0001 C CNN "Manufacturer"
F 6 "UMK325AB7106KM-P" V 1550 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-6031-1-ND" V 1550 1650 50  0001 C CNN "Digi-Key Part Number"
	1    1550 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 1450 1550 1500
Wire Wire Line
	2050 1500 2050 1450
$Comp
L power:GND #PWR075
U 1 1 5FE51B43
P 2050 1850
F 0 "#PWR075" H 2050 1600 50  0001 C CNN
F 1 "GND" H 2055 1677 50  0000 C CNN
F 2 "" H 2050 1850 50  0001 C CNN
F 3 "" H 2050 1850 50  0001 C CNN
	1    2050 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR074
U 1 1 5FE51FD0
P 1550 1850
F 0 "#PWR074" H 1550 1600 50  0001 C CNN
F 1 "GND" H 1555 1677 50  0000 C CNN
F 2 "" H 1550 1850 50  0001 C CNN
F 3 "" H 1550 1850 50  0001 C CNN
	1    1550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1450 2050 1450
Connection ~ 2500 1450
Wire Wire Line
	1550 1450 2050 1450
Connection ~ 2050 1450
Wire Wire Line
	2050 1800 2050 1850
Wire Wire Line
	1550 1800 1550 1850
$Comp
L Power:VSNK #PWR073
U 1 1 5FE5558B
P 1250 1350
F 0 "#PWR073" H 1250 1200 50  0001 C CNN
F 1 "VSNK" H 1265 1523 50  0000 C CNN
F 2 "" H 1250 1350 50  0001 C CNN
F 3 "" H 1250 1350 50  0001 C CNN
	1    1250 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1350 1250 1450
Wire Wire Line
	1250 1450 1550 1450
Connection ~ 1550 1450
$Comp
L Capacitor_Ceramic:C C35
U 1 1 5FE577EF
P 3550 2450
F 0 "C35" H 3450 2250 50  0000 L BNN
F 1 "1nF" H 3400 2600 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 3400 2650 50  0001 C CNN
F 3 "" H 3400 2650 50  0001 C CNN
F 4 "CAP CER 1000PF 50V X7R 0402" V 3550 2450 50  0001 C CNN "Description"
F 5 "AVX Corporation" V 3550 2450 50  0001 C CNN "Manufacturer"
F 6 "04025C102KAT2A" V 3550 2450 50  0001 C CNN "Manufacturer Part Number"
F 7 "478-1101-1-ND" V 3550 2450 50  0001 C CNN "Digi-Key Part Number"
	1    3550 2450
	-1   0    0    1   
$EndComp
$Comp
L Capacitor_Ceramic:C C36
U 1 1 5FE59325
P 3550 2900
F 0 "C36" H 3450 2700 50  0000 L BNN
F 1 "22nF" H 3400 3050 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 3400 3100 50  0001 C CNN
F 3 "" H 3400 3100 50  0001 C CNN
F 4 "CAP CER 0.022UF 16V X7R 0402" V 3550 2900 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 3550 2900 50  0001 C CNN "Manufacturer"
F 6 "EMK105B7223KV-F" V 3550 2900 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-1224-1-ND" V 3550 2900 50  0001 C CNN "Digi-Key Part Number"
	1    3550 2900
	-1   0    0    1   
$EndComp
$Comp
L Resistor:R R39
U 1 1 5FE6C8F7
P 3900 2800
F 0 "R39" V 3950 2750 50  0000 L BNN
F 1 "1K" V 3700 2750 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 3900 2800 50  0001 C CNN
F 3 "" H 3900 2800 50  0001 C CNN
F 4 "CRGCQ 0402 1K0 1%" H 3900 2800 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 3900 2800 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F1K0" H 3900 2800 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129627CT-ND" H 3900 2800 50  0001 C CNN "Digi-Key Part Number"
	1    3900 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 2900 4050 2900
Wire Wire Line
	3750 2900 3700 2900
$Comp
L Resistor:R R40
U 1 1 5FE726D5
P 4300 2450
F 0 "R40" V 4100 2350 50  0000 L BNN
F 1 "100" V 4350 2350 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 4300 2450 50  0001 C CNN
F 3 "" H 4300 2450 50  0001 C CNN
F 4 "CRGCQ 0402 100R 1%" H 4300 2450 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 4300 2450 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F100R" H 4300 2450 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129615CT-ND" H 4300 2450 50  0001 C CNN "Digi-Key Part Number"
	1    4300 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2350 4150 2350
$Comp
L Capacitor_Ceramic:C C39
U 1 1 5FE733C4
P 4650 2350
F 0 "C39" H 4550 2150 50  0000 L BNN
F 1 "2.2nF" H 4500 2500 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 4500 2550 50  0001 C CNN
F 3 "" H 4500 2550 50  0001 C CNN
F 4 "CAP CER 2200PF 50V X7R 0402" V 4650 2350 50  0001 C CNN "Description"
F 5 "AVX Corporation" V 4650 2350 50  0001 C CNN "Manufacturer"
F 6 "04025C222KAT2A" V 4650 2350 50  0001 C CNN "Manufacturer Part Number"
F 7 "478-1105-1-ND" V 4650 2350 50  0001 C CNN "Digi-Key Part Number"
	1    4650 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 2350 4500 2350
$Comp
L Resistor:R R41
U 1 1 5FE74F6C
P 4950 2550
F 0 "R41" H 4650 2450 50  0000 L BNN
F 1 "5.1K" H 4600 2550 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 4950 2550 50  0001 C CNN
F 3 "" H 4950 2550 50  0001 C CNN
F 4 "RES SMD 5.1K OHM 0.1% 1/16W 0402" H 4950 2550 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 4950 2550 50  0001 C CNN "Manufacturer"
F 6 "CPF0402B5K1E1" H 4950 2550 50  0001 C CNN "Manufacturer Part Number"
F 7 "A102921CT-ND" H 4950 2550 50  0001 C CNN "Digi-Key Part Number"
	1    4950 2550
	-1   0    0    1   
$EndComp
$Comp
L Resistor:R R42
U 1 1 5FE762AA
P 4950 2950
F 0 "R42" H 4650 2850 50  0000 L BNN
F 1 "698" H 4600 2950 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 4950 2950 50  0001 C CNN
F 3 "" H 4950 2950 50  0001 C CNN
F 4 "RES 698 OHM 0.1% 1/10W 0402" H 4950 2950 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 4950 2950 50  0001 C CNN "Manufacturer"
F 6 "RP73PF1E698RBTD" H 4950 2950 50  0001 C CNN "Manufacturer Part Number"
F 7 "A127304CT-ND" H 4950 2950 50  0001 C CNN "Digi-Key Part Number"
	1    4950 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 2350 5050 2350
Wire Wire Line
	5050 2350 5050 2400
$Comp
L power:GND #PWR082
U 1 1 5FE79FFA
P 5050 3150
F 0 "#PWR082" H 5050 2900 50  0001 C CNN
F 1 "GND" H 5055 2977 50  0000 C CNN
F 2 "" H 5050 3150 50  0001 C CNN
F 3 "" H 5050 3150 50  0001 C CNN
	1    5050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3100 5050 3150
$Comp
L Capacitor_Ceramic:C C40
U 1 1 5FE7C2DF
P 4900 1650
F 0 "C40" V 4921 1515 50  0000 R CNN
F 1 "10uF" V 4830 1515 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0805_2012Metric" H 4750 1850 50  0001 C CNN
F 3 "" H 4750 1850 50  0001 C CNN
F 4 "CAP CER 10UF 16V X7R 0805" V 4900 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 4900 1650 50  0001 C CNN "Manufacturer"
F 6 "EMK212BB7106KG-T" V 4900 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-6139-1-ND" V 4900 1650 50  0001 C CNN "Digi-Key Part Number"
	1    4900 1650
	0    -1   -1   0   
$EndComp
$Comp
L Capacitor_Ceramic:C C41
U 1 1 5FE7D200
P 5300 1650
F 0 "C41" V 5321 1515 50  0000 R CNN
F 1 "10uF" V 5230 1515 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0805_2012Metric" H 5150 1850 50  0001 C CNN
F 3 "" H 5150 1850 50  0001 C CNN
F 4 "CAP CER 10UF 16V X7R 0805" V 5300 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 5300 1650 50  0001 C CNN "Manufacturer"
F 6 "EMK212BB7106KG-T" V 5300 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-6139-1-ND" V 5300 1650 50  0001 C CNN "Digi-Key Part Number"
	1    5300 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR081
U 1 1 5FE7FB81
P 4900 1850
F 0 "#PWR081" H 4900 1600 50  0001 C CNN
F 1 "GND" H 4905 1677 50  0000 C CNN
F 2 "" H 4900 1850 50  0001 C CNN
F 3 "" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR083
U 1 1 5FE80D3D
P 5300 1850
F 0 "#PWR083" H 5300 1600 50  0001 C CNN
F 1 "GND" H 5305 1677 50  0000 C CNN
F 2 "" H 5300 1850 50  0001 C CNN
F 3 "" H 5300 1850 50  0001 C CNN
	1    5300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1800 5300 1850
Wire Wire Line
	4900 1800 4900 1850
Wire Wire Line
	5650 1450 5300 1450
Wire Wire Line
	5300 1450 5300 1500
Wire Wire Line
	5300 1450 4900 1450
Wire Wire Line
	4900 1450 4900 1500
Connection ~ 5300 1450
Wire Wire Line
	5050 2700 5050 2750
Wire Wire Line
	5650 1450 5650 2350
Connection ~ 5050 2350
Wire Wire Line
	4100 2900 4100 2750
Wire Wire Line
	4100 2750 5050 2750
Connection ~ 5050 2750
Wire Wire Line
	5050 2750 5050 2800
Wire Wire Line
	4100 2750 4100 2450
Connection ~ 4100 2750
Wire Wire Line
	3350 2250 3350 2450
Wire Wire Line
	3400 2450 3350 2450
Connection ~ 3350 2450
Wire Wire Line
	3350 2450 3350 2900
Wire Wire Line
	3350 2900 3400 2900
Wire Wire Line
	5050 2350 5650 2350
Wire Wire Line
	3700 2450 4100 2450
Connection ~ 4100 2450
Wire Wire Line
	4100 2450 4100 2350
Wire Wire Line
	3700 2050 4100 2050
Wire Wire Line
	4100 2050 4100 2350
Connection ~ 4100 2350
$Comp
L Diode:SS14HE D10
U 1 1 5FEA0696
P 3850 1650
F 0 "D10" V 3800 1750 50  0000 L CNN
F 1 "SS14HE" V 3900 1750 50  0000 L BNN
F 2 "Diode:SOD-323HE" H 3860 1800 50  0001 C CNN
F 3 "https://www.onsemi.com/pdf/datasheet/ss13he-d.pdf" H 3860 1800 50  0001 C CNN
F 4 "DIODE SCHOTTKY 40V 1A SOD323HE" H 3850 1650 50  0001 C CNN "Description"
F 5 "ON Semiconductor" H 3850 1650 50  0001 C CNN "Manufacturer"
F 6 "SS14HE" H 3850 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "SS14HECT-ND" H 3850 1650 50  0001 C CNN "Digi-Key Part Number"
F 8 "SS14" H 3850 1650 50  0001 C CNN "Base Part Number"
F 9 "Diode Schottky 40V 1A Surface Mount SOD-323HE" H 3850 1650 50  0001 C CNN "Detailed Description"
	1    3850 1650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR078
U 1 1 5FEA1CA0
P 3850 1850
F 0 "#PWR078" H 3850 1600 50  0001 C CNN
F 1 "GND" H 3855 1677 50  0000 C CNN
F 2 "" H 3850 1850 50  0001 C CNN
F 3 "" H 3850 1850 50  0001 C CNN
	1    3850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1800 3850 1850
Wire Wire Line
	3750 1450 3850 1450
Wire Wire Line
	3850 1450 3850 1500
Connection ~ 3750 1450
$Comp
L Inductor:LQH44PN220MP0L L2
U 1 1 5FEA69EC
P 4350 1450
F 0 "L2" H 4350 1550 50  0000 C CNN
F 1 "LQH44PN220MP0L" H 4350 1400 50  0001 C CNN
F 2 "Inductor:L_1515_4040Metric" H 4350 1450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Murata%20PDFs/LQx_Land-Patterns.pdf" H 4350 1450 50  0001 C CNN
F 4 "FIXED IND 22UH 790MA 444 MOHM" H 4350 1450 50  0001 C CNN "Description"
F 5 "22µH Shielded Wirewound Inductor 790mA 444mOhm Max Nonstandard" H 4350 1450 50  0001 C CNN "Detailed Description"
F 6 "490-5331-1-ND" H 4350 1450 50  0001 C CNN "Digi-Key Part Number"
F 7 "22µH" H 4350 1400 50  0000 C CNN "Inductance"
F 8 "Murata Electronics" H 4350 1450 50  0001 C CNN "Manufacturer"
F 9 "LQH44PN220MP0L" H 4350 1450 50  0001 C CNN "Manufacturer Part Number"
	1    4350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1450 4100 1450
Connection ~ 3850 1450
Wire Wire Line
	4600 1450 4900 1450
Connection ~ 4900 1450
$Comp
L Diode:D_ZENNER D11
U 1 1 5FE73A35
P 5900 1750
F 0 "D11" V 5854 1828 50  0000 L CNN
F 1 "ESDA7P120" V 5945 1828 50  0000 L CNN
F 2 "Diode:D_0603_1610Metric" H 5910 1900 50  0001 C CNN
F 3 "" H 5910 1900 50  0001 C CNN
F 4 "TVS DIODE 5.5V 11.5V 1610" V 5900 1750 50  0001 C CNN "Description"
F 5 "STMicroelectronics" V 5900 1750 50  0001 C CNN "Manufacturer"
F 6 "ESDA7P120-1U1M" V 5900 1750 50  0001 C CNN "Manufacturer Part Number"
F 7 "497-17159-1-ND" V 5900 1750 50  0001 C CNN "Digi-Key Part Number"
	1    5900 1750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR086
U 1 1 5FE74BE2
P 5900 1950
F 0 "#PWR086" H 5900 1700 50  0001 C CNN
F 1 "GND" H 5905 1777 50  0000 C CNN
F 2 "" H 5900 1950 50  0001 C CNN
F 3 "" H 5900 1950 50  0001 C CNN
	1    5900 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1900 5900 1950
Wire Wire Line
	5650 1450 5900 1450
Wire Wire Line
	5900 1450 5900 1600
Connection ~ 5650 1450
Text Label 6600 1450 2    50   ~ 0
+5V_UNFILTERED
Wire Wire Line
	5900 1450 6600 1450
Connection ~ 5900 1450
Text Label 7200 1450 0    50   ~ 0
+5V_UNFILTERED
$Comp
L Inductor:ACP3225-102-2P-T000 L3
U 1 1 5FE9F1B9
P 8150 1700
F 0 "L3" H 8150 1400 50  0000 C CNN
F 1 "ACP3225-102-2P-T000" H 8150 1350 50  0001 C CNN
F 2 "Inductor:ACP3225" H 8150 1675 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/cmf_commercial_power_acp3225_en.pdf" H 8150 1675 50  0001 C CNN
F 4 "CMC 1.5A 2LN 1 KOHM SMD" H 8150 1700 50  0001 C CNN "Description"
F 5 "2 Line Common Mode Choke Surface Mount 1 kOhms @ 100MHz 1.5A DCR 50mOhm (Typ)" H 8150 1700 50  0001 C CNN "Detailed Description"
F 6 "445-8637-1-ND" H 8150 1700 50  0001 C CNN "Digi-Key Part Number"
F 7 "TDK Corporation" H 8150 1700 50  0001 C CNN "Manufacturer"
F 8 "ACP3225-102-2P-T000" H 8150 1700 50  0001 C CNN "Manufacturer Part Number"
	1    8150 1700
	1    0    0    1   
$EndComp
Wire Wire Line
	7200 1450 7900 1450
$Comp
L power:GND #PWR087
U 1 1 5FEA3E5C
P 7200 1800
F 0 "#PWR087" H 7200 1550 50  0001 C CNN
F 1 "GND" H 7205 1627 50  0000 C CNN
F 2 "" H 7200 1800 50  0001 C CNN
F 3 "" H 7200 1800 50  0001 C CNN
	1    7200 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1800 7200 1700
Wire Wire Line
	7200 1700 7900 1700
$Comp
L Capacitor_Ceramic:C C45
U 1 1 5FEA788C
P 8750 1650
F 0 "C45" V 8850 1400 50  0000 L BNN
F 1 "10nF" V 8750 1300 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 8600 1850 50  0001 C CNN
F 3 "" H 8600 1850 50  0001 C CNN
F 4 "CAP CER 10000PF 50V X7R 0402" V 8750 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 8750 1650 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7103KV-F" V 8750 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-2238-1-ND" V 8750 1650 50  0001 C CNN "Digi-Key Part Number"
	1    8750 1650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8400 1450 8750 1450
Wire Wire Line
	8750 1450 8750 1500
$Comp
L Inductor:BLM15PG100SN1D FB3
U 1 1 5FEB68A7
P 9250 1450
F 0 "FB3" H 9150 1600 50  0000 L BNN
F 1 "BLM15PG100SN1D" H 9550 1550 50  0001 C CNN
F 2 "Inductor:L_0402_1005Metric" H 9550 1600 50  0001 C CNN
F 3 "https://www.murata.com/en-us/products/productdata/8796740059166/ENFA0018.pdf" H 9550 1600 50  0001 C CNN
F 4 "FERRITE BEAD 10 OHM 0402 1LN" H 9250 1450 50  0001 C CNN "Description"
F 5 "10 Ohms @ 100MHz 1 Power Line Ferrite Bead 0402 (1005 Metric) 1A 25mOhm" H 9250 1450 50  0001 C CNN "Detailed Description"
F 6 "490-5976-1-ND" H 9250 1450 50  0001 C CNN "Digi-Key Part Number"
F 7 "Murata Electronics" H 9250 1450 50  0001 C CNN "Manufacturer"
F 8 "BLM15PG100SN1D" H 9250 1450 50  0001 C CNN "Manufacturer Part Number"
	1    9250 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 1450 9050 1450
Connection ~ 8750 1450
$Comp
L Capacitor_Ceramic:C C47
U 1 1 5FEBA8AF
P 9400 1650
F 0 "C47" V 9350 1800 50  0000 L BNN
F 1 "0.1uF" V 9450 1800 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 9250 1850 50  0001 C CNN
F 3 "" H 9250 1850 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V X7R 0402" V 9400 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 9400 1650 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7104KV-FR" V 9400 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-3498-1-ND" V 9400 1650 50  0001 C CNN "Digi-Key Part Number"
	1    9400 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 1450 9400 1450
Wire Wire Line
	9400 1450 9400 1500
Wire Wire Line
	8400 1850 8750 1850
Wire Wire Line
	8750 1850 8750 1800
Wire Wire Line
	8400 1700 8400 1850
Wire Wire Line
	8750 1850 9400 1850
Wire Wire Line
	9400 1850 9400 1800
Connection ~ 8750 1850
$Comp
L Capacitor_Ceramic:C C48
U 1 1 5FEBFC34
P 9850 1650
F 0 "C48" V 9800 1800 50  0000 L BNN
F 1 "4.7uF" V 9900 1800 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0805_2012Metric" H 9700 1850 50  0001 C CNN
F 3 "" H 9700 1850 50  0001 C CNN
F 4 "CAP CER 4.7UF 25V X7R 0805" V 9850 1650 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 9850 1650 50  0001 C CNN "Manufacturer"
F 6 "TMK212AB7475KG-T" V 9850 1650 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-2990-1-ND" V 9850 1650 50  0001 C CNN "Digi-Key Part Number"
	1    9850 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 1450 9850 1450
Wire Wire Line
	9850 1450 9850 1500
Connection ~ 9400 1450
Wire Wire Line
	9400 1850 9850 1850
Wire Wire Line
	9850 1850 9850 1800
Connection ~ 9400 1850
$Comp
L power:+5VD #PWR094
U 1 1 5FEC5E81
P 10300 1400
F 0 "#PWR094" H 10300 1250 50  0001 C CNN
F 1 "+5VD" H 10315 1573 50  0000 C CNN
F 2 "" H 10300 1400 50  0001 C CNN
F 3 "" H 10300 1400 50  0001 C CNN
	1    10300 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR095
U 1 1 5FEC5E87
P 10300 1900
F 0 "#PWR095" H 10300 1650 50  0001 C CNN
F 1 "GNDD" H 10304 1745 50  0000 C CNN
F 2 "" H 10300 1900 50  0001 C CNN
F 3 "" H 10300 1900 50  0001 C CNN
	1    10300 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1450 10300 1450
Wire Wire Line
	10300 1450 10300 1400
Connection ~ 9850 1450
Wire Wire Line
	9850 1850 10300 1850
Wire Wire Line
	10300 1850 10300 1900
Connection ~ 9850 1850
Text Notes 1800 1100 0    50   ~ 0
DC-DC for +5v
Text Notes 7300 1100 0    50   ~ 0
Filter for +5v rail
$Comp
L Transistor_FET:STL6P3LLH6 Q7
U 1 1 5FEE1D44
P 1800 4200
F 0 "Q7" V 2129 4200 50  0000 C BNN
F 1 "STL6P3LLH6" V 2050 4200 50  0000 C BNN
F 2 "Package_DFN_QFN:8-PowerVDFN" H 1800 4200 50  0001 C CNN
F 3 "https://www.st.com/content/ccc/resource/technical/document/datasheet/3c/90/16/29/a8/76/48/02/DM00064617.pdf/files/DM00064617.pdf/jcr:content/translations/en.DM00064617.pdf" H 1800 4200 50  0001 C CNN
F 4 "MOSFET P-CH 30V 6A POWERFLAT" H 1800 4200 50  0001 C CNN "Description"
F 5 "P-Channel 30V 6A (Tc) 2.9W (Tc) Surface Mount PowerFlat™ (3.3x3.3)" H 1800 4200 50  0001 C CNN "Detailed Description"
F 6 "497-15315-1-ND" H 1800 4200 50  0001 C CNN "Digi-Key Part Number"
F 7 "STMicroelectronics" H 1800 4200 50  0001 C CNN "Manufacturer"
F 8 "STL6P3LLH6" H 1800 4200 50  0001 C CNN "Manufacturer Part Number"
	1    1800 4200
	0    1    -1   0   
$EndComp
$Comp
L Resistor:R R35
U 1 1 5FEE4DF2
P 1450 4300
F 0 "R35" H 1450 4250 50  0000 L BNN
F 1 "100K" H 1450 4350 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 1450 4300 50  0001 C CNN
F 3 "" H 1450 4300 50  0001 C CNN
F 4 "CRGCQ 0402 100K 1%" H 1450 4300 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 1450 4300 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F100K" H 1450 4300 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129651CT-ND" H 1450 4300 50  0001 C CNN "Digi-Key Part Number"
	1    1450 4300
	-1   0    0    1   
$EndComp
$Comp
L Resistor:R R36
U 1 1 5FEE73FD
P 1450 4700
F 0 "R36" H 1450 4650 50  0000 L BNN
F 1 "22K" H 1450 4750 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 1450 4700 50  0001 C CNN
F 3 "" H 1450 4700 50  0001 C CNN
F 4 "CRGCQ 0402 22K 1%" H 1450 4700 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 1450 4700 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F22K" H 1450 4700 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129643CT-ND" H 1450 4700 50  0001 C CNN "Digi-Key Part Number"
	1    1450 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 4150 1550 4100
Wire Wire Line
	1550 4100 1600 4100
Wire Wire Line
	1550 4450 1550 4500
Wire Wire Line
	1550 4500 1800 4500
Wire Wire Line
	1800 4500 1800 4400
Wire Wire Line
	1550 4550 1550 4500
Connection ~ 1550 4500
$Comp
L Resistor:R R38
U 1 1 5FEF12C2
P 2000 4600
F 0 "R38" V 1800 4500 50  0000 L BNN
F 1 "100" V 2050 4500 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 2000 4600 50  0001 C CNN
F 3 "" H 2000 4600 50  0001 C CNN
F 4 "CRGCQ 0402 100R 1%" H 2000 4600 50  0001 C CNN "Description"
F 5 "TE Connectivity Passive Product" H 2000 4600 50  0001 C CNN "Manufacturer"
F 6 "CRGCQ0402F100R" H 2000 4600 50  0001 C CNN "Manufacturer Part Number"
F 7 "A129615CT-ND" H 2000 4600 50  0001 C CNN "Digi-Key Part Number"
	1    2000 4600
	0    1    1    0   
$EndComp
$Comp
L Capacitor_Ceramic:C C34
U 1 1 5FEF12CC
P 2200 4300
F 0 "C34" V 2221 4165 50  0000 R CNN
F 1 "0.1uF" V 2130 4165 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 2050 4500 50  0001 C CNN
F 3 "" H 2050 4500 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V X7R 0402" V 2200 4300 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 2200 4300 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7104KV-FR" V 2200 4300 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-3498-1-ND" V 2200 4300 50  0001 C CNN "Digi-Key Part Number"
	1    2200 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 4500 2200 4500
Wire Wire Line
	2200 4500 2200 4450
Wire Wire Line
	1800 4500 1850 4500
Connection ~ 1800 4500
Wire Wire Line
	2000 4100 2200 4100
Wire Wire Line
	2200 4100 2200 4150
$Comp
L power:+5VD #PWR072
U 1 1 5FEF7459
P 1050 4050
F 0 "#PWR072" H 1050 3900 50  0001 C CNN
F 1 "+5VD" H 1065 4223 50  0000 C CNN
F 2 "" H 1050 4050 50  0001 C CNN
F 3 "" H 1050 4050 50  0001 C CNN
	1    1050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4050 1050 4100
Wire Wire Line
	1050 4100 1550 4100
Connection ~ 1550 4100
$Comp
L Inductor:ACP3225-102-2P-T000 L1
U 1 1 5FF05F16
P 2950 4350
F 0 "L1" H 2950 4050 50  0000 C CNN
F 1 "ACP3225-102-2P-T000" H 2950 4000 50  0001 C CNN
F 2 "Inductor:ACP3225" H 2950 4325 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/cmf_commercial_power_acp3225_en.pdf" H 2950 4325 50  0001 C CNN
F 4 "CMC 1.5A 2LN 1 KOHM SMD" H 2950 4350 50  0001 C CNN "Description"
F 5 "2 Line Common Mode Choke Surface Mount 1 kOhms @ 100MHz 1.5A DCR 50mOhm (Typ)" H 2950 4350 50  0001 C CNN "Detailed Description"
F 6 "445-8637-1-ND" H 2950 4350 50  0001 C CNN "Digi-Key Part Number"
F 7 "TDK Corporation" H 2950 4350 50  0001 C CNN "Manufacturer"
F 8 "ACP3225-102-2P-T000" H 2950 4350 50  0001 C CNN "Manufacturer Part Number"
	1    2950 4350
	1    0    0    1   
$EndComp
$Comp
L Capacitor_Ceramic:C C37
U 1 1 5FF05F29
P 3550 4300
F 0 "C37" V 3650 4000 50  0000 L BNN
F 1 "10nF" V 3550 3950 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 3400 4500 50  0001 C CNN
F 3 "" H 3400 4500 50  0001 C CNN
F 4 "CAP CER 10000PF 50V X7R 0402" V 3550 4300 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 3550 4300 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7103KV-F" V 3550 4300 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-2238-1-ND" V 3550 4300 50  0001 C CNN "Digi-Key Part Number"
	1    3550 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 4100 3550 4100
Wire Wire Line
	3550 4100 3550 4150
$Comp
L Inductor:BLM15PG100SN1D FB2
U 1 1 5FF05F35
P 4050 4100
F 0 "FB2" H 3950 4250 50  0000 L BNN
F 1 "BLM15PG100SN1D" H 4350 4200 50  0001 C CNN
F 2 "Inductor:L_0402_1005Metric" H 4350 4250 50  0001 C CNN
F 3 "https://www.murata.com/en-us/products/productdata/8796740059166/ENFA0018.pdf" H 4350 4250 50  0001 C CNN
F 4 "FERRITE BEAD 10 OHM 0402 1LN" H 4050 4100 50  0001 C CNN "Description"
F 5 "10 Ohms @ 100MHz 1 Power Line Ferrite Bead 0402 (1005 Metric) 1A 25mOhm" H 4050 4100 50  0001 C CNN "Detailed Description"
F 6 "490-5976-1-ND" H 4050 4100 50  0001 C CNN "Digi-Key Part Number"
F 7 "Murata Electronics" H 4050 4100 50  0001 C CNN "Manufacturer"
F 8 "BLM15PG100SN1D" H 4050 4100 50  0001 C CNN "Manufacturer Part Number"
	1    4050 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4100 3850 4100
Connection ~ 3550 4100
$Comp
L Capacitor_Ceramic:C C38
U 1 1 5FF05F41
P 4550 4300
F 0 "C38" V 4500 4450 50  0000 L BNN
F 1 "0.1uF" V 4600 4450 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 4400 4500 50  0001 C CNN
F 3 "" H 4400 4500 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V X7R 0402" V 4550 4300 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 4550 4300 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7104KV-FR" V 4550 4300 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-3498-1-ND" V 4550 4300 50  0001 C CNN "Digi-Key Part Number"
	1    4550 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 4500 3550 4500
Wire Wire Line
	3550 4500 3550 4450
Wire Wire Line
	3200 4350 3200 4500
Connection ~ 3550 4500
$Comp
L power:GNDD #PWR076
U 1 1 5FF05F65
P 2700 4550
F 0 "#PWR076" H 2700 4300 50  0001 C CNN
F 1 "GNDD" H 2704 4395 50  0000 C CNN
F 2 "" H 2700 4550 50  0001 C CNN
F 3 "" H 2700 4550 50  0001 C CNN
	1    2700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4100 2700 4100
Connection ~ 2200 4100
$Comp
L power:GNDA #PWR080
U 1 1 5FF1565E
P 4550 4550
F 0 "#PWR080" H 4550 4300 50  0001 C CNN
F 1 "GNDA" H 4555 4377 50  0000 C CNN
F 2 "" H 4550 4550 50  0001 C CNN
F 3 "" H 4550 4550 50  0001 C CNN
	1    4550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4350 2700 4550
Wire Wire Line
	4550 4500 4550 4450
Wire Wire Line
	3550 4500 4550 4500
Wire Wire Line
	4550 4500 4550 4550
Connection ~ 4550 4500
Wire Wire Line
	4550 4100 4550 4150
Wire Wire Line
	4150 4100 4550 4100
$Comp
L power:+5VA #PWR079
U 1 1 5FF28EAE
P 4550 4050
F 0 "#PWR079" H 4550 3900 50  0001 C CNN
F 1 "+5VA" H 4565 4223 50  0000 C CNN
F 2 "" H 4550 4050 50  0001 C CNN
F 3 "" H 4550 4050 50  0001 C CNN
	1    4550 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4050 4550 4100
Connection ~ 4550 4100
Text Notes 2250 3650 0    50   ~ 0
Switch for +5v in analog circuits
$Comp
L Power_Management:LM27761DSGR U9
U 1 1 5FF50314
P 7300 4100
F 0 "U9" H 7300 4365 50  0000 C CNN
F 1 "LM27761DSGR" H 7300 4274 50  0000 C CNN
F 2 "Package_SON:WSON-8-EP_P0.5mm" H 7100 4100 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm27761.pdf" H 7100 4100 50  0001 C CNN
F 4 "IC REG CHARGE PUMP ADJ 8WSON" H 7300 4100 50  0001 C CNN "Description"
F 5 "Charge Pump Switching Regulator IC Negative Adjustable -1.5V 1 Output 250mA 8-WFDFN Exposed Pad" H 7300 4100 50  0001 C CNN "Detailed Description"
F 6 "296-44379-1-ND" H 7300 4100 50  0001 C CNN "Digi-Key Part Number"
F 7 "Texas Instruments" H 7300 4100 50  0001 C CNN "Manufacturer"
F 8 "LM27761DSGR" H 7300 4100 50  0001 C CNN "Manufacturer Part Number"
	1    7300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4600 7250 4750
Wire Wire Line
	7250 4750 7350 4750
Wire Wire Line
	7350 4750 7350 4600
$Comp
L power:GNDA #PWR088
U 1 1 5FF5533A
P 7350 4900
F 0 "#PWR088" H 7350 4650 50  0001 C CNN
F 1 "GNDA" H 7355 4727 50  0000 C CNN
F 2 "" H 7350 4900 50  0001 C CNN
F 3 "" H 7350 4900 50  0001 C CNN
	1    7350 4900
	1    0    0    -1  
$EndComp
Connection ~ 7350 4750
Wire Wire Line
	7350 4750 7350 4900
$Comp
L power:+5VA #PWR084
U 1 1 5FF60A0A
P 5850 4050
F 0 "#PWR084" H 5850 3900 50  0001 C CNN
F 1 "+5VA" H 5865 4223 50  0000 C CNN
F 2 "" H 5850 4050 50  0001 C CNN
F 3 "" H 5850 4050 50  0001 C CNN
	1    5850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4050 5850 4100
Connection ~ 5850 4100
$Comp
L power:-5VA #PWR096
U 1 1 5FF6CA81
P 10550 4050
F 0 "#PWR096" H 10550 4150 50  0001 C CNN
F 1 "-5VA" H 10565 4223 50  0000 C CNN
F 2 "" H 10550 4050 50  0001 C CNN
F 3 "" H 10550 4050 50  0001 C CNN
	1    10550 4050
	1    0    0    -1  
$EndComp
$Comp
L Capacitor_Ceramic:C C43
U 1 1 5FF7C819
P 6350 4500
F 0 "C43" V 6371 4365 50  0000 R CNN
F 1 "0.47uF" V 6280 4365 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 6200 4700 50  0001 C CNN
F 3 "" H 6200 4700 50  0001 C CNN
F 4 "CAP CER 0.47UF 10V X7R 0402" V 6350 4500 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 6350 4500 50  0001 C CNN "Manufacturer"
F 6 "LMK105B7474KV-F" V 6350 4500 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-5912-1-ND" V 6350 4500 50  0001 C CNN "Digi-Key Part Number"
	1    6350 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 4350 6350 4300
Wire Wire Line
	6350 4300 6800 4300
Wire Wire Line
	6350 4650 6750 4650
Wire Wire Line
	6750 4650 6750 4400
Wire Wire Line
	6750 4400 6800 4400
$Comp
L Capacitor_Ceramic:C C44
U 1 1 5FF857FB
P 7950 4500
F 0 "C44" V 7971 4365 50  0000 R CNN
F 1 "4.7uF" V 7880 4365 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0805_2012Metric" H 7800 4700 50  0001 C CNN
F 3 "" H 7800 4700 50  0001 C CNN
F 4 "CAP CER 4.7UF 10V X7R 0805" V 7950 4500 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 7950 4500 50  0001 C CNN "Manufacturer"
F 6 "LMK212B7475KG-T" V 7950 4500 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-1442-1-ND" V 7950 4500 50  0001 C CNN "Digi-Key Part Number"
	1    7950 4500
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR089
U 1 1 5FF869B8
P 7950 4900
F 0 "#PWR089" H 7950 4650 50  0001 C CNN
F 1 "GNDA" H 7955 4727 50  0000 C CNN
F 2 "" H 7950 4900 50  0001 C CNN
F 3 "" H 7950 4900 50  0001 C CNN
	1    7950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4650 7950 4900
Wire Wire Line
	7800 4300 7950 4300
Wire Wire Line
	7950 4300 7950 4350
Wire Wire Line
	7800 4100 8500 4100
$Comp
L Capacitor_Ceramic:C C46
U 1 1 5FF93BEA
P 9000 4450
F 0 "C46" V 9021 4315 50  0000 R CNN
F 1 "2.2uF" V 8930 4315 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0603_1608Metric" H 8850 4650 50  0001 C CNN
F 3 "" H 8850 4650 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X7R 0603" V 9000 4450 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 9000 4450 50  0001 C CNN "Manufacturer"
F 6 "LMK107B7225KA-T" V 9000 4450 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-2983-1-ND" V 9000 4450 50  0001 C CNN "Digi-Key Part Number"
	1    9000 4450
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR091
U 1 1 5FF96075
P 9000 4900
F 0 "#PWR091" H 9000 4650 50  0001 C CNN
F 1 "GNDA" H 9005 4727 50  0000 C CNN
F 2 "" H 9000 4900 50  0001 C CNN
F 3 "" H 9000 4900 50  0001 C CNN
	1    9000 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4600 9000 4900
Wire Wire Line
	9000 4300 9000 4100
$Comp
L Capacitor_Ceramic:C C42
U 1 1 5FF9EE21
P 5850 4500
F 0 "C42" V 5871 4365 50  0000 R CNN
F 1 "4.7uF" V 5780 4365 50  0000 R CNN
F 2 "Capacitor_Ceramic:C_0805_2012Metric" H 5700 4700 50  0001 C CNN
F 3 "" H 5700 4700 50  0001 C CNN
F 4 "CAP CER 4.7UF 10V X7R 0805" V 5850 4500 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 5850 4500 50  0001 C CNN "Manufacturer"
F 6 "LMK212B7475KG-T" V 5850 4500 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-1442-1-ND" V 5850 4500 50  0001 C CNN "Digi-Key Part Number"
	1    5850 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 4100 6700 4100
Wire Wire Line
	5850 4100 5850 4350
Wire Wire Line
	6800 4200 6700 4200
Wire Wire Line
	6700 4200 6700 4100
Connection ~ 6700 4100
Wire Wire Line
	6700 4100 6800 4100
$Comp
L power:GNDA #PWR085
U 1 1 5FFB48A8
P 5850 4900
F 0 "#PWR085" H 5850 4650 50  0001 C CNN
F 1 "GNDA" H 5855 4727 50  0000 C CNN
F 2 "" H 5850 4900 50  0001 C CNN
F 3 "" H 5850 4900 50  0001 C CNN
	1    5850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4650 5850 4900
$Comp
L Resistor:R R43
U 1 1 5FFB979C
P 8400 4300
F 0 "R43" H 8050 4200 50  0000 L BNN
F 1 "187K" H 8000 4300 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 8400 4300 50  0001 C CNN
F 3 "" H 8400 4300 50  0001 C CNN
F 4 "RES SMD 187K OHM 1% 1/16W 0402" H 8400 4300 50  0001 C CNN "Description"
F 5 "Yageo" H 8400 4300 50  0001 C CNN "Manufacturer"
F 6 "RC0402FR-07187KL" H 8400 4300 50  0001 C CNN "Manufacturer Part Number"
F 7 "311-187KLRCT-ND" H 8400 4300 50  0001 C CNN "Digi-Key Part Number"
	1    8400 4300
	-1   0    0    1   
$EndComp
$Comp
L Resistor:R R44
U 1 1 5FFBA7DB
P 8400 4700
F 0 "R44" H 8050 4600 50  0000 L BNN
F 1 "82K" H 8050 4700 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 8400 4700 50  0001 C CNN
F 3 "" H 8400 4700 50  0001 C CNN
F 4 "RES SMD 82K OHM 1% 1/16W 0402" H 8400 4700 50  0001 C CNN "Description"
F 5 "Yageo" H 8400 4700 50  0001 C CNN "Manufacturer"
F 6 "RC0402FR-0782KL" H 8400 4700 50  0001 C CNN "Manufacturer Part Number"
F 7 "311-82.0KLRCT-ND" H 8400 4700 50  0001 C CNN "Digi-Key Part Number"
	1    8400 4700
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR090
U 1 1 5FFBAC44
P 8500 4900
F 0 "#PWR090" H 8500 4650 50  0001 C CNN
F 1 "GNDA" H 8505 4727 50  0000 C CNN
F 2 "" H 8500 4900 50  0001 C CNN
F 3 "" H 8500 4900 50  0001 C CNN
	1    8500 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4850 8500 4900
Wire Wire Line
	8500 4450 8500 4500
Wire Wire Line
	8500 4100 8500 4150
Connection ~ 8500 4100
Wire Wire Line
	8500 4100 9000 4100
Wire Wire Line
	7800 4200 8350 4200
Wire Wire Line
	8350 4200 8350 4500
Wire Wire Line
	8350 4500 8500 4500
Connection ~ 8500 4500
Wire Wire Line
	8500 4500 8500 4550
$Comp
L Resistor:R R37
U 1 1 5FFCFCC8
P 1800 3650
F 0 "R37" V 1800 3700 50  0000 L BNN
F 1 "NC" V 1800 3500 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 1800 3650 50  0001 C CNN
F 3 "" H 1800 3650 50  0001 C CNN
	1    1800 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 3750 2200 3750
Wire Wire Line
	2200 3750 2200 4100
Wire Wire Line
	1550 3750 1650 3750
Wire Wire Line
	1550 3750 1550 4100
$Comp
L Resistor:R R45
U 1 1 5FFE3D64
P 9550 4500
F 0 "R45" H 9550 4500 50  0000 L BNN
F 1 "NC" H 9550 4400 50  0000 L BNN
F 2 "Resistor:R_0402_1005Metric" H 9550 4500 50  0001 C CNN
F 3 "" H 9550 4500 50  0001 C CNN
	1    9550 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4100 9450 4100
Connection ~ 9000 4100
Wire Wire Line
	9450 4100 9450 4350
$Comp
L power:GNDA #PWR092
U 1 1 5FFEF6EE
P 9450 4900
F 0 "#PWR092" H 9450 4650 50  0001 C CNN
F 1 "GNDA" H 9455 4727 50  0000 C CNN
F 2 "" H 9450 4900 50  0001 C CNN
F 3 "" H 9450 4900 50  0001 C CNN
	1    9450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4650 9450 4900
$Comp
L Inductor:BLM15PG100SN1D FB4
U 1 1 6002B014
P 9900 4100
F 0 "FB4" H 9850 4250 50  0000 L BNN
F 1 "BLM15PG100SN1D" H 10200 4200 50  0001 C CNN
F 2 "Inductor:L_0402_1005Metric" H 10200 4250 50  0001 C CNN
F 3 "https://www.murata.com/en-us/products/productdata/8796740059166/ENFA0018.pdf" H 10200 4250 50  0001 C CNN
F 4 "FERRITE BEAD 10 OHM 0402 1LN" H 9900 4100 50  0001 C CNN "Description"
F 5 "10 Ohms @ 100MHz 1 Power Line Ferrite Bead 0402 (1005 Metric) 1A 25mOhm" H 9900 4100 50  0001 C CNN "Detailed Description"
F 6 "490-5976-1-ND" H 9900 4100 50  0001 C CNN "Digi-Key Part Number"
F 7 "Murata Electronics" H 9900 4100 50  0001 C CNN "Manufacturer"
F 8 "BLM15PG100SN1D" H 9900 4100 50  0001 C CNN "Manufacturer Part Number"
	1    9900 4100
	1    0    0    -1  
$EndComp
$Comp
L Capacitor_Ceramic:C C49
U 1 1 6002B01F
P 10050 4450
F 0 "C49" V 10000 4600 50  0000 L BNN
F 1 "0.1uF" V 10100 4600 50  0000 L BNN
F 2 "Capacitor_Ceramic:C_0402_1005Metric" H 9900 4650 50  0001 C CNN
F 3 "" H 9900 4650 50  0001 C CNN
F 4 "CAP CER 0.1UF 50V X7R 0402" V 10050 4450 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" V 10050 4450 50  0001 C CNN "Manufacturer"
F 6 "UMK105B7104KV-FR" V 10050 4450 50  0001 C CNN "Manufacturer Part Number"
F 7 "587-3498-1-ND" V 10050 4450 50  0001 C CNN "Digi-Key Part Number"
	1    10050 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 4100 10050 4100
Wire Wire Line
	10050 4100 10550 4100
Wire Wire Line
	10550 4100 10550 4050
Connection ~ 10050 4100
Wire Wire Line
	9450 4100 9700 4100
Connection ~ 9450 4100
$Comp
L power:GNDA #PWR093
U 1 1 60043443
P 10050 4900
F 0 "#PWR093" H 10050 4650 50  0001 C CNN
F 1 "GNDA" H 10055 4727 50  0000 C CNN
F 2 "" H 10050 4900 50  0001 C CNN
F 3 "" H 10050 4900 50  0001 C CNN
	1    10050 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 4600 10050 4900
Wire Wire Line
	10050 4100 10050 4300
Text GLabel 1450 4950 0    50   Input ~ 0
+5VA_SHTDN
Wire Wire Line
	1450 4950 1550 4950
Wire Wire Line
	1550 4950 1550 4850
$EndSCHEMATC
