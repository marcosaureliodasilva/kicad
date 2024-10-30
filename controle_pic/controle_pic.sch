EESchema Schematic File Version 1
LIBS:power,device,conn,linear,regul,74xx,cmos4000,adc-dac,memory,xilinx,special,microcontrollers,microchip,analog_switches,motorola,intel,audio,interface,digital-audio,philips,display,cypress,siliconi,contrib,./controle_pic.cache
EELAYER 23  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title ""
Date "20 sep 2008"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Kmarq B 7550 5200 "Atenção Pino BiDi Não conectado" F=1
Kmarq B 7550 5300 "Atenção Pino BiDi Não conectado" F=1
Connection ~ 2150 5350
Wire Wire Line
	2150 5350 2150 5150
Wire Wire Line
	2150 5150 2050 5150
Connection ~ 2350 5350
Wire Wire Line
	2050 5350 2350 5350
Connection ~ 4900 6000
Wire Wire Line
	4600 6000 5200 6000
$Comp
L PWR_FLAG #FLG2
U 1 1 48D56E68
P 4600 6000
F 0 "#FLG2" H 4600 6270 30  0001 C C
F 1 "PWR_FLAG" H 4600 6230 30  0000 C C
	1    4600 6000
	0    -1   -1   0   
$EndComp
$Comp
L PWR_FLAG #FLG1
U 1 1 48D56E51
P 2050 5350
F 0 "#FLG1" H 2050 5620 30  0001 C C
F 1 "PWR_FLAG" H 2050 5580 30  0000 C C
	1    2050 5350
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR1
U 1 1 48D56E31
P 2050 5150
F 0 "#PWR1" H 2050 5100 20  0001 C C
F 1 "+12V" H 2050 5250 30  0000 C C
	1    2050 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 6000 4900 6400
$Comp
L GND #PWR2
U 1 1 48D56DB0
P 4900 6400
F 0 "#PWR2" H 4900 6400 30  0001 C C
F 1 "GND" H 4900 6330 30  0001 C C
	1    4900 6400
	1    0    0    -1  
$EndComp
NoConn ~ 5650 6600
NoConn ~ 5650 6400
$Comp
L CONN_1 P30
U 1 1 48D56D4A
P 5800 6600
F 0 "P30" H 5880 6600 40  0000 C C
F 1 "CONN_1" H 5750 6640 30  0001 C C
	1    5800 6600
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P29
U 1 1 48D56D46
P 5800 6400
F 0 "P29" H 5880 6400 40  0000 C C
F 1 "CONN_1" H 5750 6440 30  0001 C C
	1    5800 6400
	1    0    0    -1  
$EndComp
Connection ~ 8100 6900
Wire Wire Line
	9200 6900 5200 6900
Connection ~ 8250 6900
Connection ~ 8400 6900
Connection ~ 8550 6900
Connection ~ 8700 6900
Connection ~ 8100 5600
Wire Wire Line
	8100 6400 8100 5600
Connection ~ 8250 5750
Wire Wire Line
	8250 6400 8250 5750
Connection ~ 8400 5900
Wire Wire Line
	8400 6400 8400 5900
Connection ~ 8550 6050
Wire Wire Line
	8550 6400 8550 6050
Wire Wire Line
	7550 5600 8850 5600
Wire Wire Line
	7550 5700 8000 5700
Wire Wire Line
	7800 6050 7800 5900
Connection ~ 8700 6200
Wire Wire Line
	8700 6400 8700 6200
Connection ~ 10150 5600
Connection ~ 4950 4700
Wire Wire Line
	4950 4700 4950 4200
Wire Wire Line
	4950 4200 10150 4200
Wire Wire Line
	10150 4200 10150 6200
Connection ~ 10150 5750
Connection ~ 10150 5900
Connection ~ 10150 6050
Wire Wire Line
	9500 6200 9650 6200
Wire Wire Line
	9650 6050 9500 6050
Wire Wire Line
	9500 5900 9650 5900
Wire Wire Line
	9650 5750 9500 5750
Wire Wire Line
	9500 5600 9650 5600
$Comp
L CONN_1 P28
U 1 1 48D56A1C
P 9350 6200
F 0 "P28" H 9430 6200 40  0000 C C
F 1 "CONN_1" H 9300 6240 30  0001 C C
	1    9350 6200
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P27
U 1 1 48D56A16
P 9350 6050
F 0 "P27" H 9430 6050 40  0000 C C
F 1 "CONN_1" H 9300 6090 30  0001 C C
	1    9350 6050
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P26
U 1 1 48D56A12
P 9350 5900
F 0 "P26" H 9430 5900 40  0000 C C
F 1 "CONN_1" H 9300 5940 30  0001 C C
	1    9350 5900
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P25
U 1 1 48D56A0E
P 9350 5750
F 0 "P25" H 9430 5750 40  0000 C C
F 1 "CONN_1" H 9300 5790 30  0001 C C
	1    9350 5750
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P24
U 1 1 48D56A08
P 9350 5600
F 0 "P24" H 9430 5600 40  0000 C C
F 1 "CONN_1" H 9300 5640 30  0001 C C
	1    9350 5600
	-1   0    0    1   
$EndComp
$Comp
L R R17
U 1 1 48D569FF
P 9900 6200
F 0 "R17" V 9980 6200 50  0000 C C
F 1 "R" V 9900 6200 50  0000 C C
	1    9900 6200
	0    1    1    0   
$EndComp
$Comp
L R R16
U 1 1 48D569FB
P 9900 6050
F 0 "R16" V 9980 6050 50  0000 C C
F 1 "R" V 9900 6050 50  0000 C C
	1    9900 6050
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 48D569F4
P 9900 5900
F 0 "R15" V 9980 5900 50  0000 C C
F 1 "R" V 9900 5900 50  0000 C C
	1    9900 5900
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 48D569EF
P 9900 5750
F 0 "R14" V 9980 5750 50  0000 C C
F 1 "R" V 9900 5750 50  0000 C C
	1    9900 5750
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 48D569E0
P 9900 5600
F 0 "R13" V 9980 5600 50  0000 C C
F 1 "R" V 9900 5600 50  0000 C C
	1    9900 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 5950 4050 4900
Connection ~ 3800 5650
Wire Wire Line
	3800 5950 3800 5400
$Comp
L CONN_1 P23
U 1 1 48D56906
P 4050 6100
F 0 "P23" H 4130 6100 40  0000 C C
F 1 "CONN_1" H 4000 6140 30  0001 C C
	1    4050 6100
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P22
U 1 1 48D568FB
P 3800 6100
F 0 "P22" H 3880 6100 40  0000 C C
F 1 "CONN_1" H 3750 6140 30  0001 C C
	1    3800 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 5650 5200 5650
Wire Wire Line
	5200 5650 5200 5550
Connection ~ 3800 4700
Wire Wire Line
	3800 4900 3800 4700
$Comp
L R R12
U 1 1 48D568BD
P 3800 5150
F 0 "R12" V 3880 5150 50  0000 C C
F 1 "R" V 3800 5150 50  0000 C C
	1    3800 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 5750 8000 5750
Wire Wire Line
	8850 5900 7900 5900
Wire Wire Line
	7800 6050 8850 6050
Wire Wire Line
	8850 6200 7750 6200
Connection ~ 9200 5400
Wire Wire Line
	9200 6900 9200 4500
Connection ~ 9200 5100
Connection ~ 9200 4950
Connection ~ 9200 4800
Connection ~ 9200 4650
Connection ~ 5200 6000
Wire Wire Line
	5200 6900 5200 5800
Wire Wire Line
	1650 4950 1300 4950
Wire Wire Line
	1300 4950 1300 5400
Connection ~ 2750 5800
Wire Wire Line
	2750 5250 2750 5800
Connection ~ 4050 5500
Connection ~ 4750 5500
Wire Wire Line
	4450 5500 4950 5500
Wire Wire Line
	4950 5500 4950 5200
Wire Wire Line
	4950 5200 5200 5200
Connection ~ 4750 4900
Wire Wire Line
	4450 4900 5200 4900
Connection ~ 3550 4700
Wire Wire Line
	3550 4700 3550 5050
Wire Wire Line
	3150 5400 3150 4700
Wire Wire Line
	3150 4700 5200 4700
Connection ~ 3150 4950
Connection ~ 3550 5800
Wire Wire Line
	3550 5450 3550 5800
Connection ~ 4050 5800
Connection ~ 3150 5800
Wire Wire Line
	5200 5800 1800 5800
Connection ~ 2350 5800
Wire Wire Line
	2200 4950 2350 4950
Wire Wire Line
	2350 4950 2350 5400
Wire Wire Line
	7550 5800 7900 5800
$Comp
L PIC16F628A U2
U 1 1 48D565D9
P 6250 5350
F 0 "U2" H 6550 6150 60  0000 C C
F 1 "PIC16F628A" H 6700 4550 60  0000 C C
	1    6250 5350
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 48D56555
P 8100 6650
F 0 "R11" V 8180 6650 50  0000 C C
F 1 "R" V 8100 6650 50  0000 C C
	1    8100 6650
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 48D56552
P 8250 6650
F 0 "R10" V 8330 6650 50  0000 C C
F 1 "R" V 8250 6650 50  0000 C C
	1    8250 6650
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 48D5654E
P 8400 6650
F 0 "R9" V 8480 6650 50  0000 C C
F 1 "R" V 8400 6650 50  0000 C C
	1    8400 6650
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 48D56548
P 8550 6650
F 0 "R8" V 8630 6650 50  0000 C C
F 1 "R" V 8550 6650 50  0000 C C
	1    8550 6650
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 48D56543
P 8700 6650
F 0 "R7" V 8780 6650 50  0000 C C
F 1 "R" V 8700 6650 50  0000 C C
	1    8700 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 6200 7750 6000
Wire Wire Line
	7750 6000 7550 6000
Wire Wire Line
	7800 5900 7550 5900
Wire Wire Line
	7900 5800 7900 5900
Wire Wire Line
	8000 5750 8000 5700
$Comp
L CONN_1 P21
U 1 1 48D56504
P 9000 6200
F 0 "P21" H 9080 6200 40  0000 C C
F 1 "CONN_1" H 8950 6240 30  0001 C C
	1    9000 6200
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P20
U 1 1 48D564FE
P 9000 6050
F 0 "P20" H 9080 6050 40  0000 C C
F 1 "CONN_1" H 8950 6090 30  0001 C C
	1    9000 6050
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P19
U 1 1 48D564F0
P 9000 5900
F 0 "P19" H 9080 5900 40  0000 C C
F 1 "CONN_1" H 8950 5940 30  0001 C C
	1    9000 5900
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P18
U 1 1 48D564E6
P 9000 5750
F 0 "P18" H 9080 5750 40  0000 C C
F 1 "CONN_1" H 8950 5790 30  0001 C C
	1    9000 5750
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P17
U 1 1 48D564DF
P 9000 5600
F 0 "P17" H 9080 5600 40  0000 C C
F 1 "CONN_1" H 8950 5640 30  0001 C C
	1    9000 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4500 8300 4500
Wire Wire Line
	8300 4650 8600 4650
Wire Wire Line
	8600 4800 8300 4800
Wire Wire Line
	8300 4950 8600 4950
Wire Wire Line
	8600 5100 8300 5100
Wire Wire Line
	8300 5400 8600 5400
Wire Wire Line
	7800 4500 7650 4500
Wire Wire Line
	7650 4500 7650 4700
Wire Wire Line
	7650 4700 7550 4700
Wire Wire Line
	7800 4650 7700 4650
Wire Wire Line
	7700 4650 7700 4800
Wire Wire Line
	7700 4800 7550 4800
Wire Wire Line
	7800 4800 7800 4900
Wire Wire Line
	7800 4900 7550 4900
Wire Wire Line
	7800 4950 7800 5000
Wire Wire Line
	7800 5000 7550 5000
Wire Wire Line
	7550 5100 7800 5100
Wire Wire Line
	7550 5400 7800 5400
$Comp
L CONN_1 P16
U 1 1 48D56454
P 1300 5550
F 0 "P16" H 1380 5550 40  0000 C C
F 1 "CONN_1" H 1250 5590 30  0001 C C
	1    1300 5550
	0    1    1    0   
$EndComp
$Comp
L CONN_1 P15
U 1 1 48D5644B
P 1650 5800
F 0 "P15" H 1730 5800 40  0000 C C
F 1 "CONN_1" H 1600 5840 30  0001 C C
	1    1650 5800
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P14
U 1 1 48D56442
P 1800 4950
F 0 "P14" H 1880 4950 40  0000 C C
F 1 "CONN_1" H 1750 4990 30  0001 C C
	1    1800 4950
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P13
U 1 1 48D5643E
P 2050 4950
F 0 "P13" H 2130 4950 40  0000 C C
F 1 "CONN_1" H 2000 4990 30  0001 C C
	1    2050 4950
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P12
U 1 1 48D56431
P 9050 4500
F 0 "P12" H 9130 4500 40  0000 C C
F 1 "CONN_1" H 9000 4540 30  0001 C C
	1    9050 4500
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P11
U 1 1 48D5642C
P 9050 4650
F 0 "P11" H 9130 4650 40  0000 C C
F 1 "CONN_1" H 9000 4690 30  0001 C C
	1    9050 4650
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P10
U 1 1 48D56427
P 9050 4800
F 0 "P10" H 9130 4800 40  0000 C C
F 1 "CONN_1" H 9000 4840 30  0001 C C
	1    9050 4800
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P9
U 1 1 48D56421
P 9050 4950
F 0 "P9" H 9130 4950 40  0000 C C
F 1 "CONN_1" H 9000 4990 30  0001 C C
	1    9050 4950
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P8
U 1 1 48D5641B
P 9050 5100
F 0 "P8" H 9130 5100 40  0000 C C
F 1 "CONN_1" H 9000 5140 30  0001 C C
	1    9050 5100
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P7
U 1 1 48D56413
P 9050 5400
F 0 "P7" H 9130 5400 40  0000 C C
F 1 "CONN_1" H 9000 5440 30  0001 C C
	1    9050 5400
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P6
U 1 1 48D563FF
P 8750 4500
F 0 "P6" H 8830 4500 40  0000 C C
F 1 "CONN_1" H 8700 4540 30  0001 C C
	1    8750 4500
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P5
U 1 1 48D563F8
P 8750 4650
F 0 "P5" H 8830 4650 40  0000 C C
F 1 "CONN_1" H 8700 4690 30  0001 C C
	1    8750 4650
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P4
U 1 1 48D563F3
P 8750 4800
F 0 "P4" H 8830 4800 40  0000 C C
F 1 "CONN_1" H 8700 4840 30  0001 C C
	1    8750 4800
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P3
U 1 1 48D563ED
P 8750 4950
F 0 "P3" H 8830 4950 40  0000 C C
F 1 "CONN_1" H 8700 4990 30  0001 C C
	1    8750 4950
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P2
U 1 1 48D563E7
P 8750 5100
F 0 "P2" H 8830 5100 40  0000 C C
F 1 "CONN_1" H 8700 5140 30  0001 C C
	1    8750 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 P1
U 1 1 48D563CB
P 8750 5400
F 0 "P1" H 8830 5400 40  0000 C C
F 1 "CONN_1" H 8700 5440 30  0001 C C
	1    8750 5400
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 48D5632A
P 8050 4500
F 0 "R6" V 8130 4500 50  0000 C C
F 1 "R" V 8050 4500 50  0000 C C
	1    8050 4500
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 48D56321
P 8050 4650
F 0 "R5" V 8130 4650 50  0000 C C
F 1 "R" V 8050 4650 50  0000 C C
	1    8050 4650
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 48D56316
P 8050 4800
F 0 "R4" V 8130 4800 50  0000 C C
F 1 "R" V 8050 4800 50  0000 C C
	1    8050 4800
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 48D5630F
P 8050 4950
F 0 "R3" V 8130 4950 50  0000 C C
F 1 "R" V 8050 4950 50  0000 C C
	1    8050 4950
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 48D56305
P 8050 5100
F 0 "R2" V 8130 5100 50  0000 C C
F 1 "R" V 8050 5100 50  0000 C C
	1    8050 5100
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 48D562F2
P 8050 5400
F 0 "R1" V 8130 5400 50  0000 C C
F 1 "R" V 8050 5400 50  0000 C C
	1    8050 5400
	0    1    1    0   
$EndComp
$Comp
L CRYSTAL X1
U 1 1 48D56203
P 4750 5200
F 0 "X1" H 4750 5350 60  0000 C C
F 1 "CRYSTAL" H 4750 5050 60  0000 C C
	1    4750 5200
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 48D561E1
P 4250 5500
F 0 "C3" H 4300 5600 50  0000 L C
F 1 "C" H 4300 5400 50  0000 L C
	1    4250 5500
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 48D561DE
P 4250 4900
F 0 "C2" H 4300 5000 50  0000 L C
F 1 "C" H 4300 4800 50  0000 L C
	1    4250 4900
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 48D561A7
P 3550 5250
F 0 "C1" H 3600 5350 50  0000 L C
F 1 "C" H 3600 5150 50  0000 L C
	1    3550 5250
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C5
U 1 1 48D56185
P 3150 5600
F 0 "C5" H 3200 5700 50  0000 L C
F 1 "CAPAPOL" H 3200 5500 50  0000 L C
	1    3150 5600
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C4
U 1 1 48D5617F
P 2350 5600
F 0 "C4" H 2400 5700 50  0000 L C
F 1 "CAPAPOL" H 2400 5500 50  0000 L C
	1    2350 5600
	1    0    0    -1  
$EndComp
$Comp
L 7805 U1
U 1 1 48D5614F
P 2750 5000
F 0 "U1" H 2900 4804 60  0000 C C
F 1 "7805" H 2750 5200 60  0000 C C
	1    2750 5000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
