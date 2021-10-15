
_get_converted_value:

;LR5.c,26 :: 		int get_converted_value(unsigned int value_to_convert)
;LR5.c,28 :: 		int new_value = (((value_to_convert - old_min) * new_range) / old_range) + new_min;
	LDS        R0, _old_min+0
	LDS        R1, _old_min+1
	MOVW       R16, R2
	SUB        R16, R0
	SBC        R17, R1
	LDS        R20, _new_range+0
	LDS        R21, _new_range+1
	CALL       _HWMul_16x16+0
	LDS        R20, _old_range+0
	LDS        R21, _old_range+1
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
	LDS        R18, _new_min+0
	LDS        R19, _new_min+1
	ADD        R16, R18
	ADC        R17, R19
;LR5.c,29 :: 		return new_value;
;LR5.c,30 :: 		}
L_end_get_converted_value:
	RET
; end of _get_converted_value

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR5.c,32 :: 		void main() {
;LR5.c,33 :: 		DDRB = 0xFF;               // set PORTC as output
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 255
	OUT        DDRB+0, R27
;LR5.c,34 :: 		DDRC = 0xFF;               // set PORTC as output
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR5.c,36 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LR5.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,40 :: 		old_range = old_max - old_min;
	LDS        R0, _old_min+0
	LDS        R1, _old_min+1
	LDS        R16, _old_max+0
	LDS        R17, _old_max+1
	SUB        R16, R0
	SBC        R17, R1
	STS        _old_range+0, R16
	STS        _old_range+1, R17
;LR5.c,41 :: 		new_range = new_max - new_min;
	LDS        R0, _new_min+0
	LDS        R1, _new_min+1
	LDS        R16, _new_max+0
	LDS        R17, _new_max+1
	SUB        R16, R0
	SBC        R17, R1
	STS        _new_range+0, R16
	STS        _new_range+1, R17
;LR5.c,43 :: 		while (1){
L_main0:
;LR5.c,44 :: 		Lcd_Out(1,6,message);
	LDI        R27, #lo_addr(_message+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_message+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR5.c,45 :: 		adc_rd = ADC_Read(5)/1;
	LDI        R27, 5
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _adc_rd+0, R16
	STS        _adc_rd+1, R17
;LR5.c,46 :: 		PORTB = adc_rd;
	OUT        PORTB+0, R16
;LR5.c,47 :: 		converted = get_converted_value(adc_rd);
	MOVW       R2, R16
	CALL       _get_converted_value+0
	STS        _converted+0, R16
	STS        _converted+1, R17
;LR5.c,48 :: 		IntToStr(converted, c);
	LDI        R27, #lo_addr(_c+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_c+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;LR5.c,50 :: 		Lcd_Out(2,6,c);
	LDI        R27, #lo_addr(_c+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_c+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR5.c,51 :: 		Delay_ms (100);
	LDI        R18, 6
	LDI        R17, 19
	LDI        R16, 174
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
	NOP
	NOP
;LR5.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,53 :: 		PORTC = Hi(adc_rd);
	LDS        R16, _adc_rd+1
	OUT        PORTC+0, R16
;LR5.c,54 :: 		}
	JMP        L_main0
;LR5.c,55 :: 		}
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
