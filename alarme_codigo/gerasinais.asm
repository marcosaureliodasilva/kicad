;*****************************************************************************************************************
;					PROGRAMA GERADOR DE SINAIS
;				DESENVOLVIDO POR MARCOS AURELIO DA SILVA AMORIM
;						VERSAO 1.0
;						08/09/2010 
;*****************************************************************************************************************
;					ARQUIVOS DE DEFINICOES
;*****************************************************************************************************************

include <16f628.inc>					;ARQUIVO PADRAO MICROCHIP PARA 16F628A

__config 0x1e50
;
;	_BOREN_ON		BROWN-OUT RESET
;	_CP_ON			CODE PROTECT
;	_DATA_CP_ON		CODE PROTECT MEMORIA EEPROM
;	_PWRTE_ON		POWER UP TIMER
;	_WDT_OFF			WATCHDOG TIMER
;	_LVP_OFF			LOW VOLTAGE PROGRAM
;	_MCLRE_OFF		MASTER CLEAR NO RA5
;	OSCILADOR INTERNO SEM CLOCK
;
;*****************************************************************************************************************
;					VARIAVEIS
;*****************************************************************************************************************

;ENDERECOS DAS VARIAVEIS UTILIZADAS PELO SISTEMA

FLAGS1				EQU	0X20	;0X20 USADO COM SINALIZACAO
FLAGS2				EQU	0X21	;0X21 USADO COM SINALIZACAO
DEB_BOTAO0			EQU	0X22	;0X22 USADO NO DEBOUNCE0
FREQ_BOTAO0			EQU	0X23	;0X23 USADO NO FREQ0
MUL_BOTAO0			EQU	0X24	;0X24 USADO NO FREQ0
DEB_BOTAO1			EQU	0X25	;0X25 USADO NO DEBOUNCE1
FREQ_BOTAO1			EQU	0X26	;0X26 USADO NO FREQ1
MUL_BOTAO1			EQU	0X27	;0X27 USADO NO FREQ1
DEB_BOTAO2			EQU	0X28	;0X25 USADO NO DEBOUNCE1
FREQ_BOTAO2			EQU	0X29	;0X26 USADO NO FREQ1
MUL_BOTAO2			EQU	0X30	;0X27 USADO NO FREQ1
DEB_BOTAO3			EQU	0X31	;0X25 USADO NO DEBOUNCE1
FREQ_BOTAO3			EQU	0X32	;0X26 USADO NO FREQ1
MUL_BOTAO3			EQU	0X33	;0X27 USADO NO FREQ1

;*****************************************************************************************************************
;					CONSTANTES
;*****************************************************************************************************************

;BITS DO REGISTRADOR FLAGS

V_BOTAO0			EQU	.0    ;VELOCIDADE 0
FIM_BOTAO0		EQU	.0    ;FIM 0
V_BOTAO1			EQU	.1    ;VELOCIDADE 1
FIM_BOTAO1		EQU	.1    ;FIM 1
V_BOTAO2			EQU	.2    ;VELOCIDADE 2
FIM_BOTAO2		EQU	.2    ;FIM 2
V_BOTAO3			EQU	.3    ;VELOCIDADE 3
FIM_BOTAO3		EQU	.3    ;FIM 3

;CONSTANTES UTILIZADAS NO SISTEMA

C_DEBO				EQU	.250	;TEMPO DEBO = 250ms
C_FREQ_BOTAO0		EQU	.1		;FREQ LED_BOTAO0 = 1*1/2=0.5ms=1kHz
C_MUL_BOTAO0		EQU	.1		;FREQ LED_BOTAO0
C_FREQ_BOTAO1		EQU	.2		;FREQ LED_BOTAO1 = 2*2/2=2ms=250Hz
C_MUL_BOTAO1		EQU	.2		;FREQ LED_BOTAO1
C_FREQ_BOTAO2		EQU	.5		;FREQ LED_BOTAO2 = 4*5/2=10ms=50Hz
C_MUL_BOTAO2		EQU	.4		;FREQ LED_BOTAO2
C_FREQ_BOTAO3		EQU	.1		;RESERVADO
C_MUL_BOTAO3		EQU	.1		;RESERVADO

;*****************************************************************************************************************
;					FLAGS
;*****************************************************************************************************************
;REGISTRADOR FLAGS1
;
;	BIT	|7|6|5|4|3|2|1|0|
;			|X|X|X|X|X|X|X|Y|	VELOCIDADE 0
;			|X|X|X|X|X|X|Y|X|	VELOCIDADE 1
;			|X|X|X|X|X|Y|X|X|	VELOCIDADE 2
;			|X|X|X|X|Y|X|X|X|	VELOCIDADE 3
;			|X|X|X|Y|X|X|X|X|	RESERVADO
;			|X|X|Y|X|X|X|X|X|	RESERVADO
;			|X|Y|X|X|X|X|X|X|	RESERVADO
;			|Y|X|X|X|X|X|X|X|	RESERVADO
;
;REGISTRADOR FLAGS2
;
;	BIT	|7|6|5|4|3|2|1|0|
;			|X|X|X|X|X|X|X|Y|	FIM 0
;			|X|X|X|X|X|X|Y|X|	FIM 1
;			|X|X|X|X|X|Y|X|X|	FIM 2
;			|X|X|X|X|Y|X|X|X|	FIM 3
;			|X|X|X|Y|X|X|X|X|	RESERVADO
;			|X|X|Y|X|X|X|X|X|	RESERVADO
;			|X|Y|X|X|X|X|X|X|	RESERVADO
;			|Y|X|X|X|X|X|X|X|	RESERVADO
;
;*****************************************************************************************************************
;					ENTRADAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO ENTRADA

#DEFINE		BOTAO0		PORTA,0			;1-->FECHADO	0-->ABERTO
#DEFINE		BOTAO1		PORTA,1			;1-->FECHADO	0-->ABERTO
#DEFINE		BOTAO2		PORTB,2			;1-->FECHADO	0-->ABERTO
#DEFINE		BOTAO3		PORTB,3			;1-->FECHADO	0-->ABERTO

;*****************************************************************************************************************
;					SAIDAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO SAIDA

#DEFINE		LED_BOTAO0		PORTB,0			;0-->APAGADO	1-->ACESO
#DEFINE		LED_BOTAO1		PORTB,1			;0-->APAGADO	1-->ACESO

;*****************************************************************************************************************
;					VETOR RESET
;*****************************************************************************************************************

		ORG		0x00			;ENDERECO INICIAL DE PROCESSAMENTO
		GOTO		NOVO        ;DESVIA PARA INICIO

;*****************************************************************************************************************
;AS INTERRUPCOES NAO SERAO UTILIZADAS

		ORG		0x04			;ENDERECO INICIAL DA INTERRUPCAO
		RETFIE               ;RETORNA DA INTERRUPCAO

;*****************************************************************************************************************
;					INICIO
;*****************************************************************************************************************

NOVO

	MOVLW		OPTION_REG                ;PRESCALER 1:4 NO TMRO<2:0>
	MOVWF		FSR								;RECEBE DESTINO DO APONTADOR
	MOVLW		B'10000001'               ;PULL_UPS DESABILITADOS<7>
	MOVWF		INDF								;RECEBE VALOR A SER COLOCADO NO DESTINO QUE O APONTADOR INDICA

	MOVLW		INTCON                    ;DEMAIS BITS IRRELEVANTES
	MOVWF		FSR
	MOVLW		B'00000000'               ;CHAVE GERAL DE INTERRUPCAO DESLIGADA<7>
	MOVWF		INDF
	MOVLW		B'00000111'               ;DESATIVA COMPARADORES E ABILITA I/O<2:0>
	MOVWF		CMCON

	MOVLW		TRISA
	MOVWF		FSR
	MOVLW		B'00000011'               ;DEFINE RA0, RA1 COMO ENTRADA E RESTO COMO SAIDA
	MOVWF		INDF

	MOVLW		TRISB
	MOVWF		FSR
	MOVLW		B'00001100'               ;DEFINE RB2, RB3 COMO ENTRADA E RESTO COMO SAIDA
	MOVWF		INDF

;*****************************************************************************************************************
;					INICIALIZAÇÃO DAS VARIAVEIS
;*****************************************************************************************************************

    CLRF    PORTA               	;LIMPA PORTA
    CLRF    PORTB               	;LIMPA PORTB
    MOVLW	C_DEBO          		;INICIALIZA VAR_DEB_BOTAO0
    MOVWF	DEB_BOTAO0
    MOVLW	C_FREQ_BOTAO0        ;INICIALIZA VAR_FREQ_BOTAO0
    MOVWF	FREQ_BOTAO0
    MOVLW	C_MUL_BOTAO0         ;INICIALIZA VAR_MUL_BOTAO0
    MOVWF	MUL_BOTAO0
    MOVLW	C_DEBO          		;INICIALIZA VAR_DEB_BOTAO1
    MOVWF	DEB_BOTAO1
    MOVLW	C_FREQ_BOTAO1        ;INICIALIZA VAR_FREQ_BOTAO1
    MOVWF	FREQ_BOTAO1
    MOVLW	C_MUL_BOTAO1         ;INICIALIZA VAR_MUL_BOTAO1
    MOVWF	MUL_BOTAO1
    MOVLW	C_DEBO          		;INICIALIZA VAR_DEB_BOTAO1
    MOVWF	DEB_BOTAO2
    MOVLW	C_FREQ_BOTAO2        ;INICIALIZA VAR_FREQ_BOTAO1
    MOVWF	FREQ_BOTAO2
    MOVLW	C_MUL_BOTAO2         ;INICIALIZA VAR_MUL_BOTAO1
    MOVWF	MUL_BOTAO2
    MOVLW	C_DEBO          		;INICIALIZA VAR_DEB_BOTAO1
    MOVWF	DEB_BOTAO3
    MOVLW	C_FREQ_BOTAO3        ;INICIALIZA VAR_FREQ_BOTAO1
    MOVWF	FREQ_BOTAO3
    MOVLW	C_MUL_BOTAO3         ;INICIALIZA VAR_MUL_BOTAO1
    MOVWF	MUL_BOTAO3
    MOVLW   B'00000000'          ;INICIALIZA FLAGS1
    MOVWF   FLAGS1
    MOVLW   B'00000000'          ;INICIALIZA FLAGS2
    MOVWF   FLAGS2
		
;*****************************************************************************************************************
;					ROTINA-PRINCIPAL
;*****************************************************************************************************************
		
MAIN
    CALL      TESTAR_BOTAO0            ;FUNCAO BOTAO0
    CALL      DEBOUNCE_BOTAO0          ;FUNCAO DEB_BOTAO0
    CALL      TESTAR_BOTAO1            ;FUNCAO BOTAO1
    CALL      DEBOUNCE_BOTAO1          ;FUNCAO DEB_BOTAO1
    CALL      TESTAR_BOTAO2            ;FUNCAO BOTAO1
    CALL      DEBOUNCE_BOTAO2          ;FUNCAO DEB_BOTAO1
    CALL      TESTAR_BOTAO3            ;FUNCAO BOTAO1
    CALL      DEBOUNCE_BOTAO3          ;FUNCAO DEB_BOTAO1
    CALL      PISCA_BOTAO   	  			;FUNCAO PISCA
    CALL      TEMPO_mSEG               ;FUNCAO DE TEMPO
    GOTO      MAIN

;*****************************************************************************************************************
;					SUB-ROTINAS
;*****************************************************************************************************************

TESTAR_BOTAO0
    BTFSS		BOTAO0           	;ENT_BOTAO0=1?
    GOTO		BOTAO0_0             ;NAO, CHAMA FUNCAO BOTAO0 DESATIVADO
    GOTO		BOTAO0_1             ;SIM, CHAMA FUNCAO BOTAO0 ATIVADO
    RETURN

BOTAO0_0
    BCF			FLAGS1,V_BOTAO0            ;FLAGS1,V_BOTAO0=0
    BCF			FLAGS2,FIM_BOTAO0          ;FLAGS2,FIM_BOTAO0=0
    RETURN

BOTAO0_1
    BSF			FLAGS1,V_BOTAO0            ;FLAGS1,V_BOTAO0=1
    RETURN

;*****************************************************************************************************************

DEBOUNCE_BOTAO0
    BTFSS		FLAGS1,V_BOTAO0          ;FLAGS1,V_BOTAO0=1?
    GOTO			INI_BOTAO0              ;NAO, ENTAO ZERA DEB_BOTAO0
													;SIM, ENTAO CONTINUA
    DECFSZ		DEB_BOTAO0,F           ;DECREMENTA VAR_DEB_BOTAO0, VAR_DEB_BOTAO0=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    BSF			FLAGS2,FIM_BOTAO0        ;FLAGS2,FIM_BOTAO0=1

INI_BOTAO0
    MOVLW		C_DEBO                   ;INICIALIZA VAR_DEB_BOTAO0
    MOVWF		DEB_BOTAO0
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************

F_BOTAO0
    DECFSZ		FREQ_BOTAO0,F           ;DECREMENTA VAR_FREQ_BOTAO0, VAR_FREQ_BOTAO0=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_FREQ_BOTAO0            ;INICIALIZA VAR_FREQ_BOTAO0
    MOVWF		FREQ_BOTAO0
    DECFSZ		MUL_BOTAO0,F           ;DECREMENTA VAR_MUL_BOTAO0, VAR_MUL_BOTAO0=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_MUL_BOTAO0            ;INICIALIZA VAR_MUL_BOTAO0
    MOVWF		MUL_BOTAO0
    BTFSS		LED_BOTAO0	           	;SAI_LED_BOTAO=1?
    GOTO			LED_BOTAO0_0    	      ;NAO, CHAMA FUNCAO ATIVA LED_BOTAO0
    GOTO			LED_BOTAO0_1    	      ;SIM, CHAMA FUNCAO DESATIVA LED_BOTAO0
    RETURN

LED_BOTAO0_0
    BSF			LED_BOTAO0               ;LIGA LED
    BSF			LED_BOTAO1               ;LIGA LED
    RETURN                              ;SAI DA FUNCAO

LED_BOTAO0_1
    BCF			LED_BOTAO0               ;DESLIGA LED
    BCF			LED_BOTAO1               ;DESLIGA LED
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
;*****************************************************************************************************************

TESTAR_BOTAO1
    BTFSS		BOTAO1           	;ENT_BOTAO1=1?
    GOTO		BOTAO1_0             ;NAO, CHAMA FUNCAO BOTAO1 DESATIVADO
    GOTO		BOTAO1_1             ;SIM, CHAMA FUNCAO BOTAO1 ATIVADO
    RETURN

BOTAO1_0
    BCF			FLAGS1,V_BOTAO1            ;FLAGS1,V_BOTAO1=0
    BCF			FLAGS2,FIM_BOTAO1          ;FLAGS2,FIM_BOTAO1=0
    RETURN

BOTAO1_1
    BSF			FLAGS1,V_BOTAO1            ;FLAGS1,V_BOTAO1=1
    RETURN

;*****************************************************************************************************************

DEBOUNCE_BOTAO1
    BTFSS		FLAGS1,V_BOTAO1          ;FLAGS1,V_BOTAO1=1?
    GOTO			INI_BOTAO1              ;NAO, ENTAO ZERA DEB_BOTAO1
													;SIM, ENTAO CONTINUA
    DECFSZ		DEB_BOTAO1,F           ;DECREMENTA VAR_DEB_BOTAO1, VAR_DEB_BOTAO1=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    BSF			FLAGS2,FIM_BOTAO1        ;FLAGS2,FIM_BOTAO1=1

INI_BOTAO1
    MOVLW		C_DEBO                   ;INICIALIZA VAR_DEB_BOTAO1
    MOVWF		DEB_BOTAO1
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************

F_BOTAO1
    DECFSZ		FREQ_BOTAO1,F           ;DECREMENTA VAR_FREQ_BOTAO1, VAR_FREQ_BOTAO1=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_FREQ_BOTAO1            ;INICIALIZA VAR_FREQ_BOTAO1
    MOVWF		FREQ_BOTAO1
    DECFSZ		MUL_BOTAO1,F           ;DECREMENTA VAR_MUL_BOTAO1, VAR_MUL_BOTAO1=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_MUL_BOTAO1            ;INICIALIZA VAR_MUL_BOTAO1
    MOVWF		MUL_BOTAO1
    BTFSS		LED_BOTAO0	           	;SAI_LED_BOTAO=1?
    GOTO			LED_BOTAO1_0    	      ;NAO, CHAMA FUNCAO ATIVA LED_BOTAO1
    GOTO			LED_BOTAO1_1    	      ;SIM, CHAMA FUNCAO DESATIVA LED_BOTAO1
    RETURN

LED_BOTAO1_0
    BSF			LED_BOTAO0               ;LIGA LED
    BSF			LED_BOTAO1               ;LIGA LED
    RETURN                              ;SAI DA FUNCAO

LED_BOTAO1_1
    BCF			LED_BOTAO0               ;DESLIGA LED
    BCF			LED_BOTAO1               ;DESLIGA LED
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
;*****************************************************************************************************************

TESTAR_BOTAO2
    BTFSS		BOTAO2           	;ENT_BOTAO2=1?
    GOTO		BOTAO2_0             ;NAO, CHAMA FUNCAO BOTAO2 DESATIVADO
    GOTO		BOTAO2_1             ;SIM, CHAMA FUNCAO BOTAO2 ATIVADO
    RETURN

BOTAO2_0
    BCF			FLAGS1,V_BOTAO2            ;FLAGS1,V_BOTAO2=0
    BCF			FLAGS2,FIM_BOTAO2          ;FLAGS2,FIM_BOTAO2=0
    RETURN

BOTAO2_1
    BSF			FLAGS1,V_BOTAO2            ;FLAGS1,V_BOTAO2=1
    RETURN

;*****************************************************************************************************************

DEBOUNCE_BOTAO2
    BTFSS		FLAGS1,V_BOTAO2          ;FLAGS1,V_BOTAO2=1?
    GOTO			INI_BOTAO2              ;NAO, ENTAO ZERA DEB_BOTAO2
													;SIM, ENTAO CONTINUA
    DECFSZ		DEB_BOTAO2,F           ;DECREMENTA VAR_DEB_BOTAO2, VAR_DEB_BOTAO2=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    BSF			FLAGS2,FIM_BOTAO2        ;FLAGS2,FIM_BOTAO2=1

INI_BOTAO2
    MOVLW		C_DEBO                   ;INICIALIZA VAR_DEB_BOTAO2
    MOVWF		DEB_BOTAO2
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************

F_BOTAO2
    DECFSZ		FREQ_BOTAO2,F           ;DECREMENTA VAR_FREQ_BOTAO2, VAR_FREQ_BOTAO2=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_FREQ_BOTAO2            ;INICIALIZA VAR_FREQ_BOTAO2
    MOVWF		FREQ_BOTAO2
    DECFSZ		MUL_BOTAO2,F           ;DECREMENTA VAR_MUL_BOTAO2, VAR_MUL_BOTAO2=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    MOVLW		C_MUL_BOTAO2            ;INICIALIZA VAR_MUL_BOTAO2
    MOVWF		MUL_BOTAO2
    BTFSS		LED_BOTAO0	           	;SAI_LED_BOTAO=1?
    GOTO			LED_BOTAO2_0    	      ;NAO, CHAMA FUNCAO ATIVA LED_BOTAO2
    GOTO			LED_BOTAO2_1    	      ;SIM, CHAMA FUNCAO DESATIVA LED_BOTAO2
    RETURN

LED_BOTAO2_0
    BSF			LED_BOTAO0               ;LIGA LED
    BSF			LED_BOTAO1               ;LIGA LED
    RETURN                              ;SAI DA FUNCAO

LED_BOTAO2_1
    BCF			LED_BOTAO0               ;DESLIGA LED
    BCF			LED_BOTAO1               ;DESLIGA LED
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
;*****************************************************************************************************************

TESTAR_BOTAO3
    BTFSS		BOTAO3           	;ENT_BOTAO3=1?
    GOTO		BOTAO3_0             ;NAO, CHAMA FUNCAO BOTAO3 DESATIVADO
    GOTO		BOTAO3_1             ;SIM, CHAMA FUNCAO BOTAO3 ATIVADO
    RETURN

BOTAO3_0
    BCF			FLAGS1,V_BOTAO3            ;FLAGS1,V_BOTAO3=0
    BCF			FLAGS2,FIM_BOTAO3          ;FLAGS2,FIM_BOTAO3=0
    RETURN

BOTAO3_1
    BSF			FLAGS1,V_BOTAO3            ;FLAGS1,V_BOTAO3=1
    RETURN

;*****************************************************************************************************************

DEBOUNCE_BOTAO3
    BTFSS		FLAGS1,V_BOTAO3          ;FLAGS1,V_BOTAO3=1?
    GOTO			INI_BOTAO3              ;NAO, ENTAO ZERA DEB_BOTAO3
													;SIM, ENTAO CONTINUA
    DECFSZ		DEB_BOTAO3,F           ;DECREMENTA VAR_DEB_BOTAO3, VAR_DEB_BOTAO3=0?
    RETURN              	            ;NAO, ENTAO SAI DA FUNCAO
													;SIM, ENTAO CONTINUA
    BSF			FLAGS2,FIM_BOTAO3        ;FLAGS2,FIM_BOTAO3=1

INI_BOTAO3
    MOVLW		C_DEBO                   ;INICIALIZA VAR_DEB_BOTAO3
    MOVWF		DEB_BOTAO3
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************

F_BOTAO3
    BSF			LED_BOTAO0               ;LIGA LED
    BSF			LED_BOTAO1               ;LIGA LED
    RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
;*****************************************************************************************************************

PISCA_BOTAO
   BTFSC		FLAGS2,FIM_BOTAO0        ;FLAGS2,FIM_BOTAO0=0?
   GOTO			PRE_F_BOTAO0              	   ;NAO, ENTAO VAI PARA PRE_F_BOTAO0
													;SIM, ENTAO CONTINUA
   BTFSC		FLAGS2,FIM_BOTAO1        ;FLAGS2,FIM_BOTAO1=0?
   GOTO			PRE_F_BOTAO1              	   ;NAO, ENTAO VAI PARA PRE_F_BOTAO1
													;SIM, ENTAO CONTINUA
   BTFSC		FLAGS2,FIM_BOTAO2        ;FLAGS2,FIM_BOTAO1=0?
   GOTO			PRE_F_BOTAO2              	   ;NAO, ENTAO VAI PARA PRE_F_BOTAO1
													;SIM, ENTAO CONTINUA
   BTFSC		FLAGS2,FIM_BOTAO3        ;FLAGS2,FIM_BOTAO1=0?
   GOTO			PRE_F_BOTAO3              	   ;NAO, ENTAO VAI PARA PRE_F_BOTAO1
													;SIM, ENTAO CONTINUA
   BCF			LED_BOTAO0               ;DESLIGA LED
   BCF			LED_BOTAO1               ;DESLIGA LED
   RETURN                              ;SAI DA FUNCAO

PRE_F_BOTAO0
	CALL			F_BOTAO0
   RETURN                              ;SAI DA FUNCAO

PRE_F_BOTAO1
	CALL			F_BOTAO1
   RETURN                              ;SAI DA FUNCAO

PRE_F_BOTAO2
	CALL			F_BOTAO2
   RETURN                              ;SAI DA FUNCAO

PRE_F_BOTAO3
	CALL			F_BOTAO3
   RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************

TEMPO_mSEG
												;SE PRESCALE 1:4 TEMPO=4*125=0.5ms
												;SE PRESCALE 1:8 TEMPO=8*125=1ms
												;SE PRESCALE 1:16 TEMPO=16*125=2ms
												;SE PRESCALE 1:32 TEMPO=32*125=4ms
	MOVLW		.131                    ;INICIALIZA REG_TMR0 COM 131
	MOVWF		TMR0

	BTFSS		INTCON,2                ;REG_INTCON,2=1 INDICA ESTOURO?
	GOTO		$-1   	               ;NAO, ENTAO VOLTA UMA LINHA
												;SIM, ENTAO CONTINUA
	BCF		INTCON,2                ;ZERA INTCON,2
	MOVLW		.131                    ;INICIALIZA TMR0 COM 131
	MOVWF		TMR0
	RETURN                           ;SAI DA FUNCAO

;*****************************************************************************************************************
END							;FIM DO PROGRAMA
;*****************************************************************************************************************
