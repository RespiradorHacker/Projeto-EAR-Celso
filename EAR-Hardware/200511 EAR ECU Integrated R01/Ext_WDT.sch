EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "200511 - EAR Integrated ECU FR4 SMT R01"
Date "2020-05-11"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7425 3150 0    50   Input ~ 10
MISO_EXT
Text HLabel 8225 3150 2    50   Input ~ 10
MOSI_EXT
Text HLabel 8325 2950 2    50   Input ~ 10
RST
$Comp
L Device:R R?
U 1 1 5F3E7673
P 3300 3050
AR Path="/5F3E7673" Ref="R?"  Part="1" 
AR Path="/5F36C4C1/5F3E7673" Ref="R40"  Part="1" 
F 0 "R40" V 3507 3050 50  0000 C CNN
F 1 "1K" V 3416 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3230 3050 50  0001 C CNN
F 3 "~" H 3300 3050 50  0001 C CNN
	1    3300 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C?
U 1 1 5F3E76BA
P 3800 3050
AR Path="/5F3E76BA" Ref="C?"  Part="1" 
AR Path="/5F36C4C1/5F3E76BA" Ref="C16"  Part="1" 
F 0 "C16" V 4055 3050 50  0000 C CNN
F 1 "47uF/35V" V 3964 3050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3838 2900 50  0001 C CNN
F 3 "~" H 3800 3050 50  0001 C CNN
	1    3800 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F3E76C1
P 5850 2350
AR Path="/5E9F6A7F/5F3E76C1" Ref="R?"  Part="1" 
AR Path="/5F3E76C1" Ref="R?"  Part="1" 
AR Path="/5F36C4C1/5F3E76C1" Ref="R42"  Part="1" 
F 0 "R42" H 5780 2304 50  0000 R CNN
F 1 "100K" H 5780 2395 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5780 2350 50  0001 C CNN
F 3 "~" H 5850 2350 50  0001 C CNN
	1    5850 2350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F3E76C8
P 5850 2050
AR Path="/5F3E76C8" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F3E76C8" Ref="#PWR064"  Part="1" 
F 0 "#PWR064" H 5850 1900 50  0001 C CNN
F 1 "+5V" H 5865 2223 50  0000 C CNN
F 2 "" H 5850 2050 50  0001 C CNN
F 3 "" H 5850 2050 50  0001 C CNN
	1    5850 2050
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D?
U 1 1 5F3F7189
P 4150 2750
AR Path="/5F3F7189" Ref="D?"  Part="1" 
AR Path="/5F36C4C1/5F3F7189" Ref="D5"  Part="1" 
F 0 "D5" V 4104 2829 50  0000 L CNN
F 1 "S1J" V 4195 2829 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 4150 2575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4150 2750 50  0001 C CNN
	1    4150 2750
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4007 D?
U 1 1 5F3F782B
P 4150 3250
AR Path="/5F3F782B" Ref="D?"  Part="1" 
AR Path="/5F36C4C1/5F3F782B" Ref="D6"  Part="1" 
F 0 "D6" V 4104 3329 50  0000 L CNN
F 1 "S1J" V 4195 3329 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 4150 3075 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4150 3250 50  0001 C CNN
	1    4150 3250
	0    1    1    0   
$EndComp
$Comp
L Device:CP C?
U 1 1 5F3F7D37
P 4600 2750
AR Path="/5F3F7D37" Ref="C?"  Part="1" 
AR Path="/5F36C4C1/5F3F7D37" Ref="C17"  Part="1" 
F 0 "C17" H 4718 2796 50  0000 L CNN
F 1 "47uF/35V" H 4718 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4638 2600 50  0001 C CNN
F 3 "~" H 4600 2750 50  0001 C CNN
	1    4600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3050 5850 3050
Wire Wire Line
	4600 3050 4600 3500
Wire Wire Line
	4600 3500 4150 3500
Wire Wire Line
	4150 3500 4150 3400
Wire Wire Line
	4150 2900 4150 3050
Wire Wire Line
	4150 2400 4400 2400
Wire Wire Line
	4600 2900 4600 3050
Connection ~ 4600 3050
Wire Wire Line
	4150 2400 4150 2600
Wire Wire Line
	4600 2400 4600 2600
Wire Wire Line
	3950 3050 4150 3050
Connection ~ 4150 3050
Wire Wire Line
	4150 3050 4150 3100
Wire Wire Line
	3650 3050 3450 3050
$Comp
L power:+5V #PWR?
U 1 1 5F400224
P 4400 2300
AR Path="/5F400224" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F400224" Ref="#PWR062"  Part="1" 
F 0 "#PWR062" H 4400 2150 50  0001 C CNN
F 1 "+5V" H 4415 2473 50  0000 C CNN
F 2 "" H 4400 2300 50  0001 C CNN
F 3 "" H 4400 2300 50  0001 C CNN
	1    4400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2300 4400 2400
Connection ~ 4400 2400
Wire Wire Line
	4400 2400 4600 2400
Wire Wire Line
	6000 2850 5850 2850
Wire Wire Line
	5850 2850 5850 2600
Wire Wire Line
	5850 2200 5850 2050
$Comp
L Device:R R?
U 1 1 5F405C3D
P 6400 2600
AR Path="/5E9F6A7F/5F405C3D" Ref="R?"  Part="1" 
AR Path="/5F405C3D" Ref="R?"  Part="1" 
AR Path="/5F36C4C1/5F405C3D" Ref="R43"  Part="1" 
F 0 "R43" V 6193 2600 50  0000 C CNN
F 1 "100K" V 6284 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6330 2600 50  0001 C CNN
F 3 "~" H 6400 2600 50  0001 C CNN
	1    6400 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F40639D
P 5450 2600
AR Path="/5E9F6A7F/5F40639D" Ref="R?"  Part="1" 
AR Path="/5F40639D" Ref="R?"  Part="1" 
AR Path="/5F36C4C1/5F40639D" Ref="R41"  Part="1" 
F 0 "R41" V 5243 2600 50  0000 C CNN
F 1 "100K" V 5334 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 2600 50  0001 C CNN
F 3 "~" H 5450 2600 50  0001 C CNN
	1    5450 2600
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F40684A
P 5100 2800
AR Path="/5F40684A" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F40684A" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 5100 2550 50  0001 C CNN
F 1 "GNDREF" H 5105 2627 50  0001 C CNN
F 2 "" H 5100 2800 50  0001 C CNN
F 3 "" H 5100 2800 50  0001 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2800 5100 2600
Wire Wire Line
	5100 2600 5300 2600
Wire Wire Line
	5600 2600 5850 2600
Connection ~ 5850 2600
Wire Wire Line
	5850 2600 5850 2500
Wire Wire Line
	6250 2600 5850 2600
Wire Wire Line
	6550 2600 6850 2600
Wire Wire Line
	6850 2600 6850 2950
Wire Wire Line
	6850 2950 6600 2950
$Comp
L Device:R R?
U 1 1 5F40B74A
P 6400 3500
AR Path="/5E9F6A7F/5F40B74A" Ref="R?"  Part="1" 
AR Path="/5F40B74A" Ref="R?"  Part="1" 
AR Path="/5F36C4C1/5F40B74A" Ref="R44"  Part="1" 
F 0 "R44" V 6193 3500 50  0000 C CNN
F 1 "100K" V 6284 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6330 3500 50  0001 C CNN
F 3 "~" H 6400 3500 50  0001 C CNN
	1    6400 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3500 5850 3500
Wire Wire Line
	5850 3500 5850 3050
Connection ~ 5850 3050
Wire Wire Line
	5850 3050 4600 3050
Wire Wire Line
	6550 3500 6850 3500
Wire Wire Line
	6850 3500 6850 2950
Connection ~ 6850 2950
$Comp
L Amplifier_Operational:LM358 U?
U 1 1 5F42358A
P 4825 4775
AR Path="/5E9F6A7F/5F42358A" Ref="U?"  Part="2" 
AR Path="/5F36C4C1/5F42358A" Ref="U3"  Part="1" 
F 0 "U3" H 4825 5142 50  0000 C CNN
F 1 "LM393" H 4825 5051 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4825 4775 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 4825 4775 50  0001 C CNN
	1    4825 4775
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U?
U 3 1 5F423590
P 6100 4825
AR Path="/5E9F6A7F/5F423590" Ref="U?"  Part="3" 
AR Path="/5F36C4C1/5F423590" Ref="U3"  Part="3" 
F 0 "U3" H 6058 4871 50  0000 L CNN
F 1 "LM393" H 6058 4780 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6100 4825 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 6100 4825 50  0001 C CNN
	3    6100 4825
	1    0    0    -1  
$EndComp
Wire Wire Line
	4525 4675 4375 4675
Wire Wire Line
	4375 4675 4375 4875
Wire Wire Line
	4525 4875 4375 4875
Connection ~ 4375 4875
Wire Wire Line
	4375 4875 4375 5125
$Comp
L power:+5V #PWR?
U 1 1 5F42359B
P 6000 4375
AR Path="/5E9F6A7F/5F42359B" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F42359B" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 6000 4225 50  0001 C CNN
F 1 "+5V" H 6015 4548 50  0000 C CNN
F 2 "" H 6000 4375 50  0001 C CNN
F 3 "" H 6000 4375 50  0001 C CNN
	1    6000 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5125 6000 5150
Wire Wire Line
	6000 4525 6000 4500
NoConn ~ 5125 4775
$Comp
L Device:C C?
U 1 1 5F4235A4
P 5750 4825
AR Path="/5E9F6A7F/5F4235A4" Ref="C?"  Part="1" 
AR Path="/5F36C4C1/5F4235A4" Ref="C18"  Part="1" 
F 0 "C18" H 5636 4871 50  0000 R CNN
F 1 "100nF X7R" H 5636 4780 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5788 4675 50  0001 C CNN
F 3 "~" H 5750 4825 50  0001 C CNN
	1    5750 4825
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4675 5750 4500
Wire Wire Line
	5750 4500 6000 4500
Connection ~ 6000 4500
Wire Wire Line
	6000 4500 6000 4375
Wire Wire Line
	5750 4975 5750 5150
Wire Wire Line
	5750 5150 6000 5150
Connection ~ 6000 5150
Wire Wire Line
	6000 5150 6000 5325
$Comp
L power:GNDREF #PWR?
U 1 1 5F4235B2
P 4375 5125
AR Path="/5F4235B2" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F4235B2" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F4235B2" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 4375 4875 50  0001 C CNN
F 1 "GNDREF" H 4380 4952 50  0001 C CNN
F 2 "" H 4375 5125 50  0001 C CNN
F 3 "" H 4375 5125 50  0001 C CNN
	1    4375 5125
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F4235B8
P 6000 5325
AR Path="/5F4235B8" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F4235B8" Ref="#PWR?"  Part="1" 
AR Path="/5F36C4C1/5F4235B8" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 6000 5075 50  0001 C CNN
F 1 "GNDREF" H 6005 5152 50  0001 C CNN
F 2 "" H 6000 5325 50  0001 C CNN
F 3 "" H 6000 5325 50  0001 C CNN
	1    6000 5325
	1    0    0    -1  
$EndComp
Text HLabel 2650 3050 0    50   Input ~ 10
LATCH_INPUTS
Wire Wire Line
	2650 3050 3150 3050
$Comp
L Amplifier_Operational:LM358 U?
U 2 1 5F3FB4FF
P 6300 2950
AR Path="/5E9F6A7F/5F3FB4FF" Ref="U?"  Part="1" 
AR Path="/5F36C4C1/5F3FB4FF" Ref="U3"  Part="2" 
F 0 "U3" H 6500 2850 50  0000 C CNN
F 1 "LM393" H 6450 2750 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6300 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 6300 2950 50  0001 C CNN
	2    6300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8225 3150 8075 3150
Wire Wire Line
	7575 3150 7425 3150
Wire Wire Line
	8075 2950 8325 2950
Wire Wire Line
	6850 2950 7575 2950
NoConn ~ 8075 3050
NoConn ~ 7575 3050
Wire Wire Line
	8125 3975 8125 4100
Wire Wire Line
	8125 4100 7525 4100
Wire Wire Line
	7525 3975 7575 3975
Wire Wire Line
	8075 3975 8125 3975
Wire Wire Line
	7525 3775 7525 3625
Wire Wire Line
	7525 3625 8125 3625
Wire Wire Line
	8125 3625 8125 3775
Wire Wire Line
	8125 3775 8075 3775
Wire Wire Line
	7525 3775 7575 3775
NoConn ~ 8075 3875
NoConn ~ 7575 3875
$Comp
L Connector_Generic:Conn_02x03_Odd_Even WDT1
U 1 1 5F46CF89
P 7875 3050
F 0 "WDT1" H 7925 2725 50  0000 C CNN
F 1 "Pino_02x03" H 7925 2816 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 7875 3050 50  0001 C CNN
F 3 "~" H 7875 3050 50  0001 C CNN
	1    7875 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even JP1
U 1 1 5F1A02B2
P 7875 3875
F 0 "JP1" H 7425 3800 50  0000 C CNN
F 1 "Header_02x03" H 7275 3875 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H 7875 3875 50  0001 C CNN
F 3 "~" H 7875 3875 50  0001 C CNN
	1    7875 3875
	-1   0    0    1   
$EndComp
Wire Wire Line
	7525 4100 7525 3975
$EndSCHEMATC
