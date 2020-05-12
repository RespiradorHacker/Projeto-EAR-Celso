EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title "200511 - EAR Integrated ECU FR4 SMT R01"
Date "2020-05-11"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5450 5200 2    50   Input ~ 10
LATCH_INPUTS
Text HLabel 3000 2150 0    50   Input ~ 10
LATCH_OUTPUTS
Text HLabel 4050 4200 0    50   Input ~ 10
MISO
$Comp
L 74xx:74HC595 U5
U 1 1 5EA1F37E
P 3850 2050
F 0 "U5" H 3450 1400 50  0000 C CNN
F 1 "74HC595" H 3450 1300 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 3850 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 3850 2050 50  0001 C CNN
	1    3850 2050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2803A U7
U 1 1 5EA1FBCA
P 5350 1850
F 0 "U7" H 5350 2417 50  0000 C CNN
F 1 "ULN2803A" H 5350 2326 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 5400 1200 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 5450 1650 50  0001 C CNN
	1    5350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2350 4950 2350
Wire Wire Line
	4950 2250 4250 2250
Wire Wire Line
	4250 2150 4950 2150
Wire Wire Line
	4950 2050 4250 2050
Wire Wire Line
	4250 1950 4950 1950
Wire Wire Line
	4950 1850 4250 1850
Wire Wire Line
	4250 1750 4950 1750
Wire Wire Line
	4950 1650 4250 1650
$Comp
L power:GNDREF #PWR?
U 1 1 5EA2C81B
P 5350 2700
AR Path="/5EA2C81B" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EA2C81B" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 5350 2450 50  0001 C CNN
F 1 "GNDREF" H 5355 2527 50  0001 C CNN
F 2 "" H 5350 2700 50  0001 C CNN
F 3 "" H 5350 2700 50  0001 C CNN
	1    5350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2700 5350 2550
$Comp
L power:GNDREF #PWR?
U 1 1 5EA31532
P 3850 2850
AR Path="/5EA31532" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EA31532" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 3850 2600 50  0001 C CNN
F 1 "GNDREF" H 3855 2677 50  0001 C CNN
F 2 "" H 3850 2850 50  0001 C CNN
F 3 "" H 3850 2850 50  0001 C CNN
	1    3850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2850 3850 2750
$Comp
L power:+12V #PWR?
U 1 1 5EA47CFC
P 5975 1350
AR Path="/5EA47CFC" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EA47CFC" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 5975 1200 50  0001 C CNN
F 1 "+12V" H 5975 1500 50  0000 C CNN
F 2 "" H 5975 1350 50  0001 C CNN
F 3 "" H 5975 1350 50  0001 C CNN
	1    5975 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5975 1350 5975 1550
Wire Wire Line
	5975 1550 5750 1550
$Comp
L power:+5V #PWR?
U 1 1 5EA4A6D8
P 3850 1150
AR Path="/5EA4A6D8" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EA4A6D8" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 3850 1000 50  0001 C CNN
F 1 "+5V" H 3850 1300 50  0000 C CNN
F 2 "" H 3850 1150 50  0001 C CNN
F 3 "" H 3850 1150 50  0001 C CNN
	1    3850 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EAA066C
P 7950 4300
AR Path="/5EAA066C" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EAA066C" Ref="R51"  Part="1" 
F 0 "R51" V 7900 4125 50  0000 C CNN
F 1 "10K" V 7900 4475 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4300 50  0001 C CNN
F 3 "~" H 7950 4300 50  0001 C CNN
	1    7950 4300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EAD39F5
P 8400 3475
AR Path="/5EAD39F5" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EAD39F5" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 8400 3325 50  0001 C CNN
F 1 "+5V" H 8400 3625 50  0000 C CNN
F 2 "" H 8400 3475 50  0001 C CNN
F 3 "" H 8400 3475 50  0001 C CNN
	1    8400 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4400 8525 4400
Wire Wire Line
	8100 4600 8775 4600
Wire Wire Line
	8100 4700 8900 4700
Wire Wire Line
	8100 4800 9025 4800
Wire Wire Line
	8100 4900 9150 4900
Wire Wire Line
	8100 5000 9275 5000
Wire Wire Line
	8100 4500 8650 4500
Wire Wire Line
	9275 4150 9275 5000
Wire Wire Line
	8100 4300 8400 4300
Connection ~ 8400 4300
Wire Wire Line
	9150 4900 9150 4150
Connection ~ 8525 4400
Wire Wire Line
	9025 4150 9025 4800
Connection ~ 8650 4500
Wire Wire Line
	8900 4150 8900 4700
Connection ~ 8775 4600
Wire Wire Line
	8775 4150 8775 4600
Connection ~ 8900 4700
Wire Wire Line
	8650 4150 8650 4500
Connection ~ 9025 4800
Wire Wire Line
	8525 4150 8525 4400
Connection ~ 9150 4900
Wire Wire Line
	8400 4150 8400 4300
Connection ~ 9275 5000
Text Label 5375 5000 0    50   ~ 10
IN_H
Text Label 5375 4300 0    50   ~ 10
IN_A
Text Label 5375 4400 0    50   ~ 10
IN_B
Text Label 5375 4500 0    50   ~ 10
IN_C
Text Label 5375 4600 0    50   ~ 10
IN_D
Text Label 5375 4700 0    50   ~ 10
IN_E
Text Label 5375 4800 0    50   ~ 10
IN_F
Text Label 5375 4900 0    50   ~ 10
IN_G
Wire Wire Line
	8400 3475 8400 3675
Connection ~ 9150 3675
Wire Wire Line
	9150 3675 9275 3675
Wire Wire Line
	9275 3675 9275 3850
Connection ~ 9025 3675
Wire Wire Line
	9150 3675 9150 3850
Wire Wire Line
	9025 3675 9150 3675
Connection ~ 8900 3675
Wire Wire Line
	9025 3675 9025 3850
Wire Wire Line
	8900 3675 9025 3675
Wire Wire Line
	8900 3675 8900 3850
Wire Wire Line
	8775 3675 8650 3675
Connection ~ 8775 3675
Wire Wire Line
	8775 3850 8775 3675
Wire Wire Line
	8650 3675 8650 3850
Wire Wire Line
	8650 3675 8525 3675
Connection ~ 8650 3675
Wire Wire Line
	8525 3675 8525 3850
Wire Wire Line
	8525 3675 8400 3675
Connection ~ 8525 3675
Wire Wire Line
	8400 3675 8400 3850
$Comp
L EAR-ECU-Integrated_CPU_01-rescue:74LS165-74xx-EAR-ECU-Integrated_CPU_00-rescue U6
U 1 1 5EA20DF8
P 4850 4800
AR Path="/5EA20DF8" Ref="U6"  Part="1" 
AR Path="/5EA51ADB/5EA20DF8" Ref="U6"  Part="1" 
F 0 "U6" H 5000 5700 50  0000 C CNN
F 1 "74HC165" H 5100 5600 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 4850 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS165" H 4850 4800 50  0001 C CNN
	1    4850 4800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10550 2400 10400 2400
Wire Wire Line
	10400 2400 10400 1650
Wire Wire Line
	10550 2500 10300 2500
Wire Wire Line
	10300 2500 10300 1750
Wire Wire Line
	10200 1850 10200 2600
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10550 2700 10100 2700
Wire Wire Line
	10100 2700 10100 1950
Wire Wire Line
	10000 2050 10000 2800
Wire Wire Line
	10000 2800 10550 2800
Wire Wire Line
	10550 2900 9900 2900
Wire Wire Line
	9900 2900 9900 2150
Wire Wire Line
	9800 2250 9800 3000
Wire Wire Line
	9800 3000 10550 3000
Wire Wire Line
	10550 3100 9700 3100
Wire Wire Line
	9700 3100 9700 2350
Wire Wire Line
	10550 3200 9700 3200
Wire Wire Line
	10550 3400 9900 3400
Wire Wire Line
	9700 3200 9700 4300
Wire Wire Line
	8400 4300 9700 4300
Wire Wire Line
	9800 3300 9800 4400
Wire Wire Line
	8525 4400 9800 4400
Wire Wire Line
	9800 3300 10550 3300
Wire Wire Line
	9900 3400 9900 4500
Wire Wire Line
	8650 4500 9900 4500
Wire Wire Line
	10000 4600 10000 3500
Wire Wire Line
	10000 3500 10550 3500
Wire Wire Line
	8775 4600 10000 4600
Wire Wire Line
	10550 3600 10100 3600
Wire Wire Line
	10100 3600 10100 4700
Wire Wire Line
	8900 4700 10100 4700
Wire Wire Line
	10200 4800 10200 3700
Wire Wire Line
	10200 3700 10550 3700
Wire Wire Line
	9025 4800 10200 4800
Wire Wire Line
	10550 3800 10300 3800
Wire Wire Line
	10300 3800 10300 4900
Wire Wire Line
	9150 4900 10300 4900
Wire Wire Line
	10400 5000 10400 3900
Wire Wire Line
	10400 3900 10550 3900
Wire Wire Line
	9275 5000 10400 5000
$Comp
L power:GNDREF #PWR?
U 1 1 5EB14010
P 3300 2450
AR Path="/5EB14010" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EB14010" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 3300 2200 50  0001 C CNN
F 1 "GNDREF" H 3305 2277 50  0001 C CNN
F 2 "" H 3300 2450 50  0001 C CNN
F 3 "" H 3300 2450 50  0001 C CNN
	1    3300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2450 3300 2250
Wire Wire Line
	3300 2250 3450 2250
Wire Wire Line
	4250 2550 4400 2550
Wire Wire Line
	3000 2150 3450 2150
Text HLabel 3000 1850 0    50   Input ~ 10
SCK
Text HLabel 3000 1650 0    50   Input ~ 10
MOSI
Connection ~ 3200 1650
Wire Wire Line
	3200 1650 3000 1650
Wire Wire Line
	3200 1650 3450 1650
Wire Wire Line
	3200 1150 3200 1250
Wire Wire Line
	3200 1550 3200 1650
$Comp
L power:+5V #PWR?
U 1 1 5EB2D6CC
P 3200 1150
AR Path="/5EB2D6CC" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EB2D6CC" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 3200 1000 50  0001 C CNN
F 1 "+5V" H 3200 1300 50  0000 C CNN
F 2 "" H 3200 1150 50  0001 C CNN
F 3 "" H 3200 1150 50  0001 C CNN
	1    3200 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EB2CE1E
P 3200 1400
AR Path="/5EB2CE1E" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB2CE1E" Ref="R46"  Part="1" 
F 0 "R46" H 3269 1354 50  0000 L CNN
F 1 "100K" H 3269 1445 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3130 1400 50  0001 C CNN
F 3 "~" H 3200 1400 50  0001 C CNN
	1    3200 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 1850 3450 1850
Wire Wire Line
	3000 1850 3350 1850
Connection ~ 3350 1850
Wire Wire Line
	3350 1550 3350 1850
Wire Wire Line
	3350 1150 3350 1250
$Comp
L power:+5V #PWR?
U 1 1 5EB6AEDD
P 3350 1150
AR Path="/5EB6AEDD" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EB6AEDD" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 3350 1000 50  0001 C CNN
F 1 "+5V" H 3350 1300 50  0000 C CNN
F 2 "" H 3350 1150 50  0001 C CNN
F 3 "" H 3350 1150 50  0001 C CNN
	1    3350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EB6AED7
P 3350 1400
AR Path="/5EB6AED7" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB6AED7" Ref="R47"  Part="1" 
F 0 "R47" H 3280 1354 50  0000 R CNN
F 1 "100K" H 3280 1445 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3280 1400 50  0001 C CNN
F 3 "~" H 3350 1400 50  0001 C CNN
	1    3350 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 4200 4200 4200
$Comp
L power:GNDREF #PWR?
U 1 1 5EC0F81F
P 4850 5900
AR Path="/5EC0F81F" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EC0F81F" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 4850 5650 50  0001 C CNN
F 1 "GNDREF" H 4855 5727 50  0001 C CNN
F 2 "" H 4850 5900 50  0001 C CNN
F 3 "" H 4850 5900 50  0001 C CNN
	1    4850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5900 4850 5800
$Comp
L Device:C C?
U 1 1 5EC1C33F
P 4100 1300
AR Path="/5EC1C33F" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5EC1C33F" Ref="C?"  Part="1" 
AR Path="/5EA51ADB/5EC1C33F" Ref="C24"  Part="1" 
F 0 "C24" V 4260 1300 50  0000 C CNN
F 1 "100nF X7R" H 4215 1255 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4138 1150 50  0001 C CNN
F 3 "~" H 4100 1300 50  0001 C CNN
	1    4100 1300
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC1C345
P 4400 1350
AR Path="/5EC1C345" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EC1C345" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EC1C345" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 4400 1100 50  0001 C CNN
F 1 "GND" H 4400 1200 50  0000 C CNN
F 2 "" H 4400 1350 50  0000 C CNN
F 3 "" H 4400 1350 50  0000 C CNN
	1    4400 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 1300 3850 1300
Wire Wire Line
	4250 1300 4400 1300
Wire Wire Line
	4400 1300 4400 1350
Connection ~ 3850 1300
Wire Wire Line
	3850 1300 3850 1450
Wire Wire Line
	3850 1150 3850 1300
$Comp
L power:+5V #PWR?
U 1 1 5EC63F1E
P 4850 3600
AR Path="/5EC63F1E" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EC63F1E" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 4850 3450 50  0001 C CNN
F 1 "+5V" H 4850 3750 50  0000 C CNN
F 2 "" H 4850 3600 50  0001 C CNN
F 3 "" H 4850 3600 50  0001 C CNN
	1    4850 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EC63F24
P 5100 3750
AR Path="/5EC63F24" Ref="C?"  Part="1" 
AR Path="/5E9BEB9C/5EC63F24" Ref="C?"  Part="1" 
AR Path="/5EA51ADB/5EC63F24" Ref="C25"  Part="1" 
F 0 "C25" V 5352 3750 50  0000 C CNN
F 1 "100nF X7R" V 5275 3875 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5138 3600 50  0001 C CNN
F 3 "~" H 5100 3750 50  0001 C CNN
	1    5100 3750
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC63F2A
P 5400 3800
AR Path="/5EC63F2A" Ref="#PWR?"  Part="1" 
AR Path="/5E9BEB9C/5EC63F2A" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EC63F2A" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 5400 3550 50  0001 C CNN
F 1 "GND" H 5400 3650 50  0000 C CNN
F 2 "" H 5400 3800 50  0000 C CNN
F 3 "" H 5400 3800 50  0000 C CNN
	1    5400 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4950 3750 4850 3750
Wire Wire Line
	5250 3750 5400 3750
Wire Wire Line
	5400 3750 5400 3800
Connection ~ 4850 3750
Wire Wire Line
	4850 3750 4850 3900
Wire Wire Line
	4850 3600 4850 3750
NoConn ~ 4350 4300
Wire Wire Line
	4200 3600 4200 3700
$Comp
L power:+5V #PWR?
U 1 1 5EC74826
P 4200 3600
AR Path="/5EC74826" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EC74826" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 4200 3450 50  0001 C CNN
F 1 "+5V" H 4200 3750 50  0000 C CNN
F 2 "" H 4200 3600 50  0001 C CNN
F 3 "" H 4200 3600 50  0001 C CNN
	1    4200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4000 4200 4200
Connection ~ 4200 4200
Wire Wire Line
	4200 4200 4350 4200
Wire Wire Line
	5450 5200 5350 5200
$Comp
L power:GNDREF #PWR?
U 1 1 5ECF39CC
P 5450 5900
AR Path="/5ECF39CC" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5ECF39CC" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 5450 5650 50  0001 C CNN
F 1 "GNDREF" H 5455 5727 50  0001 C CNN
F 2 "" H 5450 5900 50  0001 C CNN
F 3 "" H 5450 5900 50  0001 C CNN
	1    5450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5900 5450 5500
Wire Wire Line
	5450 5500 5350 5500
Text HLabel 5450 5400 2    50   Input ~ 10
SCK
Wire Wire Line
	5450 5400 5350 5400
$Comp
L Device:R R?
U 1 1 5ED083D7
P 6050 4000
AR Path="/5ED083D7" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5ED083D7" Ref="R49"  Part="1" 
F 0 "R49" V 6165 4000 50  0000 C CNN
F 1 "100R" V 5934 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5980 4000 50  0001 C CNN
F 3 "~" H 6050 4000 50  0001 C CNN
	1    6050 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 4200 5750 4200
Wire Wire Line
	5750 4200 5750 4000
$Comp
L Device:R R?
U 1 1 5ED128C6
P 6900 4000
AR Path="/5ED128C6" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5ED128C6" Ref="R50"  Part="1" 
F 0 "R50" V 7015 4000 50  0000 C CNN
F 1 "100K" V 6784 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 4000 50  0001 C CNN
F 3 "~" H 6900 4000 50  0001 C CNN
	1    6900 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5ED1CC77
P 7200 4100
AR Path="/5ED1CC77" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5ED1CC77" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 7200 3850 50  0001 C CNN
F 1 "GNDREF" H 7205 3927 50  0001 C CNN
F 2 "" H 7200 4100 50  0001 C CNN
F 3 "" H 7200 4100 50  0001 C CNN
	1    7200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4000 5750 4000
Wire Wire Line
	7050 4000 7200 4000
Wire Wire Line
	7200 4000 7200 4100
Wire Wire Line
	6200 4000 6425 4000
Text Label 5850 1650 0    50   ~ 10
OUT_1
Text Label 5850 1750 0    50   ~ 10
OUT_2
Text Label 5850 1850 0    50   ~ 10
OUT_3
Text Label 5850 1950 0    50   ~ 10
OUT_4
Text Label 5850 2050 0    50   ~ 10
OUT_5
Text Label 5850 2150 0    50   ~ 10
OUT_6
Text Label 5850 2250 0    50   ~ 10
OUT_7
Text Label 5850 2350 0    50   ~ 10
OUT_8
$Comp
L Connector_Generic:Conn_02x08_Odd_Even SPI_BASED_SLOW_IO1
U 1 1 5ED7A05C
P 2050 4750
F 0 "SPI_BASED_SLOW_IO1" H 2100 5267 50  0000 C CNN
F 1 "PinHeader_02x08" H 2100 5176 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 2050 4750 50  0001 C CNN
F 3 "~" H 2050 4750 50  0001 C CNN
	1    2050 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5ED7AE8F
P 2750 4300
AR Path="/5ED7AE8F" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5ED7AE8F" Ref="#PWR081"  Part="1" 
F 0 "#PWR081" H 2750 4150 50  0001 C CNN
F 1 "+5V" H 2750 4450 50  0000 C CNN
F 2 "" H 2750 4300 50  0001 C CNN
F 3 "" H 2750 4300 50  0001 C CNN
	1    2750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4300 2750 4450
Wire Wire Line
	2750 4450 2350 4450
Text HLabel 2550 4550 2    50   Input ~ 10
LATCH_INPUTS
Wire Wire Line
	2550 4550 2350 4550
Text HLabel 2550 4650 2    50   Input ~ 10
RESET_OUT
Wire Wire Line
	2550 4650 2350 4650
Text HLabel 2550 4750 2    50   Input ~ 10
LATCH_OUTPUTS
Wire Wire Line
	2550 4750 2350 4750
Wire Wire Line
	2350 4850 2550 4850
Wire Wire Line
	2350 4950 2550 4950
Wire Wire Line
	2350 5050 2550 5050
Wire Wire Line
	2350 5150 2750 5150
Wire Wire Line
	2750 5150 2750 5350
$Comp
L power:GNDREF #PWR?
U 1 1 5EDE7A93
P 2750 5350
AR Path="/5EDE7A93" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EDE7A93" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 2750 5100 50  0001 C CNN
F 1 "GNDREF" H 2755 5177 50  0001 C CNN
F 2 "" H 2750 5350 50  0001 C CNN
F 3 "" H 2750 5350 50  0001 C CNN
	1    2750 5350
	1    0    0    -1  
$EndComp
Text HLabel 2550 5050 2    50   Input ~ 10
SCK
Wire Wire Line
	1450 4300 1450 4450
Wire Wire Line
	1450 4450 1850 4450
Text HLabel 1650 4550 0    50   Input ~ 10
LATCH_INPUTS
Wire Wire Line
	1650 4550 1850 4550
Text HLabel 1650 4650 0    50   Input ~ 10
RESET_OUT
Wire Wire Line
	1650 4650 1850 4650
Text HLabel 1650 4750 0    50   Input ~ 10
LATCH_OUTPUTS
Wire Wire Line
	1650 4750 1850 4750
Wire Wire Line
	1850 4850 1650 4850
Wire Wire Line
	1850 4950 1650 4950
Wire Wire Line
	1850 5050 1650 5050
Wire Wire Line
	1850 5150 1450 5150
Wire Wire Line
	1450 5150 1450 5350
$Comp
L power:GNDREF #PWR?
U 1 1 5EDEA88D
P 1450 5350
AR Path="/5EDEA88D" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EDEA88D" Ref="#PWR080"  Part="1" 
F 0 "#PWR080" H 1450 5100 50  0001 C CNN
F 1 "GNDREF" H 1455 5177 50  0001 C CNN
F 2 "" H 1450 5350 50  0001 C CNN
F 3 "" H 1450 5350 50  0001 C CNN
	1    1450 5350
	-1   0    0    -1  
$EndComp
Text HLabel 1650 5050 0    50   Input ~ 10
SCK
$Comp
L power:+5V #PWR?
U 1 1 5EDF72CD
P 1450 4300
AR Path="/5EDF72CD" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5EDF72CD" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 1450 4150 50  0001 C CNN
F 1 "+5V" H 1450 4450 50  0000 C CNN
F 2 "" H 1450 4300 50  0001 C CNN
F 3 "" H 1450 4300 50  0001 C CNN
	1    1450 4300
	1    0    0    -1  
$EndComp
Text HLabel 6475 3725 2    50   Input ~ 10
MISO_EXP
Text HLabel 1650 4850 0    50   Input ~ 10
MOSI_EXP
Text HLabel 1650 4950 0    50   Input ~ 10
MISO_EXP
Text HLabel 2550 4850 2    50   Input ~ 10
MOSI_EXP
Text HLabel 4400 2550 2    50   Input ~ 10
MOSI_EXP
Wire Wire Line
	6475 3725 6425 3725
Wire Wire Line
	6425 3725 6425 4000
Connection ~ 6425 4000
Wire Wire Line
	6425 4000 6750 4000
Text HLabel 2550 4950 2    50   Input ~ 10
MISO_EXP
$Comp
L Transistor_Array:ULN2803A U8
U 1 1 5F72793F
P 6025 6950
F 0 "U8" H 6025 7517 50  0000 C CNN
F 1 "ULN2803A" H 6025 7426 50  0000 C CNN
F 2 "Package_DIP:DIP-18_W7.62mm" H 6075 6300 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2803a.pdf" H 6125 6750 50  0001 C CNN
	1    6025 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5F72A1A9
P 6575 6600
AR Path="/5F72A1A9" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5F72A1A9" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 6575 6450 50  0001 C CNN
F 1 "+12V" H 6575 6750 50  0000 C CNN
F 2 "" H 6575 6600 50  0001 C CNN
F 3 "" H 6575 6600 50  0001 C CNN
	1    6575 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6575 6600 6575 6650
Wire Wire Line
	6575 6650 6425 6650
Text Label 6425 6750 0    50   ~ 10
OUT_1
Text Label 6425 6850 0    50   ~ 10
OUT_2
Text Label 6425 6950 0    50   ~ 10
OUT_3
Text Label 6425 7050 0    50   ~ 10
OUT_4
Text Label 6425 7150 0    50   ~ 10
OUT_5
Text Label 6425 7250 0    50   ~ 10
OUT_6
Text Label 6425 7350 0    50   ~ 10
OUT_7
Text Label 6425 7450 0    50   ~ 10
OUT_8
$Comp
L power:GNDREF #PWR?
U 1 1 5F73B7AC
P 6025 7675
AR Path="/5F73B7AC" Ref="#PWR?"  Part="1" 
AR Path="/5EA51ADB/5F73B7AC" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 6025 7425 50  0001 C CNN
F 1 "GNDREF" H 6030 7502 50  0001 C CNN
F 2 "" H 6025 7675 50  0001 C CNN
F 3 "" H 6025 7675 50  0001 C CNN
	1    6025 7675
	1    0    0    -1  
$EndComp
Wire Wire Line
	6025 7675 6025 7650
Text Notes 6175 7725 0    50   ~ 10
Soquete DIP\nOpcional
Text Label 4825 1650 0    50   ~ 10
I1
Text Label 4825 1750 0    50   ~ 10
I2
Text Label 4825 1850 0    50   ~ 10
I3
Text Label 4825 1950 0    50   ~ 10
I4
Text Label 4825 2050 0    50   ~ 10
I5
Text Label 4825 2150 0    50   ~ 10
I6
Text Label 4825 2250 0    50   ~ 10
I7
Text Label 4825 2350 0    50   ~ 10
I8
Text Label 5625 6750 2    50   ~ 10
I1
Text Label 5625 6850 2    50   ~ 10
I2
Text Label 5625 6950 2    50   ~ 10
I3
Text Label 5625 7050 2    50   ~ 10
I4
Text Label 5625 7150 2    50   ~ 10
I5
Text Label 5625 7250 2    50   ~ 10
I6
Text Label 5625 7350 2    50   ~ 10
I7
Text Label 5625 7450 2    50   ~ 10
I8
$Comp
L Device:R R?
U 1 1 5F900937
P 8400 4000
AR Path="/5F900937" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5F900937" Ref="R59"  Part="1" 
F 0 "R59" V 8450 4175 50  0000 C CNN
F 1 "10K" V 8450 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8330 4000 50  0001 C CNN
F 3 "~" H 8400 4000 50  0001 C CNN
	1    8400 4000
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x16 EXP?
U 1 1 5EA5CB0E
P 10750 3100
AR Path="/5EA5CB0E" Ref="EXP?"  Part="1" 
AR Path="/5EA51ADB/5EA5CB0E" Ref="EXP1"  Part="1" 
F 0 "EXP1" H 10650 4000 50  0000 L CNN
F 1 "39-29-1168" H 10650 3925 50  0000 L CNN
F 2 "Custom:MOLEX-39-29-1168" H 10750 3100 50  0001 C CNN
F 3 "~" H 10750 3100 50  0001 C CNN
	1    10750 3100
	1    0    0    -1  
$EndComp
Text HLabel 3000 1950 0    50   Input ~ 10
RESET_OUT
Wire Wire Line
	3000 1950 3450 1950
Wire Wire Line
	5350 5000 7800 5000
Wire Wire Line
	5350 4900 7800 4900
Wire Wire Line
	5350 4800 7800 4800
Wire Wire Line
	5350 4700 7800 4700
Wire Wire Line
	5350 4600 7800 4600
Wire Wire Line
	5350 4500 7800 4500
Wire Wire Line
	5350 4400 7800 4400
Wire Wire Line
	5350 4300 7800 4300
Connection ~ 8400 3675
Wire Wire Line
	8775 3675 8900 3675
Wire Wire Line
	5750 1650 10400 1650
Wire Wire Line
	5750 1750 10300 1750
Wire Wire Line
	5750 1850 10200 1850
Wire Wire Line
	5750 1950 10100 1950
Wire Wire Line
	5750 2050 10000 2050
Wire Wire Line
	5750 2150 9900 2150
Wire Wire Line
	5750 2250 9800 2250
Wire Wire Line
	5750 2350 9700 2350
$Comp
L Device:R R?
U 1 1 5EB19790
P 8525 4000
AR Path="/5EB19790" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB19790" Ref="R60"  Part="1" 
F 0 "R60" V 8575 4175 50  0000 C CNN
F 1 "10K" V 8575 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8455 4000 50  0001 C CNN
F 3 "~" H 8525 4000 50  0001 C CNN
	1    8525 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB19A73
P 8650 4000
AR Path="/5EB19A73" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB19A73" Ref="R61"  Part="1" 
F 0 "R61" V 8700 4175 50  0000 C CNN
F 1 "10K" V 8700 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8580 4000 50  0001 C CNN
F 3 "~" H 8650 4000 50  0001 C CNN
	1    8650 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB19CBA
P 8775 4000
AR Path="/5EB19CBA" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB19CBA" Ref="R62"  Part="1" 
F 0 "R62" V 8825 4175 50  0000 C CNN
F 1 "10K" V 8825 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8705 4000 50  0001 C CNN
F 3 "~" H 8775 4000 50  0001 C CNN
	1    8775 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB19F6F
P 8900 4000
AR Path="/5EB19F6F" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB19F6F" Ref="R63"  Part="1" 
F 0 "R63" V 8950 4175 50  0000 C CNN
F 1 "10K" V 8950 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8830 4000 50  0001 C CNN
F 3 "~" H 8900 4000 50  0001 C CNN
	1    8900 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB1A1B2
P 9025 4000
AR Path="/5EB1A1B2" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB1A1B2" Ref="R64"  Part="1" 
F 0 "R64" V 9075 4175 50  0000 C CNN
F 1 "10K" V 9075 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8955 4000 50  0001 C CNN
F 3 "~" H 9025 4000 50  0001 C CNN
	1    9025 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB1A4A4
P 9150 4000
AR Path="/5EB1A4A4" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB1A4A4" Ref="R65"  Part="1" 
F 0 "R65" V 9200 4175 50  0000 C CNN
F 1 "10K" V 9200 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9080 4000 50  0001 C CNN
F 3 "~" H 9150 4000 50  0001 C CNN
	1    9150 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB1A772
P 9275 4000
AR Path="/5EB1A772" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB1A772" Ref="R66"  Part="1" 
F 0 "R66" V 9325 4175 50  0000 C CNN
F 1 "10K" V 9325 3825 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9205 4000 50  0001 C CNN
F 3 "~" H 9275 4000 50  0001 C CNN
	1    9275 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB69146
P 7950 4400
AR Path="/5EB69146" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB69146" Ref="R52"  Part="1" 
F 0 "R52" V 7900 4225 50  0000 C CNN
F 1 "10K" V 7900 4575 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4400 50  0001 C CNN
F 3 "~" H 7950 4400 50  0001 C CNN
	1    7950 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB695C7
P 7950 4500
AR Path="/5EB695C7" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB695C7" Ref="R53"  Part="1" 
F 0 "R53" V 7900 4325 50  0000 C CNN
F 1 "10K" V 7900 4675 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4500 50  0001 C CNN
F 3 "~" H 7950 4500 50  0001 C CNN
	1    7950 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB698CB
P 7950 4600
AR Path="/5EB698CB" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB698CB" Ref="R54"  Part="1" 
F 0 "R54" V 7900 4425 50  0000 C CNN
F 1 "10K" V 7900 4775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4600 50  0001 C CNN
F 3 "~" H 7950 4600 50  0001 C CNN
	1    7950 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB69A7B
P 7950 4700
AR Path="/5EB69A7B" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB69A7B" Ref="R55"  Part="1" 
F 0 "R55" V 7900 4525 50  0000 C CNN
F 1 "10K" V 7900 4875 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4700 50  0001 C CNN
F 3 "~" H 7950 4700 50  0001 C CNN
	1    7950 4700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB69C70
P 7950 4800
AR Path="/5EB69C70" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB69C70" Ref="R56"  Part="1" 
F 0 "R56" V 7900 4625 50  0000 C CNN
F 1 "10K" V 7900 4975 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4800 50  0001 C CNN
F 3 "~" H 7950 4800 50  0001 C CNN
	1    7950 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB69F02
P 7950 4900
AR Path="/5EB69F02" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB69F02" Ref="R57"  Part="1" 
F 0 "R57" V 7900 4725 50  0000 C CNN
F 1 "10K" V 7900 5075 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 4900 50  0001 C CNN
F 3 "~" H 7950 4900 50  0001 C CNN
	1    7950 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB6A1A5
P 7950 5000
AR Path="/5EB6A1A5" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB6A1A5" Ref="R58"  Part="1" 
F 0 "R58" V 7900 4825 50  0000 C CNN
F 1 "10K" V 7900 5175 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7880 5000 50  0001 C CNN
F 3 "~" H 7950 5000 50  0001 C CNN
	1    7950 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5EB6D7AE
P 4200 3850
AR Path="/5EB6D7AE" Ref="R?"  Part="1" 
AR Path="/5EA51ADB/5EB6D7AE" Ref="R48"  Part="1" 
F 0 "R48" H 4269 3804 50  0000 L CNN
F 1 "100K" H 4269 3895 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4130 3850 50  0001 C CNN
F 3 "~" H 4200 3850 50  0001 C CNN
	1    4200 3850
	-1   0    0    1   
$EndComp
$EndSCHEMATC
