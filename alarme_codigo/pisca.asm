;*****************************************************************************************************************
;					PROGRAMA PISCA-PISCA
;				DESENVOLVIDO POR MARCOS AURELIO DA SILVA AMORIM
;						VERSAO 1.0
;						19/02/2008 
;*****************************************************************************************************************
;					ARQUIVOS DE DEFINICOES
;*****************************************************************************************************************

include <16f628.inc>					;ARQUIVO PADRAO MICROCHIP PARA 16F628A

__config 0x1e50
;
;	_BOREN_ON	BROWN-OUT RESET
;	_CP_ON		CODE PROTECT
;	_DATA_CP_ON	CODE PROTECT MEMORIA EEPROM
;	_PWRTE_ON	POWER UP TIMER
;	_WDT_OFF		WATCHDOG TIMER
;	_LVP_OFF		LOW VOLTAGE PROGRAM
;	_MCLRE_OFF	MASTER CLEAR NO RA5
;
;*****************************************************************************************************************
;					VARIAVEIS
;*****************************************************************************************************************
;ENDERECOS DAS VARIAVEIS UTILIZADAS PELO SISTEMA

COUNT         EQU   0X20  ;0X20 USADO NA FUNCAO DE TEMPO
FLAGS         EQU   0X21  ;0X21 USADO COM SINALIZACAO

;*****************************************************************************************************************
;					CONSTANTES
;*****************************************************************************************************************
;CONSTANTES UTILIZADAS NO SISTEMA

;BITS DO REGISTRADOR FLAGS

TRAVAR        EQU   .0    ;LIGA PAUSA INICIAL

;*****************************************************************************************************************
;					ENTRADAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO ENTRADA

#DEFINE		BOTAO0		PORTA,0			;1-->FECHADO	0-->ABERTO
#DEFINE		BOTAO1		PORTA,1			;1-->FECHADO	0-->ABERTO

;*****************************************************************************************************************
;					SAIDAS
;*****************************************************************************************************************
;PINOS QUE SERAO USADOS COMO SAIDA

#DEFINE		LED0		PORTB,0			;0-->APAGADO	1-->ACESO
#DEFINE		LED1		PORTB,1			;0-->APAGADO	1-->ACESO

;*****************************************************************************************************************
;					VETOR RESET
;*****************************************************************************************************************

	ORG		0x00			;ENDERECO INICIAL DE PROCESSAMENTO
	GOTO		NOVO                    ;DESVIA PARA INICIO

;*****************************************************************************************************************
;AS INTERRUPCOES NAO SERAO UTILIZADAS

	ORG		0x04			;ENDERECO INICIAL DA INTERRUPCAO
	RETFIE                              	;RETORNA DA INTERRUPCAO

;*****************************************************************************************************************
;					INICIO
;*****************************************************************************************************************

NOVO

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
	MOVLW     B'00000000'               ;INICIALIZA FLAGS
	MOVWF     FLAGS
	
;*****************************************************************************************************************
;					ROTINA-PRINCIPAL
;*****************************************************************************************************************
		
MAIN
	CALL		TEMPO_4mSEG
	CALL		PAUSA_1S
	CALL		PISCA_LED
	GOTO		MAIN

;*****************************************************************************************************************
;					SUB-ROTINAS
;*****************************************************************************************************************
;DEVE-SE DECLARAR ENTRADA TRAVA E SENSOR
;DEVE-SE DECLARAR A CONSTANTE TRAVAR E SENSORIAR

PISCA_LED
	BTFSS		FLAGS,TRAVAR		;FLAGS,TRAVAR=1?
	GOTO		APAGA_LED		;NAO, ENTAO APAGA
	GOTO		ACENDE_LED		;SIM, ENTAO ACENDE

APAGA_LED

	BCF		LED0
	BSF		LED1
	RETURN                              ;SAI DA FUNCAO
	
ACENDE_LED

	BSF		LED0
	BCF		LED1
	RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
PAUSA_1S

	DECFSZ    COUNT,F                   ;DECREMENTA VAR_COUNT, VAR_COUNT=0?
	RETURN                              ;NAO, ENTAO SAI DA FUNCAO
	MOVLW     .250                      ;SIM, ENTAO INICIALIZA VAR_ COUNT COM 250
	MOVWF     COUNT
	BTFSS		FLAGS,TRAVAR		;FLAGS,travar=1?
	GOTO		VIRA_1			;NAO, ENTAO VIRA 1
	GOTO		VIRA_0			;SIM, ENTAO VIRA 0

VIRA_1
	BSF		FLAGS,TRAVAR		
	RETURN

VIRA_0
	BCF		FLAGS,TRAVAR		
	RETURN


TEMPO_4mSEG

;	MOVLW		OPTION_REG                ;PRESCALER 1:32 NO TMRO<2:0>
;	MOVWF		FSR
;	MOVLW		B'10000100'               ;PULL_UPS DESABILITADOS<7>
;	MOVWF		INDF

	MOVLW     .131                      ;INICIALIZA REG_TMR0 COM 131
	MOVWF     TMR0

	BTFSS     INTCON,2                  ;REG_INTCON,2 INDICA ESTOURO?
	GOTO      $-1                       ;NAO, ENTAO VOLTA UMA LINHA
							;SIM, ENTAO CONTINUA
	BCF       INTCON,2                  ;ZERA INTCON,2
	MOVLW     .131                      ;INICIALIZA TMR0 COM 131
	MOVWF     TMR0
	RETURN                              ;SAI DA FUNCAO

;*****************************************************************************************************************
END							;FIM DO PROGRAMA
;*****************************************************************************************************************
