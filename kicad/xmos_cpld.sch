EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:xmos_cpld
LIBS:xmos_cpld-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "XMOS CPLD slice"
Date "2016-09-10"
Rev "1"
Comp "MYND-ideal ltd"
Comment1 "Reconfigurable slice for xmos devboard collection"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 5M40ZE64 U1
U 1 1 57D31E0A
P 7550 1950
F 0 "U1" H 7600 3000 60  0000 C CNN
F 1 "5M40ZE64" H 7550 -600 60  0000 C CNN
F 2 "Housings_QFP:LQFP-64_10x10mm_Pitch0.5mm" H 7550 1950 60  0001 C CNN
F 3 "" H 7550 1950 60  0001 C CNN
	1    7550 1950
	1    0    0    -1  
$EndComp
$Comp
L +1V8 #PWR01
U 1 1 57D3637E
P 2450 5800
F 0 "#PWR01" H 2450 5650 50  0001 C CNN
F 1 "+1V8" H 2450 5940 50  0000 C CNN
F 2 "" H 2450 5800 50  0000 C CNN
F 3 "" H 2450 5800 50  0000 C CNN
	1    2450 5800
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 P1
U 1 1 57D36384
P 1950 6150
F 0 "P1" H 1950 6450 50  0000 C CNN
F 1 "CONN_02X05" H 1950 5850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05" H 1950 4950 50  0001 C CNN
F 3 "" H 1950 4950 50  0000 C CNN
	1    1950 6150
	1    0    0    -1  
$EndComp
Text Label 1700 5950 2    60   ~ 0
F1TCK
Text Label 1700 6050 2    60   ~ 0
F1TDO
Text Label 1700 6150 2    60   ~ 0
F1TMS
Text Label 1700 6350 2    60   ~ 0
F1TDI
$Comp
L GND #PWR02
U 1 1 57D36393
P 2300 6450
F 0 "#PWR02" H 2300 6200 50  0001 C CNN
F 1 "GND" H 2300 6300 50  0000 C CNN
F 2 "" H 2300 6450 50  0000 C CNN
F 3 "" H 2300 6450 50  0000 C CNN
	1    2300 6450
	1    0    0    -1  
$EndComp
NoConn ~ 2200 6150
NoConn ~ 2200 6250
NoConn ~ 1700 6250
Text Label 6550 4300 2    60   ~ 0
F1TCK
Text Label 6550 4400 2    60   ~ 0
F1TDO
Text Label 6550 4200 2    60   ~ 0
F1TDI
Text Label 6550 4100 2    60   ~ 0
F1TMS
$Comp
L SlicePcbCon S2
U 1 1 57D369AA
P 3050 2550
F 0 "S2" H 3050 1650 60  0000 C CNN
F 1 "SlicePcbCon" H 3050 3750 60  0000 C CNN
F 2 "Connect:PCI-EXPRESS" H 3000 1750 60  0001 C CNN
F 3 "" H 3050 2550 60  0000 C CNN
	1    3050 2550
	1    0    0    -1  
$EndComp
Text Label 1400 1500 2    60   ~ 0
AA1
Text Label 1400 1600 2    60   ~ 0
AA3
Text Label 1400 1700 2    60   ~ 0
AA4
Text Label 1400 1800 2    60   ~ 0
AA6
Text Label 1400 1900 2    60   ~ 0
AA7
Text Label 1400 2000 2    60   ~ 0
AA8
Text Label 1400 2100 2    60   ~ 0
AA9
Text Label 1400 2200 2    60   ~ 0
AA11
Text Label 1350 2600 2    60   ~ 0
AA12
Text Label 1350 2700 2    60   ~ 0
AA13
Text Label 1350 2800 2    60   ~ 0
AA15
Text Label 1350 2900 2    60   ~ 0
AA16
Text Label 1350 3000 2    60   ~ 0
~ARST
Text Label 1350 3100 2    60   ~ 0
AA18
Text Label 4700 1500 0    60   ~ 0
AB1
Text Label 4700 1600 0    60   ~ 0
AB2
Text Label 4700 1700 0    60   ~ 0
AB4
Text Label 4700 1800 0    60   ~ 0
AB6
Text Label 4700 1900 0    60   ~ 0
AB7
Text Label 4700 2000 0    60   ~ 0
AB9
Text Label 4700 2100 0    60   ~ 0
AB10
Text Label 4700 2200 0    60   ~ 0
AB11
Text Label 4700 2600 0    60   ~ 0
AB12
Text Label 4700 2700 0    60   ~ 0
AB13
Text Label 4700 2800 0    60   ~ 0
ACLK
Text Label 4700 2900 0    60   ~ 0
AB15
Text Label 1350 3200 2    60   ~ 0
AB17
Text Label 1350 3300 2    60   ~ 0
AB18
$Comp
L GND #PWR03
U 1 1 57D3945C
P 2450 3550
F 0 "#PWR03" H 2450 3300 50  0001 C CNN
F 1 "GND" H 2450 3400 50  0000 C CNN
F 2 "" H 2450 3550 50  0000 C CNN
F 3 "" H 2450 3550 50  0000 C CNN
	1    2450 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 57D39552
P 3750 3600
F 0 "#PWR04" H 3750 3350 50  0001 C CNN
F 1 "GND" H 3750 3450 50  0000 C CNN
F 2 "" H 3750 3600 50  0000 C CNN
F 3 "" H 3750 3600 50  0000 C CNN
	1    3750 3600
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR05
U 1 1 57D3964A
P 3650 1400
F 0 "#PWR05" H 3650 1250 50  0001 C CNN
F 1 "+3V3" H 3650 1540 50  0000 C CNN
F 2 "" H 3650 1400 50  0000 C CNN
F 3 "" H 3650 1400 50  0000 C CNN
	1    3650 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 57D396CA
P 2450 1400
F 0 "#PWR06" H 2450 1250 50  0001 C CNN
F 1 "+5V" H 2450 1540 50  0000 C CNN
F 2 "" H 2450 1400 50  0000 C CNN
F 3 "" H 2450 1400 50  0000 C CNN
	1    2450 1400
	1    0    0    -1  
$EndComp
Text Label 8500 2600 0    60   ~ 0
AA1
Text Label 8500 2800 0    60   ~ 0
AA3
Text Label 8500 3000 0    60   ~ 0
AA4
Text Label 8500 3300 0    60   ~ 0
AA6
Text Label 8500 3500 0    60   ~ 0
AA7
Text Label 8500 3700 0    60   ~ 0
AA8
Text Label 8500 3900 0    60   ~ 0
AA9
Text Label 6550 1400 2    60   ~ 0
AA11
Text Label 6550 1600 2    60   ~ 0
AA12
Text Label 6550 1800 2    60   ~ 0
AA13
Text Label 6550 2100 2    60   ~ 0
AA15
Text Label 6550 2300 2    60   ~ 0
AA16
Text Label 6550 2500 2    60   ~ 0
~ARST
Text Label 8500 3200 0    60   ~ 0
AA18
Text Label 8500 2700 0    60   ~ 0
AB1
Text Label 8500 2900 0    60   ~ 0
AB2
Text Label 8500 3100 0    60   ~ 0
AB4
Text Label 8500 3400 0    60   ~ 0
AB6
Text Label 8500 3600 0    60   ~ 0
AB7
Text Label 8500 3800 0    60   ~ 0
AB9
Text Label 6550 1300 2    60   ~ 0
AB10
Text Label 6550 1500 2    60   ~ 0
AB11
Text Label 6550 1700 2    60   ~ 0
AB12
Text Label 6550 2000 2    60   ~ 0
AB13
Text Label 6550 1900 2    60   ~ 0
ACLK
Text Label 6550 2200 2    60   ~ 0
AB15
Text Label 6550 2400 2    60   ~ 0
AB17
Text Label 6550 2600 2    60   ~ 0
AB18
$Comp
L SlicePcbCon S1
U 1 1 57D3B410
P 9950 2100
F 0 "S1" H 9950 1200 60  0000 C CNN
F 1 "SlicePcbCon" H 9950 3300 60  0000 C CNN
F 2 "m:PCIe_36" H 9900 1300 60  0001 C CNN
F 3 "" H 9950 2100 60  0000 C CNN
	1    9950 2100
	1    0    0    -1  
$EndComp
Text Label 9450 1050 2    60   ~ 0
BA1
Text Label 9450 1250 2    60   ~ 0
BA3
Text Label 9450 1350 2    60   ~ 0
BA4
Text Label 9450 1550 2    60   ~ 0
BA6
Text Label 9450 1650 2    60   ~ 0
BA7
Text Label 9450 1750 2    60   ~ 0
BA8
Text Label 9450 1850 2    60   ~ 0
BA9
Text Label 9450 2050 2    60   ~ 0
BA11
Text Label 9450 2150 2    60   ~ 0
BA12
Text Label 9450 2250 2    60   ~ 0
BA13
Text Label 9450 2450 2    60   ~ 0
BA15
Text Label 9450 2550 2    60   ~ 0
BA16
Text Label 9450 2650 2    60   ~ 0
~BRST
Text Label 9450 2750 2    60   ~ 0
BA18
Text Label 10500 1050 0    60   ~ 0
BB1
Text Label 10500 1150 0    60   ~ 0
BB2
Text Label 10500 1350 0    60   ~ 0
BB4
Text Label 10500 1550 0    60   ~ 0
BB6
Text Label 10500 1650 0    60   ~ 0
BB7
Text Label 10500 1850 0    60   ~ 0
BB9
Text Label 10500 1950 0    60   ~ 0
BB10
Text Label 10500 2050 0    60   ~ 0
BB11
Text Label 10500 2150 0    60   ~ 0
BB12
Text Label 10500 2250 0    60   ~ 0
BB13
Text Label 10500 2350 0    60   ~ 0
BCLK
Text Label 10500 2450 0    60   ~ 0
BB15
Text Label 10500 2650 0    60   ~ 0
BB17
Text Label 10500 2750 0    60   ~ 0
BB18
$Comp
L GND #PWR07
U 1 1 57D3B435
P 9050 2900
F 0 "#PWR07" H 9050 2650 50  0001 C CNN
F 1 "GND" H 9050 2750 50  0000 C CNN
F 2 "" H 9050 2900 50  0000 C CNN
F 3 "" H 9050 2900 50  0000 C CNN
	1    9050 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 57D3B441
P 10850 2900
F 0 "#PWR08" H 10850 2650 50  0001 C CNN
F 1 "GND" H 10850 2750 50  0000 C CNN
F 2 "" H 10850 2900 50  0000 C CNN
F 3 "" H 10850 2900 50  0000 C CNN
	1    10850 2900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR09
U 1 1 57D3B44D
P 11050 1300
F 0 "#PWR09" H 11050 1150 50  0001 C CNN
F 1 "+3V3" H 11050 1440 50  0000 C CNN
F 2 "" H 11050 1300 50  0000 C CNN
F 3 "" H 11050 1300 50  0000 C CNN
	1    11050 1300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 57D3B455
P 9050 950
F 0 "#PWR010" H 9050 800 50  0001 C CNN
F 1 "+5V" H 9050 1090 50  0000 C CNN
F 2 "" H 9050 950 50  0000 C CNN
F 3 "" H 9050 950 50  0000 C CNN
	1    9050 950 
	1    0    0    -1  
$EndComp
Text Label 8500 2500 0    60   ~ 0
BA1
Text Label 8500 2400 0    60   ~ 0
BB1
Text Label 8500 2100 0    60   ~ 0
BA4
Text Label 8500 2200 0    60   ~ 0
BB2
Text Label 8500 2000 0    60   ~ 0
BB4
Text Label 8500 1900 0    60   ~ 0
BA6
Text Label 8500 1800 0    60   ~ 0
BB6
Text Label 8500 1700 0    60   ~ 0
BA7
Text Label 8500 1600 0    60   ~ 0
BB7
Text Label 8500 1500 0    60   ~ 0
BA8
Text Label 8500 1400 0    60   ~ 0
BB9
Text Label 8500 1300 0    60   ~ 0
BA9
Text Label 6550 3800 2    60   ~ 0
BA11
Text Label 6550 3600 2    60   ~ 0
BA12
Text Label 6550 3400 2    60   ~ 0
BA13
Text Label 6550 3200 2    60   ~ 0
BA15
Text Label 6550 3000 2    60   ~ 0
BA16
Text Label 6550 3900 2    60   ~ 0
BB10
Text Label 6550 3700 2    60   ~ 0
BB11
Text Label 6550 3500 2    60   ~ 0
BB12
Text Label 6550 3300 2    60   ~ 0
BB13
Text Label 6550 3100 2    60   ~ 0
BB15
Text Label 6550 2900 2    60   ~ 0
BB17
Text Label 5850 2500 0    60   ~ 0
~BRST
Text Label 5850 1900 0    60   ~ 0
BCLK
Text Label 8500 2300 0    60   ~ 0
BA3
Text Label 6550 2800 2    60   ~ 0
BA18
Wire Wire Line
	2200 6350 2300 6350
Wire Wire Line
	2300 5950 2300 6450
Wire Wire Line
	2300 5950 2200 5950
Connection ~ 2300 6350
Wire Wire Line
	2200 6050 2450 6050
Wire Wire Line
	2450 6050 2450 5800
Wire Wire Line
	2550 2400 2450 2400
Wire Wire Line
	2450 1900 2450 3550
Wire Wire Line
	2550 2800 2450 2800
Connection ~ 2450 2800
Wire Wire Line
	2450 1900 2550 1900
Connection ~ 2450 2400
Wire Wire Line
	3750 3000 3600 3000
Wire Wire Line
	3750 1700 3750 3600
Wire Wire Line
	3750 2200 3600 2200
Connection ~ 3750 3000
Wire Wire Line
	3750 1700 3600 1700
Connection ~ 3750 2200
Wire Wire Line
	3600 1900 3650 1900
Wire Wire Line
	3650 1900 3650 1400
Wire Wire Line
	2550 1600 2450 1600
Wire Wire Line
	2450 1600 2450 1400
Wire Wire Line
	9450 1950 9050 1950
Wire Wire Line
	9050 1450 9050 2900
Wire Wire Line
	9450 2350 9050 2350
Connection ~ 9050 2350
Wire Wire Line
	9050 1450 9450 1450
Connection ~ 9050 1950
Wire Wire Line
	10850 2550 10500 2550
Wire Wire Line
	10850 1250 10850 2900
Wire Wire Line
	10850 1750 10500 1750
Connection ~ 10850 2550
Wire Wire Line
	10850 1250 10500 1250
Connection ~ 10850 1750
Wire Wire Line
	10500 1450 11050 1450
Wire Wire Line
	11050 1450 11050 1300
Wire Wire Line
	9450 1150 9050 1150
Wire Wire Line
	9050 1150 9050 950 
Wire Wire Line
	6550 2500 5800 2500
Wire Wire Line
	6550 1900 5800 1900
Text Label 6550 2700 2    60   ~ 0
BB18
Wire Wire Line
	8500 900  8500 1150
Wire Wire Line
	6550 900  6550 1150
Connection ~ 6550 1050
$Comp
L +3V3 #PWR011
U 1 1 57D3E757
P 6550 900
F 0 "#PWR011" H 6550 750 50  0001 C CNN
F 1 "+3V3" H 6550 1040 50  0000 C CNN
F 2 "" H 6550 900 50  0000 C CNN
F 3 "" H 6550 900 50  0000 C CNN
	1    6550 900 
	1    0    0    -1  
$EndComp
Connection ~ 8500 1050
$Comp
L +3V3 #PWR012
U 1 1 57D3E7FC
P 8500 900
F 0 "#PWR012" H 8500 750 50  0001 C CNN
F 1 "+3V3" H 8500 1040 50  0000 C CNN
F 2 "" H 8500 900 50  0000 C CNN
F 3 "" H 8500 900 50  0000 C CNN
	1    8500 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4100 8500 4300
Connection ~ 8500 4200
$Comp
L +1V8 #PWR013
U 1 1 57D3EB0D
P 8500 4100
F 0 "#PWR013" H 8500 3950 50  0001 C CNN
F 1 "+1V8" H 8500 4240 50  0000 C CNN
F 2 "" H 8500 4100 50  0000 C CNN
F 3 "" H 8500 4100 50  0000 C CNN
	1    8500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2600 6300 2600
$Comp
L NCP699SN18 U2
U 1 1 57D4065F
P 4000 6600
F 0 "U2" H 4000 7050 39  0000 C CNN
F 1 "NCP699SN18" H 4000 6550 39  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5" H 4000 6600 59  0001 C CNN
F 3 "" H 4000 6600 59  0000 C CNN
	1    4000 6600
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C1
U 1 1 57D40666
P 4600 6500
F 0 "C1" H 4610 6570 50  0000 L CNN
F 1 "2u2" H 4610 6420 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeS_EIA-3216" H 4600 6500 60  0001 C CNN
F 3 "" H 4600 6500 60  0000 C CNN
	1    4600 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 57D4066D
P 4600 6700
F 0 "#PWR014" H 4600 6450 50  0001 C CNN
F 1 "GND" H 4600 6550 50  0000 C CNN
F 2 "" H 4600 6700 60  0000 C CNN
F 3 "" H 4600 6700 60  0000 C CNN
	1    4600 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 6150 4600 6400
Connection ~ 4600 6300
Wire Wire Line
	4600 6700 4600 6600
NoConn ~ 4450 6450
Wire Wire Line
	4450 6300 5000 6300
$Comp
L +1V8 #PWR015
U 1 1 57D40678
P 4600 6150
F 0 "#PWR015" H 4600 6000 50  0001 C CNN
F 1 "+1V8" H 4600 6290 50  0000 C CNN
F 2 "" H 4600 6150 50  0000 C CNN
F 3 "" H 4600 6150 50  0000 C CNN
	1    4600 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 57D4067E
P 3300 6400
F 0 "#PWR016" H 3300 6150 50  0001 C CNN
F 1 "GND" H 3300 6250 50  0000 C CNN
F 2 "" H 3300 6400 60  0000 C CNN
F 3 "" H 3300 6400 60  0000 C CNN
	1    3300 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6400 3600 6400
Wire Wire Line
	3300 6300 3600 6300
Wire Wire Line
	3550 6300 3550 6500
Wire Wire Line
	3550 6500 3600 6500
Connection ~ 3550 6300
Text Label 2950 6250 0    31   ~ 6
VCC4V3
$Comp
L +5V #PWR017
U 1 1 57D41246
P 3300 6200
F 0 "#PWR017" H 3300 6050 50  0001 C CNN
F 1 "+5V" H 3300 6340 50  0000 C CNN
F 2 "" H 3300 6200 50  0000 C CNN
F 3 "" H 3300 6200 50  0000 C CNN
	1    3300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 6300 3300 6200
$Comp
L R_PACK8 RP1
U 1 1 57D414A3
P 1600 1850
F 0 "RP1" H 1600 2300 50  0000 C CNN
F 1 "33R" H 1600 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_Cat16-8" H 1600 1850 50  0001 C CNN
F 3 "" H 1600 1850 50  0000 C CNN
	1    1600 1850
	1    0    0    -1  
$EndComp
$Comp
L R_PACK4 RP4
U 1 1 57D415D2
P 4500 2950
F 0 "RP4" H 4500 3400 50  0000 C CNN
F 1 "33R" H 4500 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_Cat16-4" H 4500 2950 50  0001 C CNN
F 3 "" H 4500 2950 50  0000 C CNN
	1    4500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1500 2550 1500
Wire Wire Line
	2550 1700 2400 1700
Wire Wire Line
	2400 1700 2400 1600
Wire Wire Line
	2400 1600 1800 1600
Wire Wire Line
	2550 1800 2250 1800
Wire Wire Line
	2250 1800 2250 1700
Wire Wire Line
	2250 1700 1800 1700
Wire Wire Line
	2550 2000 2100 2000
Wire Wire Line
	2100 2000 2100 1800
Wire Wire Line
	2100 1800 1800 1800
Wire Wire Line
	2550 2100 2050 2100
Wire Wire Line
	2050 2100 2050 1900
Wire Wire Line
	2050 1900 1800 1900
Wire Wire Line
	2550 2200 2000 2200
Wire Wire Line
	2000 2200 2000 2000
Wire Wire Line
	2000 2000 1800 2000
Wire Wire Line
	2550 2300 1950 2300
Wire Wire Line
	1950 2300 1950 2100
Wire Wire Line
	1950 2100 1800 2100
Wire Wire Line
	2550 2500 1900 2500
Wire Wire Line
	1900 2500 1900 2200
Wire Wire Line
	1900 2200 1800 2200
$Comp
L R_PACK8 RP2
U 1 1 57D41EBF
P 1550 2950
F 0 "RP2" H 1550 3400 50  0000 C CNN
F 1 "33R" H 1550 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_Cat16-8" H 1550 2950 50  0001 C CNN
F 3 "" H 1550 2950 50  0000 C CNN
	1    1550 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2600 1750 2600
Wire Wire Line
	2550 2700 1750 2700
Wire Wire Line
	2550 2900 2050 2900
Wire Wire Line
	2050 2900 2050 2800
Wire Wire Line
	2050 2800 1750 2800
Wire Wire Line
	2550 3000 2000 3000
Wire Wire Line
	2000 3000 2000 2900
Wire Wire Line
	2000 2900 1750 2900
Wire Wire Line
	2550 3100 1950 3100
Wire Wire Line
	1950 3100 1950 3000
Wire Wire Line
	1950 3000 1750 3000
Wire Wire Line
	2550 3200 1900 3200
Wire Wire Line
	1900 3200 1900 3100
Wire Wire Line
	1900 3100 1750 3100
$Comp
L R_PACK8 RP3
U 1 1 57D42342
P 4500 1850
F 0 "RP3" H 4500 2300 50  0000 C CNN
F 1 "33R" H 4500 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_Cat16-8" H 4500 1850 50  0001 C CNN
F 3 "" H 4500 1850 50  0000 C CNN
	1    4500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1500 3600 1500
Wire Wire Line
	4300 1600 3600 1600
Wire Wire Line
	3600 2600 4300 2600
Wire Wire Line
	4300 2700 3600 2700
Wire Wire Line
	4300 2800 3600 2800
Wire Wire Line
	4300 2900 3600 2900
Wire Wire Line
	1750 3300 1850 3300
Wire Wire Line
	1850 3300 1850 3350
Wire Wire Line
	1850 3350 3600 3350
Wire Wire Line
	3600 3350 3600 3200
Wire Wire Line
	1800 3200 1800 3450
Wire Wire Line
	1800 3450 3700 3450
Wire Wire Line
	3700 3450 3700 3100
Wire Wire Line
	3700 3100 3600 3100
$Comp
L CP_Small C2
U 1 1 57D42E7B
P 5750 6500
F 0 "C2" H 5760 6570 50  0000 L CNN
F 1 "2u2" H 5760 6420 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:TantalC_SizeS_EIA-3216" H 5750 6500 60  0001 C CNN
F 3 "" H 5750 6500 60  0000 C CNN
	1    5750 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6150 5750 6400
$Comp
L +3V3 #PWR018
U 1 1 57D4301D
P 5750 6150
F 0 "#PWR018" H 5750 6000 50  0001 C CNN
F 1 "+3V3" H 5750 6290 50  0000 C CNN
F 2 "" H 5750 6150 50  0000 C CNN
F 3 "" H 5750 6150 50  0000 C CNN
	1    5750 6150
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 57D430DA
P 6050 6500
F 0 "C3" H 6075 6600 50  0000 L CNN
F 1 "100N" H 6075 6400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6088 6350 50  0001 C CNN
F 3 "" H 6050 6500 50  0000 C CNN
	1    6050 6500
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 57D431C3
P 6300 6500
F 0 "C4" H 6325 6600 50  0000 L CNN
F 1 "100N" H 6325 6400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6338 6350 50  0001 C CNN
F 3 "" H 6300 6500 50  0000 C CNN
	1    6300 6500
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 57D43200
P 6550 6500
F 0 "C5" H 6575 6600 50  0000 L CNN
F 1 "100N" H 6575 6400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6588 6350 50  0001 C CNN
F 3 "" H 6550 6500 50  0000 C CNN
	1    6550 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 6350 6050 6250
Wire Wire Line
	5750 6250 6550 6250
Connection ~ 5750 6250
Wire Wire Line
	6300 6250 6300 6350
Connection ~ 6050 6250
Wire Wire Line
	6550 6250 6550 6350
Connection ~ 6300 6250
$Comp
L GND #PWR019
U 1 1 57D433CB
P 5750 6700
F 0 "#PWR019" H 5750 6450 50  0001 C CNN
F 1 "GND" H 5750 6550 50  0000 C CNN
F 2 "" H 5750 6700 60  0000 C CNN
F 3 "" H 5750 6700 60  0000 C CNN
	1    5750 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6700 5750 6600
Wire Wire Line
	5750 6700 6550 6700
Wire Wire Line
	6050 6700 6050 6650
Wire Wire Line
	6300 6700 6300 6650
Connection ~ 6050 6700
Wire Wire Line
	6550 6700 6550 6650
Connection ~ 6300 6700
Wire Wire Line
	4300 1700 3800 1700
Wire Wire Line
	3800 1700 3800 1800
Wire Wire Line
	3800 1800 3600 1800
Wire Wire Line
	4300 1800 3850 1800
Wire Wire Line
	3850 1800 3850 2000
Wire Wire Line
	3850 2000 3600 2000
Wire Wire Line
	4300 1900 3900 1900
Wire Wire Line
	3900 1900 3900 2100
Wire Wire Line
	3900 2100 3600 2100
Wire Wire Line
	4300 2000 3950 2000
Wire Wire Line
	3950 2000 3950 2300
Wire Wire Line
	3950 2300 3600 2300
Wire Wire Line
	4300 2100 4000 2100
Wire Wire Line
	4000 2100 4000 2400
Wire Wire Line
	4000 2400 3600 2400
Wire Wire Line
	4300 2200 4050 2200
Wire Wire Line
	4050 2200 4050 2500
Wire Wire Line
	4050 2500 3600 2500
Wire Wire Line
	1800 3200 1750 3200
Text Notes 7050 6100 0    60   ~ 0
Warning! CLK, nRST, B18  lines are connected strait from the input to output. \nCPLD have only one connection to these lines. Therefore the cpld pin 7, 18, 19 \nmust be an input only.
Text Notes 1100 7500 0    60   ~ 0
Board powered 1.8V  ?! Need to check, if jtag port not drives the 1.8V  pin!!!\nIn this case, input socket need to disconnected while cpld is on\nreprograming by jtag port.\n(didn't checked, but I guess jtag port not provides 1.8V)
Text Notes 1100 4200 0    60   ~ 0
RP1..4 resitor arrays are reduce the EMI, protects the drivers.
Text Notes 1100 4350 0    60   ~ 0
CPLD has pull up resistor for each pin, if needed.
$EndSCHEMATC
