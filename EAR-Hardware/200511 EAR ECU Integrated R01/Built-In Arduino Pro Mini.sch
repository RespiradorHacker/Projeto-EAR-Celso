EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "200511 - EAR Integrated ECU FR4 SMT R01"
Date "2020-05-11"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7000 4500 0    50   Input ~ 10
D9
Text HLabel 7000 4400 0    50   Input ~ 10
D8
Text HLabel 7000 4300 0    50   Input ~ 10
D7
Text HLabel 7000 4200 0    50   Input ~ 10
D6
Text HLabel 7000 4100 0    50   Input ~ 10
D5
Text HLabel 7000 4000 0    50   Input ~ 10
D4
Text HLabel 7000 3900 0    50   Input ~ 10
D3
Text HLabel 7000 3800 0    50   Input ~ 10
D2
Text HLabel 7000 3700 0    50   Input ~ 10
GND
Text HLabel 7000 3600 0    50   Input ~ 10
RST
Text HLabel 7000 3500 0    50   Input ~ 10
RXI
Text HLabel 7000 3400 0    50   Input ~ 10
TXI
Text Label 7700 2800 1    60   ~ 12
DTR
Text Label 7900 2800 1    60   ~ 12
RXI
Text Label 7125 3400 0    60   ~ 12
TXO
Text Label 7125 3500 0    60   ~ 12
RXI
Text Label 7125 3600 0    60   ~ 12
Reset
Text Label 8625 3600 0    60   ~ 12
Reset
Text Label 7125 3800 0    60   ~ 12
D2
Text Label 7125 3900 0    60   ~ 12
D3
Text Label 7125 4000 0    60   ~ 12
D4
Text Label 7125 4100 0    60   ~ 12
D5
Text Label 7125 4200 0    60   ~ 12
D6
Text Label 7125 4300 0    60   ~ 12
D7
Text Label 7125 4400 0    60   ~ 12
D8
Text Label 7125 4500 0    60   ~ 12
D9
Text Label 8625 4500 0    60   ~ 12
D10
Text Label 8625 4400 0    60   ~ 12
MOSI
Text Label 8625 4300 0    60   ~ 12
MISO
Text Label 8625 4200 0    60   ~ 12
SCK
Text Label 8625 4100 0    60   ~ 12
A0
Text Label 8625 4000 0    60   ~ 12
A1
Text Label 8625 3900 0    60   ~ 12
A2
Text Label 8625 3800 0    60   ~ 12
A3
Text Label 7125 4950 0    60   ~ 12
A4
Text Label 7125 4850 0    60   ~ 12
A5
Text Notes 6675 2375 0    60   ~ 12
Shield Arduino Pro Mini \n
Wire Notes Line
	6650 2450 7825 2450
Wire Notes Line
	7825 2450 7825 2275
Text Label 8650 4850 0    60   ~ 12
A7
Text Label 8650 4950 0    60   ~ 12
A6
$Comp
L Connector_Generic:Conn_01x06 P?
U 1 1 5EDC41A2
P 7900 3000
AR Path="/5EDC41A2" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41A2" Ref="P3"  Part="1" 
F 0 "P3" H 7900 3350 50  0000 C CNN
F 1 "PinHeader_01x06" V 8000 3000 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 7900 3000 50  0001 C CNN
F 3 "" H 7900 3000 50  0000 C CNN
	1    7900 3000
	0    -1   1    0   
$EndComp
Text Label 7800 2800 1    60   ~ 12
TXO
$Comp
L power:GND #PWR?
U 1 1 5EDC41A9
P 8350 2800
AR Path="/5EDC41A9" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41A9" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 8350 2550 50  0001 C CNN
F 1 "GND" H 8350 2650 50  0000 C CNN
F 2 "" H 8350 2800 50  0000 C CNN
F 3 "" H 8350 2800 50  0000 C CNN
	1    8350 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EDC41AF
P 8000 2800
AR Path="/5EDC41AF" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41AF" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 8000 2650 50  0001 C CNN
F 1 "VCC" H 8000 2950 50  0000 C CNN
F 2 "" H 8000 2800 50  0000 C CNN
F 3 "" H 8000 2800 50  0000 C CNN
	1    8000 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EDC41C1
P 7375 4600
AR Path="/5EDC41C1" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41C1" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 7375 4350 50  0001 C CNN
F 1 "GND" H 7375 4450 50  0000 C CNN
F 2 "" H 7375 4600 50  0000 C CNN
F 3 "" H 7375 4600 50  0000 C CNN
	1    7375 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7475 3700 7375 3700
Wire Wire Line
	7375 3700 7375 4600
Wire Wire Line
	8375 3500 8475 3500
Wire Wire Line
	8475 3500 8475 4600
$Comp
L power:GND #PWR?
U 1 1 5EDC41D8
P 8475 4600
AR Path="/5EDC41D8" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41D8" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 8475 4350 50  0001 C CNN
F 1 "GND" H 8475 4450 50  0000 C CNN
F 2 "" H 8475 4600 50  0000 C CNN
F 3 "" H 8475 4600 50  0000 C CNN
	1    8475 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8375 3700 8575 3700
Wire Wire Line
	8575 3700 8575 3300
$Comp
L power:VCC #PWR?
U 1 1 5EDC41E0
P 8575 3300
AR Path="/5EDC41E0" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41E0" Ref="#PWR078"  Part="1" 
F 0 "#PWR078" H 8575 3150 50  0001 C CNN
F 1 "VCC" H 8575 3450 50  0000 C CNN
F 2 "" H 8575 3300 50  0000 C CNN
F 3 "" H 8575 3300 50  0000 C CNN
	1    8575 3300
	1    0    0    -1  
$EndComp
Text Notes 7775 3400 0    60   ~ 12
1
Wire Wire Line
	8100 2800 8100 2750
Wire Wire Line
	8100 2750 8200 2750
Wire Wire Line
	8200 2750 8200 2800
Wire Wire Line
	8200 2750 8350 2750
Wire Wire Line
	8350 2750 8350 2800
Connection ~ 8200 2750
Wire Wire Line
	7000 3400 7475 3400
Wire Wire Line
	7000 3500 7475 3500
Wire Wire Line
	7000 3600 7475 3600
Wire Wire Line
	7000 3700 7375 3700
Connection ~ 7375 3700
Wire Wire Line
	7000 3800 7475 3800
Wire Wire Line
	7000 3900 7475 3900
Wire Wire Line
	7000 4000 7475 4000
Wire Wire Line
	7000 4100 7475 4100
Wire Wire Line
	7000 4200 7475 4200
Wire Wire Line
	7000 4300 7475 4300
Wire Wire Line
	7000 4400 7475 4400
Wire Wire Line
	7000 4500 7475 4500
Text HLabel 9275 4500 2    50   Input ~ 10
D10
Text HLabel 9275 4400 2    50   Input ~ 10
D11
Text HLabel 9275 4300 2    50   Input ~ 10
D12
Text HLabel 9275 4200 2    50   Input ~ 10
D13
Text HLabel 9275 4100 2    50   Input ~ 10
A0
Text HLabel 9275 4000 2    50   Input ~ 10
A1
Text HLabel 9275 3900 2    50   Input ~ 10
A2
Text HLabel 9275 3800 2    50   Input ~ 10
A3
Text HLabel 9275 3400 2    50   Input ~ 10
RAW
Text HLabel 9275 3600 2    50   Input ~ 10
RST
Text HLabel 9275 3500 2    50   Input ~ 10
GND
Wire Wire Line
	9275 3500 8475 3500
Connection ~ 8475 3500
Wire Wire Line
	8375 3600 9275 3600
Wire Wire Line
	8375 3800 9275 3800
Wire Wire Line
	8375 3900 9275 3900
Wire Wire Line
	8375 4100 9275 4100
Wire Wire Line
	8375 4000 9275 4000
Wire Wire Line
	8375 4200 9275 4200
Wire Wire Line
	8375 4300 9275 4300
Wire Wire Line
	8375 4400 9275 4400
Wire Wire Line
	8375 4500 9275 4500
Connection ~ 8575 3700
Wire Wire Line
	9275 3700 8575 3700
Text HLabel 9275 3700 2    50   Input ~ 10
VCC
Text HLabel 7000 4850 0    50   Input ~ 10
A5
Text HLabel 7000 4950 0    50   Input ~ 10
A4
Wire Wire Line
	7475 4850 7000 4850
Wire Wire Line
	7000 4950 7475 4950
$Comp
L Connector_Generic:Conn_01x02 P?
U 1 1 5EDC419C
P 8175 4850
AR Path="/5EDC419C" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EDC419C" Ref="P6"  Part="1" 
F 0 "P6" H 8175 5000 50  0000 C CNN
F 1 "PinHeader_01x02" V 8275 4850 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8175 4850 50  0001 C CNN
F 3 "" H 8175 4850 50  0000 C CNN
	1    8175 4850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9275 4850 8375 4850
Wire Wire Line
	9275 4950 8375 4950
$Comp
L power:VCC #PWR?
U 1 1 5E9C4A61
P 3375 2200
AR Path="/5E9C4A61" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9C4A61" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 3375 2050 50  0001 C CNN
F 1 "VCC" H 3375 2350 50  0000 C CNN
F 2 "" H 3375 2200 50  0000 C CNN
F 3 "" H 3375 2200 50  0000 C CNN
	1    3375 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3375 2425 3375 2300
Wire Wire Line
	3375 2300 3475 2300
Wire Wire Line
	3475 2300 3475 2425
Connection ~ 3375 2300
Wire Wire Line
	3375 2300 3375 2200
$Comp
L power:GND #PWR?
U 1 1 5E9C6B0C
P 3375 5750
AR Path="/5E9C6B0C" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9C6B0C" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 3375 5500 50  0001 C CNN
F 1 "GND" H 3375 5600 50  0000 C CNN
F 2 "" H 3375 5750 50  0000 C CNN
F 3 "" H 3375 5750 50  0000 C CNN
	1    3375 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3375 5750 3375 5425
$Comp
L Device:C C?
U 1 1 5E9CAAC2
P 1975 2950
AR Path="/5E9CAAC2" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5E9CAAC2" Ref="C19"  Part="1" 
F 0 "C19" H 2000 3050 50  0000 L CNN
F 1 "100nF X7R" H 2090 2905 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2013 2800 50  0001 C CNN
F 3 "~" H 1975 2950 50  0001 C CNN
	1    1975 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1975 2725 2775 2725
Wire Wire Line
	1975 2800 1975 2725
$Comp
L power:GND #PWR?
U 1 1 5E9CC312
P 1975 3200
AR Path="/5E9CC312" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9CC312" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 1975 2950 50  0001 C CNN
F 1 "GND" H 1975 3050 50  0000 C CNN
F 2 "" H 1975 3200 50  0000 C CNN
F 3 "" H 1975 3200 50  0000 C CNN
	1    1975 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1975 3200 1975 3100
$Comp
L Device:C C?
U 1 1 5E9CD573
P 3075 2300
AR Path="/5E9CD573" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5E9CD573" Ref="C20"  Part="1" 
F 0 "C20" V 3325 2300 50  0000 C CNN
F 1 "10uF MLCC 0805" V 3225 2525 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3113 2150 50  0001 C CNN
F 3 "~" H 3075 2300 50  0001 C CNN
	1    3075 2300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9CDE9E
P 2775 2350
AR Path="/5E9CDE9E" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9CDE9E" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 2775 2100 50  0001 C CNN
F 1 "GND" H 2775 2200 50  0000 C CNN
F 2 "" H 2775 2350 50  0000 C CNN
F 3 "" H 2775 2350 50  0000 C CNN
	1    2775 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 2350 2775 2300
Wire Wire Line
	2775 2300 2925 2300
Wire Wire Line
	3225 2300 3375 2300
Wire Wire Line
	4850 3225 4550 3225
Wire Wire Line
	4550 3225 4550 3325
Wire Wire Line
	4550 3325 3975 3325
Wire Wire Line
	4850 3525 4550 3525
Wire Wire Line
	4550 3525 4550 3425
Wire Wire Line
	4550 3425 3975 3425
$Comp
L power:GND #PWR?
U 1 1 5E9D80BD
P 5450 3625
AR Path="/5E9D80BD" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9D80BD" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 5450 3375 50  0001 C CNN
F 1 "GND" H 5450 3475 50  0000 C CNN
F 2 "" H 5450 3625 50  0000 C CNN
F 3 "" H 5450 3625 50  0000 C CNN
	1    5450 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E9DBF86
P 4650 4000
AR Path="/5E9DBF86" Ref="R?"  Part="1" 
AR Path="/5E9BEB9C/5E9DBF86" Ref="R45"  Part="1" 
F 0 "R45" H 4720 4046 50  0000 L CNN
F 1 "10K" H 4720 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4580 4000 50  0001 C CNN
F 3 "~" H 4650 4000 50  0001 C CNN
	1    4650 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E9DBF92
P 5000 4225
AR Path="/5E9DBF92" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5E9DBF92" Ref="C21"  Part="1" 
F 0 "C21" V 4840 4225 50  0000 C CNN
F 1 "100nF X7R" V 4749 4225 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5038 4075 50  0001 C CNN
F 3 "~" H 5000 4225 50  0001 C CNN
	1    5000 4225
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E9E174A
P 4650 3800
AR Path="/5E9E174A" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5E9E174A" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 4650 3650 50  0001 C CNN
F 1 "VCC" H 4650 3950 50  0000 C CNN
F 2 "" H 4650 3800 50  0000 C CNN
F 3 "" H 4650 3800 50  0000 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3800 4650 3850
Wire Wire Line
	5300 4225 5150 4225
Text Label 3975 2725 0    50   ~ 10
D8
Text Label 3975 2825 0    50   ~ 10
D9
Text Label 3975 2925 0    50   ~ 10
D10
Text Label 3975 3025 0    50   ~ 10
MOSI
Text Label 3975 3125 0    50   ~ 10
MISO
Text Label 3975 3225 0    50   ~ 10
SCK
Text Label 3975 3625 0    50   ~ 10
A0
Text Label 3975 3725 0    50   ~ 10
A1
Text Label 3975 3825 0    50   ~ 10
A2
Text Label 3975 3925 0    50   ~ 10
A3
Text Label 3975 4025 0    50   ~ 10
A4
Text Label 3975 4125 0    50   ~ 10
A5
$Comp
L EAR-ECU-Integrated_CPU_01-rescue:ATmega328-AU-MCU_Microchip_ATmega-EAR-ECU-Integrated_CPU_00-rescue U4
U 1 1 5E9C323C
P 3375 3925
F 0 "U4" H 2800 3000 50  0000 C CNN
F 1 "ATmega328-AU" H 2550 2925 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 3375 3925 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3375 3925 50  0001 C CNN
	1    3375 3925
	1    0    0    -1  
$EndComp
Text Label 2775 2925 2    50   ~ 10
A6
Text Label 2775 3025 2    50   ~ 10
A7
Text Label 3975 4425 0    50   ~ 10
RXI
Text Label 3975 4525 0    50   ~ 10
TXO
Text Label 3975 4625 0    50   ~ 10
D2
Text Label 3975 4725 0    50   ~ 10
D3
Text Label 3975 4825 0    50   ~ 10
D4
Text Label 3975 4925 0    50   ~ 10
D5
Text Label 3975 5025 0    50   ~ 10
D6
Text Label 3975 5125 0    50   ~ 10
D7
Text Label 3975 4225 0    50   ~ 10
Reset
Wire Wire Line
	3975 4225 4650 4225
Wire Wire Line
	4650 4150 4650 4225
Connection ~ 4650 4225
Wire Wire Line
	4650 4225 4850 4225
$Comp
L Connector_Generic:Conn_01x05 P?
U 1 1 5EA1239B
P 7950 5375
AR Path="/5EA1239B" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EA1239B" Ref="P4"  Part="1" 
F 0 "P4" H 7950 5725 50  0000 C CNN
F 1 "PinHeader_01x05" V 8050 5375 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7950 5375 50  0001 C CNN
F 3 "" H 7950 5375 50  0000 C CNN
	1    7950 5375
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA151DB
P 7750 5675
AR Path="/5EA151DB" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EA151DB" Ref="#PWR074"  Part="1" 
F 0 "#PWR074" H 7750 5425 50  0001 C CNN
F 1 "GND" H 7750 5525 50  0000 C CNN
F 2 "" H 7750 5675 50  0000 C CNN
F 3 "" H 7750 5675 50  0000 C CNN
	1    7750 5675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5675 7750 5575
Text Label 7850 5575 3    50   ~ 10
A4
Text Label 7950 5575 3    50   ~ 10
A5
Text Label 8050 5575 3    50   ~ 10
A6
Text Label 8150 5575 3    50   ~ 10
A7
Wire Wire Line
	8375 3400 9275 3400
NoConn ~ 8375 3400
Text Label 8650 3400 0    50   ~ 10
RAW
Text Label 5300 4225 0    60   ~ 12
DTR
Text HLabel 9275 4950 2    50   Input ~ 10
A6
Text HLabel 9275 4850 2    50   Input ~ 10
A7
$Comp
L Device:Crystal X1
U 1 1 5EA879C2
P 4850 3375
F 0 "X1" V 4525 3325 50  0000 L CNN
F 1 "16MHz" V 4600 3250 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 4850 3375 50  0001 C CNN
F 3 "~" H 4850 3375 50  0001 C CNN
	1    4850 3375
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EA8B1E2
P 5175 3225
AR Path="/5EA8B1E2" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5EA8B1E2" Ref="C22"  Part="1" 
F 0 "C22" V 5325 3100 50  0000 C CNN
F 1 "22pF NP0" V 5250 2975 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5213 3075 50  0001 C CNN
F 3 "~" H 5175 3225 50  0001 C CNN
	1    5175 3225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5025 3225 4850 3225
Connection ~ 4850 3225
Connection ~ 4850 3525
Wire Wire Line
	5325 3525 5450 3525
Wire Wire Line
	5450 3525 5450 3625
Wire Wire Line
	5325 3225 5450 3225
Wire Wire Line
	5450 3225 5450 3525
Connection ~ 5450 3525
Wire Wire Line
	4850 3525 5025 3525
$Comp
L Device:C C?
U 1 1 5EBAD350
P 5175 3525
AR Path="/5EBAD350" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5EBAD350" Ref="C23"  Part="1" 
F 0 "C23" V 5325 3400 50  0000 C CNN
F 1 "22pF NP0" V 5250 3275 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5213 3375 50  0001 C CNN
F 3 "~" H 5175 3525 50  0001 C CNN
	1    5175 3525
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P?
U 1 1 5EDC4196
P 7675 4850
AR Path="/5EDC4196" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EDC4196" Ref="P2"  Part="1" 
F 0 "P2" H 7675 5000 50  0000 C CNN
F 1 "PinHeader_01x02" V 7775 4850 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7675 4850 50  0001 C CNN
F 3 "" H 7675 4850 50  0000 C CNN
	1    7675 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 P?
U 1 1 5EDC41BB
P 8175 3900
AR Path="/5EDC41BB" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41BB" Ref="P5"  Part="1" 
F 0 "P5" H 8175 4550 50  0000 C CNN
F 1 "PinHeader_01x12" V 8275 3900 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 8175 3900 50  0001 C CNN
F 3 "" H 8175 3900 50  0000 C CNN
	1    8175 3900
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 P?
U 1 1 5EDC41B5
P 7675 3900
AR Path="/5EDC41B5" Ref="P?"  Part="1" 
AR Path="/5E9BEB9C/5EDC41B5" Ref="P1"  Part="1" 
F 0 "P1" H 7675 4550 50  0000 C CNN
F 1 "PinHeader_01x12" V 7775 3900 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 7675 3900 50  0001 C CNN
F 3 "" H 7675 3900 50  0000 C CNN
	1    7675 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
