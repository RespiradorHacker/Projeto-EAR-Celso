EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "200511 - EAR Integrated ECU FR4 SMT R01"
Date "2020-05-11"
Rev "01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3675 2550 0    50   Input ~ 10
HSA
Text HLabel 3675 3800 0    50   Input ~ 10
LSA
Text HLabel 10475 2550 2    50   Input ~ 10
HSB
Text HLabel 10475 3800 2    50   Input ~ 10
LSB
Text HLabel 3050 5300 2    50   Output ~ 10
V_AMP
$Comp
L Device:R R27
U 1 1 5E82CFC8
P 4700 3025
F 0 "R27" H 4770 3071 50  0000 L CNN
F 1 "1K" H 4770 2980 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 3025 50  0001 C CNN
F 3 "~" H 4700 3025 50  0001 C CNN
	1    4700 3025
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 5E82D59D
P 3975 3800
F 0 "R25" V 3768 3800 50  0000 C CNN
F 1 "10K" V 3859 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3905 3800 50  0001 C CNN
F 3 "~" H 3975 3800 50  0001 C CNN
	1    3975 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R29
U 1 1 5E83A443
P 5425 4050
F 0 "R29" V 5540 4050 50  0000 C CNN
F 1 "100R" V 5631 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5355 4050 50  0001 C CNN
F 3 "~" H 5425 4050 50  0001 C CNN
	1    5425 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 3175 4700 3275
$Comp
L Device:D D3
U 1 1 5E845352
P 6000 1300
F 0 "D3" H 6000 1516 50  0000 C CNN
F 1 "S1J" H 6000 1425 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 6000 1300 50  0001 C CNN
F 3 "~" H 6000 1300 50  0001 C CNN
	1    6000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4875 3800 4875 3850
Wire Wire Line
	4875 4250 4875 4400
Wire Wire Line
	5175 4050 5275 4050
Connection ~ 4875 3800
Wire Wire Line
	6275 4050 6275 4000
Wire Wire Line
	3825 3800 3675 3800
Wire Wire Line
	3675 2550 3775 2550
$Comp
L Device:R RS1
U 1 1 5E8A5401
P 7000 4600
F 0 "RS1" H 7070 4646 50  0000 L CNN
F 1 "0R1" H 7070 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_Power_L20.0mm_W6.4mm_P7.62mm_Vertical" V 6930 4600 50  0001 C CNN
F 3 "~" H 7000 4600 50  0001 C CNN
	1    7000 4600
	-1   0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U2
U 1 1 5E8A76AF
P 1550 5300
F 0 "U2" H 1550 5667 50  0000 C CNN
F 1 "LM358" H 1550 5576 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1550 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 1550 5300 50  0001 C CNN
	1    1550 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5E8AA747
P 1200 6050
F 0 "R21" H 1130 6004 50  0000 R CNN
F 1 "10K" H 1130 6095 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1130 6050 50  0001 C CNN
F 3 "~" H 1200 6050 50  0001 C CNN
	1    1200 6050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R22
U 1 1 5E8AB02E
P 1600 5700
F 0 "R22" V 1715 5700 50  0000 C CNN
F 1 "33K" V 1806 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1530 5700 50  0001 C CNN
F 3 "~" H 1600 5700 50  0001 C CNN
	1    1600 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 5900 1200 5700
Wire Wire Line
	1200 5400 1250 5400
Wire Wire Line
	1450 5700 1200 5700
Connection ~ 1200 5700
Wire Wire Line
	1200 5700 1200 5400
Wire Wire Line
	1750 5700 2000 5700
Wire Wire Line
	2000 5700 2000 5300
Wire Wire Line
	2000 5300 1850 5300
$Comp
L Device:R R23
U 1 1 5E8AFC77
P 2250 5300
F 0 "R23" V 2043 5300 50  0000 C CNN
F 1 "100K" V 2134 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 5300 50  0001 C CNN
F 3 "~" H 2250 5300 50  0001 C CNN
	1    2250 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 5300 2000 5300
Connection ~ 2000 5300
$Comp
L Device:C C11
U 1 1 5E8B14FB
P 2600 5500
F 0 "C11" H 2715 5546 50  0000 L CNN
F 1 "100nF X7R" H 2715 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2638 5350 50  0001 C CNN
F 3 "~" H 2600 5500 50  0001 C CNN
	1    2600 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5300 2600 5300
Wire Wire Line
	2600 5300 2600 5350
Wire Wire Line
	2600 5300 3050 5300
Connection ~ 2600 5300
Wire Wire Line
	1200 6200 1200 6300
Wire Wire Line
	2600 5650 2600 5800
$Comp
L Device:Polyfuse F1
U 1 1 5E953039
P 7075 1225
F 0 "F1" H 6987 1179 50  0000 R CNN
F 1 "2,5A PPTC" H 6987 1270 50  0000 R CNN
F 2 "Varistor:RV_Disc_D7mm_W3.4mm_P5mm" H 7125 1025 50  0001 L CNN
F 3 "~" H 7075 1225 50  0001 C CNN
	1    7075 1225
	-1   0    0    1   
$EndComp
Wire Wire Line
	5575 4050 6275 4050
$Comp
L Transistor_FET:IRLZ44N Q7
U 1 1 5E8E66F6
P 6175 3800
F 0 "Q7" H 6381 3846 50  0000 L CNN
F 1 "IRLZ44N" H 6381 3755 50  0000 L CNN
F 2 "Custom:TO-263-3_Hybrid_TO-220_Tab_Dw" H 6425 3725 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 6175 3800 50  0001 L CNN
	1    6175 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 5EA9A5AC
P 3925 2550
F 0 "R24" V 3718 2550 50  0000 C CNN
F 1 "10K" V 3809 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3855 2550 50  0001 C CNN
F 3 "~" H 3925 2550 50  0001 C CNN
	1    3925 2550
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q6
U 1 1 5EB0F0B7
P 6175 2000
F 0 "Q6" H 6381 2046 50  0000 L CNN
F 1 "IRLZ44N" H 6381 1955 50  0000 L CNN
F 2 "Custom:TO-263-3_Hybrid_TO-220_Tab_Dw" H 6425 1925 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 6175 2000 50  0001 L CNN
	1    6175 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R28
U 1 1 5EB3290A
P 5350 1500
F 0 "R28" H 5281 1546 50  0000 R CNN
F 1 "100K" H 5281 1455 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5280 1500 50  0001 C CNN
F 3 "~" H 5350 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2350 4700 2275
Wire Wire Line
	5350 1650 5350 1725
Wire Wire Line
	5350 2275 5425 2275
Wire Wire Line
	5425 1725 5350 1725
Connection ~ 5350 1725
Wire Wire Line
	5350 1725 5350 2275
Wire Wire Line
	5350 1350 5350 1300
Wire Wire Line
	5725 2475 5725 2675
Wire Wire Line
	5725 2675 6275 2675
Wire Wire Line
	6275 2675 6275 2200
Wire Wire Line
	5350 1300 5725 1300
Connection ~ 5725 1300
Wire Wire Line
	5725 1300 5850 1300
Wire Wire Line
	5725 1300 5725 1525
Wire Wire Line
	6150 1300 6275 1300
Wire Wire Line
	5725 1925 5725 2000
Wire Wire Line
	5975 2000 5725 2000
Connection ~ 5725 2000
Wire Wire Line
	5725 2000 5725 2075
Connection ~ 6275 2675
Wire Wire Line
	4125 3800 4375 3800
Wire Wire Line
	4700 2275 5350 2275
Connection ~ 5350 2275
$Comp
L Device:CP C12
U 1 1 5EB90B28
P 5075 1775
F 0 "C12" H 4957 1821 50  0000 R CNN
F 1 "10uF/50V" H 4957 1730 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5113 1625 50  0001 C CNN
F 3 "~" H 5075 1775 50  0001 C CNN
	1    5075 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 1925 5075 2675
Wire Wire Line
	5075 2675 5725 2675
Connection ~ 5725 2675
Wire Wire Line
	5075 1625 5075 1300
Wire Wire Line
	5075 1300 5350 1300
Connection ~ 5350 1300
Connection ~ 6275 3125
Wire Wire Line
	6275 3125 6275 3600
Wire Wire Line
	6275 2675 6275 3125
Wire Wire Line
	6275 4050 6275 4200
Wire Wire Line
	6275 4200 7075 4200
Connection ~ 6275 4050
Connection ~ 7075 4200
$Comp
L Device:R R36
U 1 1 5EC036F1
P 9450 3025
F 0 "R36" H 9520 3071 50  0000 L CNN
F 1 "1K" H 9520 2980 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 3025 50  0001 C CNN
F 3 "~" H 9450 3025 50  0001 C CNN
	1    9450 3025
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R37
U 1 1 5EC036FD
P 10175 3800
F 0 "R37" V 9968 3800 50  0000 C CNN
F 1 "10K" V 10059 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10105 3800 50  0001 C CNN
F 3 "~" H 10175 3800 50  0001 C CNN
	1    10175 3800
	0    -1   1    0   
$EndComp
$Comp
L Device:R R32
U 1 1 5EC03703
P 8725 4050
F 0 "R32" V 8840 4050 50  0000 C CNN
F 1 "100R" V 8931 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8655 4050 50  0001 C CNN
F 3 "~" H 8725 4050 50  0001 C CNN
	1    8725 4050
	0    -1   1    0   
$EndComp
Wire Wire Line
	9450 3175 9450 3275
$Comp
L Device:D D4
U 1 1 5EC03710
P 8150 1300
F 0 "D4" H 8150 1516 50  0000 C CNN
F 1 "S1J" H 8150 1425 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 8150 1300 50  0001 C CNN
F 3 "~" H 8150 1300 50  0001 C CNN
	1    8150 1300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9275 3800 9275 3850
Wire Wire Line
	9275 4250 9275 4400
Wire Wire Line
	8975 4050 8875 4050
Connection ~ 9275 3800
Wire Wire Line
	7875 4050 7875 4000
Wire Wire Line
	10325 3800 10475 3800
Wire Wire Line
	10475 2550 10375 2550
$Comp
L power:+12V #PWR054
U 1 1 5EC03726
P 7075 850
F 0 "#PWR054" H 7075 700 50  0001 C CNN
F 1 "+12V" H 7090 1023 50  0000 C CNN
F 2 "" H 7075 850 50  0001 C CNN
F 3 "" H 7075 850 50  0001 C CNN
	1    7075 850 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8575 4050 7875 4050
$Comp
L Transistor_FET:IRLZ44N Q9
U 1 1 5EC0373C
P 7975 3800
F 0 "Q9" H 8181 3846 50  0000 L CNN
F 1 "IRLZ44N" H 8181 3755 50  0000 L CNN
F 2 "Custom:TO-263-3_Hybrid_TO-220_Tab_Dw" H 8225 3725 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 7975 3800 50  0001 L CNN
	1    7975 3800
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R39
U 1 1 5EC03758
P 10225 2550
F 0 "R39" V 10018 2550 50  0000 C CNN
F 1 "10K" V 10109 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10155 2550 50  0001 C CNN
F 3 "~" H 10225 2550 50  0001 C CNN
	1    10225 2550
	0    -1   1    0   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q8
U 1 1 5EC03769
P 7975 2000
F 0 "Q8" H 8181 2046 50  0000 L CNN
F 1 "IRLZ44N" H 8181 1955 50  0000 L CNN
F 2 "Custom:TO-263-3_Hybrid_TO-220_Tab_Dw" H 8225 1925 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 7975 2000 50  0001 L CNN
	1    7975 2000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R33
U 1 1 5EC03775
P 8800 1500
F 0 "R33" H 8730 1546 50  0000 R CNN
F 1 "100K" H 8730 1455 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8730 1500 50  0001 C CNN
F 3 "~" H 8800 1500 50  0001 C CNN
	1    8800 1500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9450 2350 9450 2275
Wire Wire Line
	8800 1650 8800 1725
Wire Wire Line
	8800 2275 8725 2275
Wire Wire Line
	8725 1725 8800 1725
Connection ~ 8800 1725
Wire Wire Line
	8800 1725 8800 2275
Wire Wire Line
	8800 1350 8800 1300
Wire Wire Line
	8425 2475 8425 2675
Wire Wire Line
	8425 2675 7875 2675
Wire Wire Line
	7875 2675 7875 2200
Wire Wire Line
	8800 1300 8425 1300
Connection ~ 8425 1300
Wire Wire Line
	8425 1300 8300 1300
Wire Wire Line
	8425 1300 8425 1525
Wire Wire Line
	8000 1300 7875 1300
Wire Wire Line
	8425 1925 8425 2000
Wire Wire Line
	8175 2000 8425 2000
Connection ~ 8425 2000
Wire Wire Line
	8425 2000 8425 2075
Connection ~ 7875 2675
Wire Wire Line
	10025 3800 9775 3800
Wire Wire Line
	9450 2275 8800 2275
Connection ~ 8800 2275
$Comp
L Device:CP C15
U 1 1 5EC03793
P 9075 1775
F 0 "C15" H 8957 1821 50  0000 R CNN
F 1 "10uF/50V" H 8957 1730 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 9113 1625 50  0001 C CNN
F 3 "~" H 9075 1775 50  0001 C CNN
	1    9075 1775
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9075 1925 9075 2675
Wire Wire Line
	9075 2675 8425 2675
Connection ~ 8425 2675
Wire Wire Line
	9075 1625 9075 1300
Wire Wire Line
	9075 1300 8800 1300
Connection ~ 8800 1300
Connection ~ 7875 3125
Wire Wire Line
	7875 3125 7875 3600
Wire Wire Line
	7875 2675 7875 3125
Wire Wire Line
	7875 4050 7875 4200
Wire Wire Line
	7875 4200 7075 4200
Connection ~ 7875 4050
Wire Wire Line
	6275 1300 6275 1575
Wire Wire Line
	7875 1300 7875 1575
Wire Wire Line
	7075 4050 7075 4200
Wire Wire Line
	7000 4750 7000 4875
Wire Wire Line
	7075 850  7075 1075
Wire Wire Line
	7075 1575 6275 1575
Connection ~ 6275 1575
Wire Wire Line
	6275 1575 6275 1800
Wire Wire Line
	7075 1575 7875 1575
Connection ~ 7075 1575
Connection ~ 7875 1575
Wire Wire Line
	7875 1575 7875 1800
$Comp
L Device:R R26
U 1 1 5EC7E7D4
P 3975 4150
F 0 "R26" V 3768 4150 50  0000 C CNN
F 1 "100R" V 3859 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3905 4150 50  0001 C CNN
F 3 "~" H 3975 4150 50  0001 C CNN
	1    3975 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	4125 4150 4375 4150
Wire Wire Line
	4375 4150 4375 3800
Connection ~ 4375 3800
Wire Wire Line
	4375 3800 4875 3800
Wire Wire Line
	7125 3125 7125 3000
Wire Wire Line
	7125 3125 7875 3125
Wire Wire Line
	7025 3125 7025 3000
Wire Wire Line
	6275 3125 7025 3125
Text Label 6650 3125 0    50   ~ 10
MOTOR_A
Text Label 7150 3125 0    50   ~ 10
MOTOR_B
Wire Wire Line
	3725 4150 3825 4150
$Comp
L Device:R R38
U 1 1 5ED0DD0C
P 10175 4150
F 0 "R38" V 9968 4150 50  0000 C CNN
F 1 "100R" V 10059 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 10105 4150 50  0001 C CNN
F 3 "~" H 10175 4150 50  0001 C CNN
	1    10175 4150
	0    -1   1    0   
$EndComp
Wire Wire Line
	10025 4150 9775 4150
Wire Wire Line
	9775 4150 9775 3800
Wire Wire Line
	10425 4150 10325 4150
Connection ~ 9775 3800
Wire Wire Line
	9775 3800 9275 3800
Wire Wire Line
	4700 2750 4700 2875
Wire Wire Line
	4075 2550 4400 2550
Wire Wire Line
	9450 2750 9450 2875
Wire Wire Line
	9750 2550 10075 2550
$Comp
L Device:R RS2
U 1 1 5EDF3A7D
P 7150 4600
F 0 "RS2" H 7080 4646 50  0000 R CNN
F 1 "0R1" H 7080 4555 50  0000 R CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.52x3.35mm_HandSolder" V 7080 4600 50  0001 C CNN
F 3 "~" H 7150 4600 50  0001 C CNN
	1    7150 4600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7150 4450 7150 4325
Wire Wire Line
	7000 4325 7000 4450
Wire Wire Line
	7150 4750 7150 4875
Wire Wire Line
	7150 4875 7075 4875
Wire Wire Line
	7000 4325 7075 4325
Wire Wire Line
	7075 4200 7075 4325
Connection ~ 7075 4325
Wire Wire Line
	7075 4325 7150 4325
Wire Wire Line
	7075 5000 7075 4875
Connection ~ 7075 4875
Wire Wire Line
	7075 4875 7000 4875
Text Notes 6625 4775 0    50   ~ 10
PTH 5W
Text Notes 7225 4775 0    50   ~ 10
SMD 2512
Wire Wire Line
	7075 1375 7075 1575
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBBB65
P 4875 4400
AR Path="/5EBBBB65" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBBB65" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 4875 4150 50  0001 C CNN
F 1 "GNDREF" H 4880 4227 50  0001 C CNN
F 2 "" H 4875 4400 50  0001 C CNN
F 3 "" H 4875 4400 50  0001 C CNN
	1    4875 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBBF31
P 7075 5000
AR Path="/5EBBBF31" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBBF31" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 7075 4750 50  0001 C CNN
F 1 "GNDREF" H 7080 4827 50  0001 C CNN
F 2 "" H 7075 5000 50  0001 C CNN
F 3 "" H 7075 5000 50  0001 C CNN
	1    7075 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBC4A7
P 9275 4400
AR Path="/5EBBC4A7" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBC4A7" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 9275 4150 50  0001 C CNN
F 1 "GNDREF" H 9280 4227 50  0001 C CNN
F 2 "" H 9275 4400 50  0001 C CNN
F 3 "" H 9275 4400 50  0001 C CNN
	1    9275 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBD77E
P 4700 3275
AR Path="/5EBBD77E" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBD77E" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 4700 3025 50  0001 C CNN
F 1 "GNDREF" H 4705 3102 50  0001 C CNN
F 2 "" H 4700 3275 50  0001 C CNN
F 3 "" H 4700 3275 50  0001 C CNN
	1    4700 3275
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBDE5A
P 9450 3275
AR Path="/5EBBDE5A" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBDE5A" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 9450 3025 50  0001 C CNN
F 1 "GNDREF" H 9455 3102 50  0001 C CNN
F 2 "" H 9450 3275 50  0001 C CNN
F 3 "" H 9450 3275 50  0001 C CNN
	1    9450 3275
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBBF4CF
P 2600 5800
AR Path="/5EBBF4CF" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBBF4CF" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 2600 5550 50  0001 C CNN
F 1 "GNDREF" H 2605 5627 50  0001 C CNN
F 2 "" H 2600 5800 50  0001 C CNN
F 3 "" H 2600 5800 50  0001 C CNN
	1    2600 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBC0A9A
P 1200 6300
AR Path="/5EBC0A9A" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBC0A9A" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 1200 6050 50  0001 C CNN
F 1 "GNDREF" H 1205 6127 50  0001 C CNN
F 2 "" H 1200 6300 50  0001 C CNN
F 3 "" H 1200 6300 50  0001 C CNN
	1    1200 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 4050 7425 4050
Text Label 7100 4050 0    50   ~ 10
V_SHUNT
Wire Wire Line
	575  5200 1250 5200
Text Label 575  5200 0    50   ~ 10
V_SHUNT
$Comp
L Device:R R?
U 1 1 5F2764C3
P 8925 5525
AR Path="/5F2764C3" Ref="R?"  Part="1" 
AR Path="/5E9F6A7F/5F2764C3" Ref="R34"  Part="1" 
F 0 "R34" H 8995 5571 50  0000 L CNN
F 1 "10K" H 8995 5480 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8855 5525 50  0001 C CNN
F 3 "~" H 8925 5525 50  0001 C CNN
	1    8925 5525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F2764C9
P 8925 5925
AR Path="/5F2764C9" Ref="R?"  Part="1" 
AR Path="/5E9F6A7F/5F2764C9" Ref="R35"  Part="1" 
F 0 "R35" H 8855 5971 50  0000 R CNN
F 1 "1K" H 8855 5880 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8855 5925 50  0001 C CNN
F 3 "~" H 8925 5925 50  0001 C CNN
	1    8925 5925
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F2764CF
P 8725 5925
AR Path="/5F2764CF" Ref="C?"  Part="1" 
AR Path="/5E9F6A7F/5F2764CF" Ref="C14"  Part="1" 
F 0 "C14" H 8840 5971 50  0000 L CNN
F 1 "100nF X7R" H 8840 5880 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8763 5775 50  0001 C CNN
F 3 "~" H 8725 5925 50  0001 C CNN
	1    8725 5925
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F2764D5
P 8925 6125
AR Path="/5F2764D5" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F2764D5" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 8925 5875 50  0001 C CNN
F 1 "GNDREF" H 8930 5952 50  0001 C CNN
F 2 "" H 8925 6125 50  0001 C CNN
F 3 "" H 8925 6125 50  0001 C CNN
	1    8925 6125
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F2764DB
P 8725 6125
AR Path="/5F2764DB" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F2764DB" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 8725 5875 50  0001 C CNN
F 1 "GNDREF" H 8730 5952 50  0001 C CNN
F 2 "" H 8725 6125 50  0001 C CNN
F 3 "" H 8725 6125 50  0001 C CNN
	1    8725 6125
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8925 5775 8925 5725
Wire Wire Line
	8925 5725 8725 5725
Wire Wire Line
	8725 5725 8725 5775
Connection ~ 8925 5725
Wire Wire Line
	8925 5725 8925 5675
Wire Wire Line
	8725 6075 8725 6125
Wire Wire Line
	8925 6075 8925 6125
Text HLabel 9025 5725 2    50   Input ~ 10
V_MOTOR
Wire Wire Line
	9025 5725 8925 5725
Wire Wire Line
	8175 3800 9275 3800
Wire Wire Line
	4875 3800 5975 3800
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5F4DB176
P 9175 4050
AR Path="/5F4DB176" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5F4DB176" Ref="Q12"  Part="1" 
F 0 "Q12" H 9366 4096 50  0000 L CNN
F 1 "BC817" H 9366 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9375 3975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 9175 4050 50  0001 L CNN
	1    9175 4050
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5F4E59F2
P 9550 2550
AR Path="/5F4E59F2" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5F4E59F2" Ref="Q13"  Part="1" 
F 0 "Q13" H 9300 2450 50  0000 L CNN
F 1 "MMBTA06" H 9300 2350 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9750 2475 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 9550 2550 50  0001 L CNN
	1    9550 2550
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5F4F8F6C
P 8525 1725
AR Path="/5F4F8F6C" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5F4F8F6C" Ref="Q10"  Part="1" 
F 0 "Q10" H 8716 1771 50  0000 L CNN
F 1 "MMBTA06" H 8716 1680 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8725 1650 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 8525 1725 50  0001 L CNN
	1    8525 1725
	-1   0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5F4F9992
P 5625 1725
AR Path="/5F4F9992" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5F4F9992" Ref="Q4"  Part="1" 
F 0 "Q4" H 5816 1771 50  0000 L CNN
F 1 "MMBTA06" H 5816 1680 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5825 1650 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 5625 1725 50  0001 L CNN
	1    5625 1725
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5F50DA8B
P 4600 2550
AR Path="/5F50DA8B" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5F50DA8B" Ref="Q2"  Part="1" 
F 0 "Q2" H 4300 2450 50  0000 L CNN
F 1 "MMBTA06" H 4300 2350 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4800 2475 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 4600 2550 50  0001 L CNN
	1    4600 2550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC807 Q11
U 1 1 5F50EE06
P 8525 2275
F 0 "Q11" H 8716 2229 50  0000 L CNN
F 1 "MMBTA56" H 8716 2320 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8725 2200 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC807.pdf" H 8525 2275 50  0001 L CNN
	1    8525 2275
	-1   0    0    1   
$EndComp
$Comp
L Transistor_BJT:BC807 Q5
U 1 1 5F523A4A
P 5625 2275
F 0 "Q5" H 5816 2229 50  0000 L CNN
F 1 "MMBTA56" H 5816 2320 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5825 2200 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC807.pdf" H 5625 2275 50  0001 L CNN
	1    5625 2275
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F78CA6C
P 6175 6375
AR Path="/5F78CA6C" Ref="R?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA6C" Ref="R31"  Part="1" 
F 0 "R31" H 6245 6421 50  0000 L CNN
F 1 "1K" H 6245 6330 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6105 6375 50  0001 C CNN
F 3 "~" H 6175 6375 50  0001 C CNN
	1    6175 6375
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5F78CA72
P 6175 6850
AR Path="/5F78CA72" Ref="C?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA72" Ref="C13"  Part="1" 
F 0 "C13" H 6290 6896 50  0000 L CNN
F 1 "100nF X7R" H 6290 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6213 6700 50  0001 C CNN
F 3 "~" H 6175 6850 50  0001 C CNN
	1    6175 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F78CA78
P 6175 7125
AR Path="/5F78CA78" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA78" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 6175 6875 50  0001 C CNN
F 1 "GNDREF" H 6180 6952 50  0001 C CNN
F 2 "" H 6175 7125 50  0001 C CNN
F 3 "" H 6175 7125 50  0001 C CNN
	1    6175 7125
	1    0    0    -1  
$EndComp
Wire Wire Line
	6175 7000 6175 7125
$Comp
L Device:R R30
U 1 1 5F78CA7F
P 6175 5900
AR Path="/5E9F6A7F/5F78CA7F" Ref="R30"  Part="1" 
AR Path="/5F78CA7F" Ref="R?"  Part="1" 
F 0 "R30" H 6105 5854 50  0000 R CNN
F 1 "100R" H 6105 5945 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6105 5900 50  0001 C CNN
F 3 "~" H 6175 5900 50  0001 C CNN
	1    6175 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6175 5750 6175 5675
$Comp
L power:+5V #PWR?
U 1 1 5F78CA86
P 6175 5675
AR Path="/5F78CA86" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA86" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 6175 5525 50  0001 C CNN
F 1 "+5V" H 6190 5848 50  0000 C CNN
F 2 "" H 6175 5675 50  0001 C CNN
F 3 "" H 6175 5675 50  0001 C CNN
	1    6175 5675
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 ARM_SENSE?
U 1 1 5F78CA8C
P 5650 6225
AR Path="/5F78CA8C" Ref="ARM_SENSE?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA8C" Ref="ARM_SENSE1"  Part="1" 
F 0 "ARM_SENSE1" H 5650 6000 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5568 5991 50  0001 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 5650 6225 50  0001 C CNN
F 3 "~" H 5650 6225 50  0001 C CNN
	1    5650 6225
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 6125 6175 6125
Wire Wire Line
	6175 6050 6175 6125
Connection ~ 6175 6125
Wire Wire Line
	6175 6125 6175 6225
$Comp
L power:GNDREF #PWR?
U 1 1 5F78CA96
P 5925 7125
AR Path="/5F78CA96" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5F78CA96" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 5925 6875 50  0001 C CNN
F 1 "GNDREF" H 5930 6952 50  0001 C CNN
F 2 "" H 5925 7125 50  0001 C CNN
F 3 "" H 5925 7125 50  0001 C CNN
	1    5925 7125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5925 7125 5925 6225
Wire Wire Line
	5925 6225 5850 6225
Wire Wire Line
	6175 6525 6175 6600
Wire Wire Line
	6375 6600 6175 6600
Connection ~ 6175 6600
Wire Wire Line
	6175 6600 6175 6700
Text HLabel 6375 6600 2    50   Output ~ 10
MOTOR_ARM
$Comp
L power:GNDREF #PWR?
U 1 1 5EBC1481
P 2700 7575
AR Path="/5EBC1481" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBC1481" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 2700 7325 50  0001 C CNN
F 1 "GNDREF" H 2705 7402 50  0001 C CNN
F 2 "" H 2700 7575 50  0001 C CNN
F 3 "" H 2700 7575 50  0001 C CNN
	1    2700 7575
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EBC0F9F
P 1075 7375
AR Path="/5EBC0F9F" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EBC0F9F" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 1075 7125 50  0001 C CNN
F 1 "GNDREF" H 1080 7202 50  0001 C CNN
F 2 "" H 1075 7375 50  0001 C CNN
F 3 "" H 1075 7375 50  0001 C CNN
	1    1075 7375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7400 2700 7575
Connection ~ 2700 7400
Wire Wire Line
	2450 7400 2700 7400
Wire Wire Line
	2450 7225 2450 7400
Wire Wire Line
	2700 6750 2700 6625
Connection ~ 2700 6750
Wire Wire Line
	2450 6750 2700 6750
Wire Wire Line
	2450 6925 2450 6750
$Comp
L Device:C C10
U 1 1 5EA6FB56
P 2450 7075
F 0 "C10" H 2336 7121 50  0000 R CNN
F 1 "100nF X7R" H 2336 7030 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2488 6925 50  0001 C CNN
F 3 "~" H 2450 7075 50  0001 C CNN
	1    2450 7075
	1    0    0    -1  
$EndComp
NoConn ~ 1825 7025
Wire Wire Line
	2700 6775 2700 6750
Wire Wire Line
	2700 7375 2700 7400
$Comp
L power:+5V #PWR047
U 1 1 5E9340B0
P 2700 6625
F 0 "#PWR047" H 2700 6475 50  0001 C CNN
F 1 "+5V" H 2715 6798 50  0000 C CNN
F 2 "" H 2700 6625 50  0001 C CNN
F 3 "" H 2700 6625 50  0001 C CNN
	1    2700 6625
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 7125 1075 7375
Connection ~ 1075 7125
Wire Wire Line
	1225 7125 1075 7125
Wire Wire Line
	1075 6925 1075 7125
Wire Wire Line
	1225 6925 1075 6925
$Comp
L Amplifier_Operational:LM358 U2
U 3 1 5E91D2E4
P 2800 7075
F 0 "U2" H 2758 7121 50  0000 L CNN
F 1 "LM358" H 2758 7030 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2800 7075 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 2800 7075 50  0001 C CNN
	3    2800 7075
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U2
U 2 1 5E91AFDA
P 1525 7025
F 0 "U2" H 1525 7392 50  0000 C CNN
F 1 "LM358" H 1525 7301 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1525 7025 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 1525 7025 50  0001 C CNN
	2    1525 7025
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 MOTOR1
U 1 1 5E88B068
P 7025 2800
F 0 "MOTOR1" V 7125 2625 50  0000 L CNN
F 1 "Conn_01x02" H 6943 2926 50  0001 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 7025 2800 50  0001 C CNN
F 3 "~" H 7025 2800 50  0001 C CNN
	1    7025 2800
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC817 Q?
U 1 1 5EB59AFB
P 4975 4050
AR Path="/5EB59AFB" Ref="Q?"  Part="1" 
AR Path="/5E9F6A7F/5EB59AFB" Ref="Q3"  Part="1" 
F 0 "Q3" H 5166 4096 50  0000 L CNN
F 1 "BC817" H 5166 4005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5175 3975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC817.pdf" H 4975 4050 50  0001 L CNN
	1    4975 4050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male FDC?
U 1 1 5ED3BE49
P 10600 5650
AR Path="/5ED3BE49" Ref="FDC?"  Part="1" 
AR Path="/5E9F6A7F/5ED3BE49" Ref="FDC1"  Part="1" 
F 0 "FDC1" H 10572 5624 50  0000 R CNN
F 1 "Conn_01x02" H 10572 5533 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 10600 5650 50  0001 C CNN
F 3 "~" H 10600 5650 50  0001 C CNN
	1    10600 5650
	-1   0    0    -1  
$EndComp
Text Label 10425 4150 0    50   ~ 10
FDC_NEG
Text Label 3725 4150 2    50   ~ 10
FDC_POS
$Comp
L power:GNDREF #PWR?
U 1 1 5ED7E842
P 10275 5850
AR Path="/5ED7E842" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5ED7E842" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 10275 5600 50  0001 C CNN
F 1 "GNDREF" H 10280 5677 50  0001 C CNN
F 2 "" H 10275 5850 50  0001 C CNN
F 3 "" H 10275 5850 50  0001 C CNN
	1    10275 5850
	1    0    0    -1  
$EndComp
Text Label 10400 6150 2    50   ~ 10
FDC_NEG
Text Label 10400 5650 2    50   ~ 10
FDC_POS
Wire Wire Line
	10275 5850 10275 5750
Wire Wire Line
	10400 5750 10275 5750
Text Label 7150 1575 0    50   ~ 10
MOTOR_SUPPLY
Text Label 9025 5300 0    50   ~ 10
MOTOR_SUPPLY
Wire Wire Line
	9025 5300 8925 5300
Wire Wire Line
	8925 5300 8925 5375
$Comp
L Connector:Conn_01x02_Male FDC?
U 1 1 5EA23ABA
P 10600 6150
AR Path="/5EA23ABA" Ref="FDC?"  Part="1" 
AR Path="/5E9F6A7F/5EA23ABA" Ref="FDC2"  Part="1" 
F 0 "FDC2" H 10572 6124 50  0000 R CNN
F 1 "Conn_01x02" H 10572 6033 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 10600 6150 50  0001 C CNN
F 3 "~" H 10600 6150 50  0001 C CNN
	1    10600 6150
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5EA24481
P 10275 6350
AR Path="/5EA24481" Ref="#PWR?"  Part="1" 
AR Path="/5E9F6A7F/5EA24481" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 10275 6100 50  0001 C CNN
F 1 "GNDREF" H 10280 6177 50  0001 C CNN
F 2 "" H 10275 6350 50  0001 C CNN
F 3 "" H 10275 6350 50  0001 C CNN
	1    10275 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10275 6350 10275 6250
Wire Wire Line
	10400 6250 10275 6250
$EndSCHEMATC
