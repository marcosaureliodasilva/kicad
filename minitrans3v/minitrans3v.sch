EESchema Schematic File Version 1
LIBS:power,device,transistors,conn,linear,regul,74xx,cmos4000,adc-dac,memory,xilinx,special,microcontrollers,dsp,microchip,analog_switches,motorola,texas,intel,audio,interface,digital-audio,philips,display,cypress,siliconi,contrib,valves
EELAYER 43  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title ""
Date "12 mar 2009"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7100 5300 6850 5300
Connection ~ 5900 2800
Wire Wire Line
	5900 2650 5900 2800
Connection ~ 6800 2800
Wire Wire Line
	6800 2550 6800 2800
Connection ~ 5500 2800
Wire Wire Line
	4200 2800 7900 2800
Wire Wire Line
	4200 2800 4200 3550
Connection ~ 7000 2800
Connection ~ 7400 2800
Wire Wire Line
	7900 2800 7900 3800
Connection ~ 7400 3600
Wire Wire Line
	7600 3600 7000 3600
Connection ~ 5500 4750
Wire Wire Line
	5000 4750 7900 4750
Connection ~ 4200 4250
Wire Wire Line
	4200 4050 4200 4750
Wire Wire Line
	5500 4750 5500 4450
Connection ~ 7000 4750
Connection ~ 7000 3100
Connection ~ 7000 3600
Wire Wire Line
	6700 3900 6150 3900
Wire Wire Line
	6400 4050 6400 3800
Connection ~ 4750 4250
Wire Wire Line
	4750 4250 4750 3900
Wire Wire Line
	4750 3900 4850 3900
Connection ~ 5500 3900
Wire Wire Line
	4700 4250 5200 4250
Wire Wire Line
	5500 4050 5500 3800
Wire Wire Line
	5750 3900 5350 3900
Wire Wire Line
	4200 4250 4300 4250
Connection ~ 6400 3900
Wire Wire Line
	7000 3700 7000 3500
Wire Wire Line
	7000 4250 7000 4100
Wire Wire Line
	7400 4100 7400 4200
Wire Wire Line
	7400 4200 7000 4200
Connection ~ 7000 4200
Wire Wire Line
	7900 4750 7900 4200
Connection ~ 6400 4750
Wire Wire Line
	4200 4750 4400 4750
Wire Wire Line
	6400 5050 6400 4450
Wire Wire Line
	7000 2800 7000 3100
Wire Wire Line
	7400 3400 7400 3700
Wire Wire Line
	5500 2800 5500 3300
Connection ~ 6400 2800
Wire Wire Line
	6400 2600 6400 3300
Wire Wire Line
	6800 5000 6800 4750
Connection ~ 6800 4750
Wire Wire Line
	5950 4950 5950 4750
Connection ~ 5950 4750
$Comp
L CONN_1 P8
U 1 1 49B851FB
P 6700 5300
F 0 "P8" H 6780 5300 40  0000 L C
F 1 "CONN_1" H 6700 5355 30  0001 C C
	1    6700 5300
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P9
U 1 1 49B851F7
P 7250 5300
F 0 "P9" H 7330 5300 40  0000 L C
F 1 "CONN_1" H 7250 5355 30  0001 C C
	1    7250 5300
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG01
U 1 1 49B84973
P 5950 4950
F 0 "#FLG01" H 5950 5220 30  0001 C C
F 1 "PWR_FLAG" H 5950 5180 30  0000 C C
	1    5950 4950
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 49B8496A
P 5900 2650
F 0 "#FLG02" H 5900 2920 30  0001 C C
F 1 "PWR_FLAG" H 5900 2880 30  0000 C C
	1    5900 2650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 49B84946
P 6800 2550
F 0 "#PWR03" H 6800 2510 30  0001 C C
F 1 "+3.3V" H 6800 2660 30  0000 C C
	1    6800 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 49B84922
P 6800 5000
F 0 "#PWR04" H 6800 5000 30  0001 C C
F 1 "GND" H 6800 4930 30  0001 C C
	1    6800 5000
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 49B842D4
P 7400 3100
F 0 "L1" V 7350 3100 40  0000 C C
F 1 "INDUCTOR" V 7500 3100 40  0000 C C
	1    7400 3100
	1    0    0    -1  
$EndComp
NoConn ~ 8350 2700
NoConn ~ 8400 2900
$Comp
L CONN_1 P7
U 1 1 49B84062
P 8550 2900
F 0 "P7" H 8630 2900 40  0000 L C
F 1 "CONN_1" H 8550 2955 30  0001 C C
	1    8550 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P6
U 1 1 49B84060
P 8500 2700
F 0 "P6" H 8580 2700 40  0000 L C
F 1 "CONN_1" H 8500 2755 30  0001 C C
	1    8500 2700
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P1
U 1 1 49B8405D
P 4550 4750
F 0 "P1" H 4630 4750 40  0000 L C
F 1 "CONN_1" H 4550 4805 30  0001 C C
	1    4550 4750
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P2
U 1 1 49B84058
P 4850 4750
F 0 "P2" H 4930 4750 40  0000 L C
F 1 "CONN_1" H 4850 4805 30  0001 C C
	1    4850 4750
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P4
U 1 1 49B84055
P 6400 5200
F 0 "P4" H 6480 5200 40  0000 L C
F 1 "CONN_1" H 6400 5255 30  0001 C C
	1    6400 5200
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P3
U 1 1 49B84053
P 6400 2450
F 0 "P3" H 6480 2450 40  0000 L C
F 1 "CONN_1" H 6400 2505 30  0001 C C
	1    6400 2450
	0    -1   -1   0   
$EndComp
$Comp
L CONN_1 P5
U 1 1 49B8404D
P 7750 3600
F 0 "P5" H 7830 3600 40  0000 L C
F 1 "CONN_1" H 7750 3655 30  0001 C C
	1    7750 3600
	1    0    0    -1  
$EndComp
$Comp
L NPN Q2
U 1 1 49B84030
P 6900 3900
F 0 "Q2" H 7050 3900 50  0000 C C
F 1 "NPN" H 6802 4050 50  0000 C C
	1    6900 3900
	1    0    0    -1  
$EndComp
$Comp
L NPN Q1
U 1 1 49B8402D
P 5400 4250
F 0 "Q1" H 5550 4250 50  0000 C C
F 1 "NPN" H 5302 4400 50  0000 C C
	1    5400 4250
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 49B83FBD
P 5100 3900
F 0 "R2" V 5180 3900 50  0000 C C
F 1 "R" V 5100 3900 50  0000 C C
	1    5100 3900
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 49B83FBA
P 5500 3550
F 0 "R3" V 5580 3550 50  0000 C C
F 1 "R" V 5500 3550 50  0000 C C
	1    5500 3550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 49B83FB7
P 4200 3800
F 0 "R1" V 4280 3800 50  0000 C C
F 1 "R" V 4200 3800 50  0000 C C
	1    4200 3800
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 49B83FB4
P 7000 4500
F 0 "R5" V 7080 4500 50  0000 C C
F 1 "R" V 7000 4500 50  0000 C C
	1    7000 4500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 49B83FB0
P 6400 3550
F 0 "R4" V 6480 3550 50  0000 C C
F 1 "R" V 6400 3550 50  0000 C C
	1    6400 3550
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 49B83F99
P 7900 4000
F 0 "C6" H 7950 4100 50  0000 L C
F 1 "C" H 7950 3900 50  0000 L C
	1    7900 4000
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 49B83F96
P 6400 4250
F 0 "C3" H 6450 4350 50  0000 L C
F 1 "C" H 6450 4150 50  0000 L C
	1    6400 4250
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 49B83F93
P 7400 3900
F 0 "C5" H 7450 4000 50  0000 L C
F 1 "C" H 7450 3800 50  0000 L C
	1    7400 3900
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 49B83F90
P 7000 3300
F 0 "C4" H 7050 3400 50  0000 L C
F 1 "C" H 7050 3200 50  0000 L C
	1    7000 3300
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 49B83F8D
P 5950 3900
F 0 "C2" H 6000 4000 50  0000 L C
F 1 "C" H 6000 3800 50  0000 L C
	1    5950 3900
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 49B83F6E
P 4500 4250
F 0 "C1" H 4550 4350 50  0000 L C
F 1 "C" H 4550 4150 50  0000 L C
	1    4500 4250
	0    1    1    0   
$EndComp
$EndSCHEMATC
