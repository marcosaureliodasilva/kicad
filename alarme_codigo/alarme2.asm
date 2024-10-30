;*****************************************************************************************************************
;					PROGRAMA ALARME DE BANCO
;				DESENVOLVIDO POR MARCOS AURELIO DA SILVA AMORIM
;						VERSAO 1.0
;						19/02/2008 
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
;	_WDT_OFF		WATCHDOG TIMER
;	_LVP_OFF		LOW VOLTAGE PROGRAM
;	_MCLRE_OFF		MASTER CLEAR NO RA5
;
;*****************************************************************************************************************
;					VARIAVEIS
;*****************************************************************************************************************
;ENDERECOS DAS VARIAVEIS UTILIZADAS PELO SISTEMA

DEBO		EQU	0X20	;0X20 USADO NO DEBOUNCE
COUNT		EQU	0X21	;0X21 USADO NA FUNCAO DE TEMPO 250
FLAGS		EQU	0X22	;0X22 USADO COM SINALIZACAO
COUNT2		EQU	0X23	;0X23 USADO NA FUNCAO DE TEMPO 60 SEG
COUNT3		EQU	0X24	;0X24 USADO NA FUNCAO DE ALARME EM MINUNOS
COUNT_S		EQU	0X25	;0X25 USADO NA FUNCAO DE ALARME ALTERNADO
COUNT_PRE	EQU	0X26	;0X25 USADO NA FUNCAO DE ALARME PRE
COUNT_POS	EQU	0X27	;0X25 USADO NA FUNCAO DE ALARME POS

;*****************************************************************************************************************
;					CONSTANTES
;*****************************************************************************************************************
;CONSTANTES UTILIZADAS NO SISTEMA

;BITS DO REGISTRADOR FLAGS

TRAVAR		EQU	.0    ;LIGA PAUSA INICIAL
PAUSA60		EQU	.1    ;LIGA TRAVA
SENSORIAR	EQU	.2    ;LIGA SENSOR
DEB_FIM		EQU	.3    ;FINALIZA DEBOUNCE
DEB_STAT	EQU	.4    ;LIGA O TEMPO DE ALARME
ALARMAR		EQU	.5    ;STATUS DO SENSOR
SIRENE		EQU	.6    ;CONTROLA SIRENE

;CONSTANTES UTILIZADAS NO SISTEMA

C_DEBO		EQU	.3	;TEMPO DEBO
C_PRE		EQU	.60	;TEMPO PRE EM SEGUNDOS
C_POS		EQU	.40	;TEMPO POS EM SEGUNDOS
C_MIN		EQU	.5	;TEMPO ALARME EM MINUTOS
C_TROCA		EQU	.250	;TEMPO DO ALTERNADOR

;*****************************************************************************************************************
;					FLAGS
;*****************************************************************************************************************
;REGISTRADOR FLAGS
;
;	BIT		|7|6|5|4|3|2|1|0|
;			|X|X|X|X|X|X|X|Y|	TESTAR_TRAVA
;			|X|X|X|X|X|X|Y|X|	PAUSAR_60SEG --> PAUSA 60SEG ANTES DO INICIO
;			|X|X|X|X|X|Y|X|X|	TESTAR_SENSOR
;			|X|X|X|X|Y|X|X|X|	DEBOUNCE
;			|X|X|X|Y|X|X|X|X|	DEBOUNCE
;			|X|X|Y|X|X|X|X|X|	ALARMAR
;			|X|Y|X|X|X|X|X|X|	SIRENE
;			|Y|X|X|X|X|X|X|X|	RESERVADO
;
;*****************************************************************************************************************
;					ENTRADAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO ENTRADA

#DEFINE		SENSOR		PORTA,0			;1-->FECHADO	0-->ABERTO
#DEFINE		TRAVA		PORTA,1			;1-->FECHADO	0-->ABERTO

;*****************************************************************************************************************
;					SAIDAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO SAIDA

#DEFINE		LED		PORTB,0			;0-->APAGADO	1-->ACESO
#DEFINE		ALARME1		PORTB,1			;0-->APAGADO	1-->ACESO
#DEFINE		ALARME2		PORTB,2			;0-->APAGADO	1-->ACESO
#DEFINE		ALARME3		PORTB,3			;0-->APAGADO	1-->ACESO

;*****************************************************************************************************************
;					VETOR RESET
;*****************************************************************************************************************

		ORG		0x00			;ENDERECO INICIAL DE PROCESSAMENTO
		GOTO		INICIO                    ;DESVIA PARA INICIO

;*****************************************************************************************************************
;AS INTERRUPCOES NAO SERAO UTILIZADAS

		ORG		0x04			;ENDERECO INICIAL DA INTERRUPCAO
		RETFIE                              ;RETORNA DA INTERRUPCAO

;*****************************************************************************************************************
;					INICIO
;*****************************************************************************************************************
INICIO

	MOVLW		OPTION_REG                ;PRESCALER 1:32 NO TMRO<2:0>
	MOVWF		FSR
	MOVLW		B'10000100'               ;PULL_UPS DESABILITADOS<7>
	MOVWF		INDF

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
	MOVLW		B'00000000'               ;DEFINE RB COMO SAIDA
	MOVWF		INDF

;*****************************************************************************************************************
;					INICIALIZAÇÃO DAS VARIAVEIS
;*****************************************************************************************************************

    CLRF      PORTA                     ;LIMPA PORTA
    CLRF      PORTB                     ;LIMPA PORTB
    MOVLW     .250                      ;INICIALIZA VAR_ COUNT COM 250
    MOVWF     COUNT
    MOVLW     .60                       ;INICIALIZA VAR_COUNT2 COM 60
    MOVWF     COUNT2
    MOVLW     C_MIN			;INICIALIZA VAR_COUNT3 COM 10
    MOVWF     COUNT3
    MOVLW     C_TROCA			;INICIALIZA VAR_COUNT_S COM 25
    MOVWF     COUNT_S
    MOVLW     C_PRE                       ;INICIALIZA VAR COM 60
    MOVWF     COUNT_PRE
    MOVLW     C_POS			;INICIALIZA VAR COM 20
    MOVWF     COUNT_POS
    MOVLW     C_DEBO                     ;INICIALIZA VAR COM 5
    MOVWF     DEBO
    MOVLW     B'00000011'               ;INICIALIZA FLAGS
    MOVWF     FLAGS
		
;*****************************************************************************************************************
;					ROTINA-PRINCIPAL
;*****************************************************************************************************************
		
MAIN
    CALL      TESTAR_TRAVA              ;FUNCAO DE TESTE DA TRAVA
    CALL      PAUSAR_60SEG              ;FUNCAO 60 SEG ANTES DA ATIVACAO
    CALL      TESTAR_SENSOR             ;FUNCAO DE TESTE DO SENSOR
    CALL      DEBOUNCE                  ;FUNCAO DEBOUNCE
    CALL      PAUSAR2_60SEG             ;FUNCAO 60 SEG ANTES DO ALARME
    CALL      TEMPO_ALARME              ;FUNCAO TEMPO ALARME
    CALL      TEMPO_4mSEG               ;FUNCAO DE TEMPO
    GOTO      MAIN

;*****************************************************************************************************************
;					SUB-ROTINAS
;*****************************************************************************************************************
;DEVE-SE DECLARAR ENTRADA TRAVA E SENSOR
;DEVE-SE DECLARAR A CONSTANTE TRAVAR E SENSORIAR

TESTAR_TRAVA
	BTFSC		TRAVA                     ;ENT_TRAVA=0?
	GOTO		TRAVA_1                   ;NAO, CHAMA FUNCAO TRAVA ATIVADA
	GOTO		TRAVA_0                   ;SIM, CHAMA FUNCAO TRAVA DESATIVADA
	RETURN
		
TRAVA_1
	MOVLW		B'00000000'               ;FECHA SISTEMA
	MOVWF		FLAGS
	CALL		ZERATUDO
	RETURN
		
TRAVA_0
	BTFSC		FLAGS,TRAVAR              ;FLAGS,TRAVAR=0?
	RETURN                              ;NAO, ENTAO SAI DA FUNCAO
					;SIM, ENTAO CONTINUA
	MOVLW		B'00000011'               ;ABRE SISTEMA
	MOVWF		FLAGS
	RETURN
		
;*****************************************************************************************************************
;DEVE-SE DECLARAR A VARIAVEL COUNT E COUNT2
;DEVE-SE DECLARAR A CONSTANTE PAUSA60

PAUSAR_60SEG
    BTFSS		FLAGS,PAUSA60             ;FLAGS,PAUSA60=1?
    RETURN              	                ;NAO, ENTAO SAI DA FUNCAO
							;SIM, ENTAO CONTINUA
    DECFSZ		COUNT,F                   ;DECREMENTA VAR_COUNT, VAR_COUNT=0?
    RETURN                              	;NAO, ENTAO SAI DA FUNCAO
    MOVLW		.250                      ;SIM, ENTAO INICIALIZA VAR_ COUNT COM 250
    MOVWF		COUNT
    DECFSZ		COUNT_PRE,F                  ;DECREMENTA VAR_COUNT_PRE, VAR_COUNT_PRE=0?
    RETURN                      	        ;NAO, ENTAO SAI DA FUNCAO
    MOVLW		C_PRE			;INICIALIZA VAR_COUNT_PRE
    MOVWF		COUNT_PRE
    BCF			FLAGS,PAUSA60             ;FLAGS,PAUSA60=0
    BSF			FLAGS,SENSORIAR           ;FLAGS,SENSORIAR=1
    BSF			LED                       ;LIGA LED
    RETURN              	                ;SAI DA FUNCAO

;*****************************************************************************************************************
;DEVE-SE DECLARAR ENTRADA SENSOR
;DEVE-SE DECLARAR CONSTANTE DEB_STAT, SENSORIAR

TESTAR_SENSOR
    BTFSS		FLAGS,SENSORIAR           ;FLAGS,SENSORIAR=1?
    RETURN              	                ;NAO, ENTAO SAI DA FUNCAO
							;SIM, ENTAO CONTINUA
    BTFSC		SENSOR                    ;ENT_SENSOR=0?
    GOTO		SENSOR_1                  ;NAO, CHAMA FUNCAO SENSOR DESATIVADO
    GOTO		SENSOR_0                  ;SIM, CHAMA FUNCAO SENSOR ATIVADO
    RETURN

SENSOR_1
    BCF			FLAGS,DEB_STAT            ;FLAGS,DEB_STAT=0
    RETURN

SENSOR_0
    BSF			FLAGS,DEB_STAT            ;FLAGS,DEB_STAT=1
    RETURN

;*****************************************************************************************************************
;DEVE-SE DECLARAR CONSTANTE DEB_FIM
;DEVE-SE DECLARAR VARIAVEL DEBO

DEBOUNCE
    BTFSS		FLAGS,DEB_STAT            ;FLAGS,DEB_STAT=1?
    GOTO		INITDEB                   ;NAO, ENTAO ZERA DEBOUNCE
							;SIM, ENTAO CONTINUA
    DECFSZ		DEBO,F                    ;DECREMENTA VAR_DEBO, VAR_DEBO=0?
    RETURN              	                ;NAO, ENTAO SAI DA FUNCAO
						;SIM, ENTAO CONTINUA
    BSF			FLAGS,DEB_FIM             ;FLAGS,DEB_FIM=1
    BCF			FLAGS,SENSORIAR           ;DESLIGA O SENSOR
    BCF			LED                       ;DESLIGA LED
    BCF			FLAGS,DEB_STAT            ;FLAGS,DEB_STAT=0

INITDEB
    MOVLW		C_DEBO                    ;INICIALIZA VAR_DEBO
    MOVWF		DEBO
    RETURN                              	;SAI DA FUNCAO

;*****************************************************************************************************************
;DEVE-SE DECLARAR A VARIAVEL COUNT E COUNT2
;DEVE-SE DECLARAR A CONSTANTE ALARMAR

PAUSAR2_60SEG
    BTFSS		FLAGS,DEB_FIM             ;FLAGS,DEB_FIM=1?
    RETURN       	                       ;NAO, ENTAO SAI DA FUNCAO
							;SIM, ENTAO CONTINUA
    DECFSZ		COUNT,F                   ;DECREMENTA VAR_COUNT, VAR_COUNT=0?
    RETURN                              	;NAO, ENTAO SAI DA FUNCAO
    MOVLW		.250                      ;SIM, ENTAO INICIALIZA VAR_ COUNT COM 250
    MOVWF		COUNT
    DECFSZ		COUNT_POS,F                  ;DECREMENTA VAR_COUNT_POS, VAR_COUNT_POS=0?
    RETURN                      	        ;NAO, ENTAO SAI DA FUNCAO
    MOVLW		C_POS			;INICIALIZA VAR_COUNT_POS
    MOVWF		COUNT_POS
    BCF			FLAGS,DEB_FIM             ;FLAGS,DEB_FIM=0
    BSF			FLAGS,ALARMAR             ;FLAGS,ALARMAR=1
    RETURN              	                ;SAI DA FUNCAO

;*****************************************************************************************************************

TEMPO_ALARME
	BTFSS		FLAGS,ALARMAR             ;FLAGS,ALARMAR=1?
	RETURN          	                    ;NAO, ENTAO SAI DA FUNCAO
						;SIM, ENTAO CONTINUA
	BSF		ALARME2                    ;ATIVA ALARME
	BSF		ALARME3                    ;ATIVA ALARME

	DECFSZ		COUNT_S,F		;DECREMENTA VAR_COUNT_S, VAR_COUNT=0?
	GOTO		TEMPORAL		;NAO, ENTAO DESATIVA ALARME
	MOVLW		C_TROCA		;SIM, ENTAO INICIALIZA VAR_COUNT_S COM
	MOVWF		COUNT_S

	BTFSC		FLAGS,SIRENE              ;FLAGS,SIRENE=0?
	GOTO		ALARME_0                  ;NAO, ENTAO DESATIVA ALARME
					;SIM, ENTAO ATIVA ALARME
	BSF		ALARME1                    ;ATIVA ALARME
	BSF		FLAGS,SIRENE
	GOTO		TEMPORAL                  ;NAO, ENTAO DESATIVA ALARME

ALARME_0
	BCF		ALARME1                   ;DESATIVA ALARME
	BCF		FLAGS,SIRENE

TEMPORAL
	DECFSZ		COUNT,F                   ;DECREMENTA VAR_COUNT, VAR_COUNT=0?
	RETURN                           	   ;NAO, ENTAO SAI DA FUNCAO
	MOVLW		.250                      ;SIM, ENTAO INICIALIZA VAR_ COUNT COM 250
	MOVWF		COUNT

	DECFSZ		COUNT2,F                  ;DECREMENTA VAR_COUNT2, VAR_COUNT2=0?
	RETURN  	                            ;NAO, ENTAO SAI DA FUNCAO
	MOVLW		.60                       ;INICIALIZA VAR_COUNT2 COM 60
	MOVWF		COUNT2

	DECFSZ		COUNT3,F                  ;DECREMENTA VAR_COUNT3, VAR_COUNT3=0?
	RETURN	        	                      ;NAO, ENTAO SAI DA FUNCAO
	MOVLW		C_MIN				;INICIALIZA VAR_COUNT3
	MOVWF		COUNT3
	MOVLW		B'00000011'               ;ABRE SISTEMA
;	MOVLW		B'00100011'               ;ABRE SISTEMA
	MOVWF		FLAGS
	CALL		ZERATUDO
	RETURN

;*****************************************************************************************************************

ZERATUDO
	CLRF		PORTA                     ;LIMPA PORTA
	CLRF		PORTB                     ;LIMPA PORTB
	MOVLW		.250                      ;INICIALIZA VAR_ COUNT COM 250
	MOVWF		COUNT
	MOVLW		.60                       ;INICIALIZA VAR_COUNT2 COM 60
	MOVWF		COUNT2
	MOVLW		C_MIN				;INICIALIZA VAR_COUNT3 COM 10
	MOVWF		COUNT3
	MOVLW		C_TROCA			;INICIALIZA VAR_COUNT_S COM 25
	MOVWF		COUNT_S
	MOVLW		C_PRE				;INICIALIZA VAR COM 60
	MOVWF		COUNT_PRE
	MOVLW		C_POS				;INICIALIZA VAR COM 20
	MOVWF		COUNT_POS
	MOVLW		C_DEBO                       ;INICIALIZA VAR COM 5
	MOVWF		DEBO
	RETURN

;*****************************************************************************************************************

TEMPO_4mSEG
;	MOVLW		OPTION_REG                ;PRESCALER 1:32 NO TMRO<2:0>
;	MOVWF		FSR
;	MOVLW		B'10000100'               ;PULL_UPS DESABILITADOS<7>
;	MOVWF		INDF
							;DEMAIS BITS IRRELEVANTES
	MOVLW		.131                      ;INICIALIZA REG_TMR0 COM 131
	MOVWF		TMR0

	BTFSS		INTCON,2                  ;REG_INTCON,2 INDICA ESTOURO?
	GOTO		$-1                       ;NAO, ENTAO VOLTA UMA LINHA
							;SIM, ENTAO CONTINUA
	BCF		INTCON,2                  ;ZERA INTCON,2
	MOVLW		.131                      ;INICIALIZA TMR0 COM 131
	MOVWF		TMR0
	RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
END							;FIM DO PROGRAMA
;*****************************************************************************************************************
