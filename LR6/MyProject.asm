
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MyProject.c,28 :: 		void main() {
;MyProject.c,30 :: 		Lcd_Init();
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.c,32 :: 		Lcd_Cmd(_LCD_FIRST_ROW);           // Move cursor to the 1st row
	LDI        R27, 128
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.c,35 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	LDI        R27, 64
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;MyProject.c,36 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	LDI        R18, 6
	LDI        R17, 19
	LDI        R16, 174
L_main0:
	DEC        R16
	BRNE       L_main0
	DEC        R17
	BRNE       L_main0
	DEC        R18
	BRNE       L_main0
	NOP
	NOP
;MyProject.c,37 :: 		while(1)
L_main2:
;MyProject.c,39 :: 		if(UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	TST        R16
	BRNE       L__main9
	JMP        L_main4
L__main9:
;MyProject.c,41 :: 		if(lcd_row % (lcd_row_max + 1) == 0)
	LDS        R16, _lcd_row_max+0
	LDS        R17, _lcd_row_max+1
	MOVW       R20, R16
	SUBI       R20, 255
	SBCI       R21, 255
	LDS        R16, _lcd_row+0
	LDS        R17, _lcd_row+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	CPI        R17, 0
	BRNE       L__main10
	CPI        R16, 0
L__main10:
	BREQ       L__main11
	JMP        L_main5
L__main11:
;MyProject.c,43 :: 		Lcd_Cmd(_LCD_FIRST_ROW);           // Move cursor to the 1st row
	LDI        R27, 128
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.c,44 :: 		}
L_main5:
;MyProject.c,45 :: 		current_char_at_UART = UART_Read();
	CALL       _UART_Read+0
	STS        _current_char_at_UART+0, R16
;MyProject.c,46 :: 		Lcd_Chr_CP(current_char_at_UART);
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
;MyProject.c,47 :: 		Delay_ms(700);
	LDI        R18, 36
	LDI        R17, 131
	LDI        R16, 208
L_main6:
	DEC        R16
	BRNE       L_main6
	DEC        R17
	BRNE       L_main6
	DEC        R18
	BRNE       L_main6
;MyProject.c,49 :: 		lcd_row++;
	LDS        R16, _lcd_row+0
	LDS        R17, _lcd_row+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _lcd_row+0, R16
	STS        _lcd_row+1, R17
;MyProject.c,50 :: 		lcd_columns++;
	LDS        R16, _lcd_columns+0
	LDS        R17, _lcd_columns+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _lcd_columns+0, R16
	STS        _lcd_columns+1, R17
;MyProject.c,51 :: 		}
L_main4:
;MyProject.c,52 :: 		}
	JMP        L_main2
;MyProject.c,56 :: 		}
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
