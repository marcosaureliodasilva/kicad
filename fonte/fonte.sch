EESchema Schematic File Version 1
LIBS:power,device,transistors,conn,linear,regul,74xx,cmos4000,adc-dac,memory,xilinx,special,microcontrollers,dsp,microchip,analog_switches,motorola,texas,intel,audio,interface,digital-audio,philips,display,cypress,siliconi,contrib,valves,.\FONTE.cache
EELAYER 23  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "noname.sch"
Date "10 mar 2008"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4700 4400
NoConn ~ 6850 4400
$Comp
L CONN_1 P6
U 1 1 47D582F8
P 7000 4400
F 0 "P6" H 7080 4400 40  0000 L C
F 1 "CONN_1" H 7000 4455 30  0001 C C
	1    7000 4400
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P5
U 1 1 47D582F3
P 4850 4400
F 0 "P5" H 4930 4400 40  0000 L C
F 1 "CONN_1" H 4850 4455 30  0001 C C
	1    4850 4400
	1    0    0    -1  
$EndComp
Connection ~ 5900 4400
Wire Wire Line
	6300 4400 5550 4400
Wire Wire Line
	5500 3600 4850 3600
Wire Wire Line
	6750 3600 6300 3600
Wire Wire Line
	6500 3600 6500 3750
Connection ~ 5900 4150
Wire Wire Line
	5250 4150 6500 4150
Wire Wire Line
	5250 3600 5250 3750
Connection ~ 5250 3600
Connection ~ 6500 3600
Wire Wire Line
	5900 4400 5900 3900
$Comp
L CONN_1 P3
U 1 1 47D5432C
P 6450 4400
F 0 "P3" H 6530 4400 40  0000 L C
F 1 "CONN_1" H 6450 4455 30  0001 C C
	1    6450 4400
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P2
U 1 1 47D54329
P 5400 4400
F 0 "P2" H 5480 4400 40  0000 L C
F 1 "CONN_1" H 5400 4455 30  0001 C C
	1    5400 4400
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P1
U 1 1 47D5431F
P 4700 3600
F 0 "P1" H 4780 3600 40  0000 L C
F 1 "CONN_1" H 4700 3655 30  0001 C C
	1    4700 3600
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P4
U 1 1 47D5429C
P 6900 3600
F 0 "P4" H 6980 3600 40  0000 L C
F 1 "CONN_1" H 6900 3655 30  0001 C C
	1    6900 3600
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C2
U 1 1 47D52EA3
P 6500 3950
F 0 "C2" H 6550 4050 50  0000 L C
F 1 "10uf" H 6550 3850 50  0000 L C
	1    6500 3950
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C1
U 1 1 47D52E98
P 5250 3950
F 0 "C1" H 5300 4050 50  0000 L C
F 1 "1000uF" H 5300 3850 50  0000 L C
	1    5250 3950
	1    0    0    -1  
$EndComp
$Comp
L 7805 U1
U 1 1 47D52E03
P 5900 3650
F 0 "U1" H 6050 3454 60  0000 C C
F 1 "7805" H 5900 3850 60  0000 C C
	1    5900 3650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
