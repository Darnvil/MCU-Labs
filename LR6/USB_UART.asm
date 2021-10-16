
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;USB_UART.c,20 :: 		void main() {
;USB_UART.c,21 :: 		DDRB = 0x00;
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	OUT        DDRB+0, R27
;USB_UART.c,22 :: 		PORTB =0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;USB_UART.c,24 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;USB_UART.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,26 :: 		Lcd_Cmd(_LCD_FIRST_ROW);           // Move cursor to the 1st row
	LDI        R27, 128
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,30 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	LDI        R27, 51
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;USB_UART.c,31 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_main0:
	DEC        R16
	BRNE       L_main0
	DEC        R17
	BRNE       L_main0
	DEC        R18
	BRNE       L_main0
;USB_UART.c,33 :: 		UART1_Write_Text("Init");
	LDI        R27, #lo_addr(?lstr1_USB_UART+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_USB_UART+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;USB_UART.c,34 :: 		UART1_Write(13);
	LDI        R27, 13
	MOV        R2, R27
	CALL       _UART1_Write+0
;USB_UART.c,35 :: 		UART1_Write(10);
	LDI        R27, 10
	MOV        R2, R27
	CALL       _UART1_Write+0
;USB_UART.c,37 :: 		ch[1] = '\0';
	LDI        R27, 0
	STS        _ch+1, R27
;USB_UART.c,39 :: 		while (1) {                     // Endless loop
L_main2:
;USB_UART.c,40 :: 		if (UART1_Data_Ready()) {      // If data is received,
	CALL       _UART1_Data_Ready+0
	TST        R16
	BRNE       L__main12
	JMP        L_main4
L__main12:
;USB_UART.c,41 :: 		uart_rd = UART1_Read();
	CALL       _UART1_Read+0
	STS        _uart_rd+0, R16
;USB_UART.c,43 :: 		ch[0] = uart_rd;
	STS        _ch+0, R16
;USB_UART.c,45 :: 		Lcd_Out_Cp(ch);
	LDI        R27, #lo_addr(_ch+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;USB_UART.c,46 :: 		UART1_Write(uart_rd);        // and send data via UART
	LDS        R2, _uart_rd+0
	CALL       _UART1_Write+0
;USB_UART.c,47 :: 		}
L_main4:
;USB_UART.c,48 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_main5
;USB_UART.c,50 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	LDI        R27, 16
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,51 :: 		Lcd_Chr_Cp(' ');
	LDI        R27, 32
	MOV        R2, R27
	CALL       _Lcd_Chr_CP+0
;USB_UART.c,52 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	LDI        R27, 16
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,53 :: 		}
L_main5:
;USB_UART.c,54 :: 		while(PINB7_bit);
L_main6:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_main7
	JMP        L_main6
L_main7:
;USB_UART.c,56 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_main8
;USB_UART.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;USB_UART.c,59 :: 		}
L_main8:
;USB_UART.c,60 :: 		while(PINB6_bit);
L_main9:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_main10
	JMP        L_main9
L_main10:
;USB_UART.c,61 :: 		}
	JMP        L_main2
;USB_UART.c,62 :: 		}
L_end_main:
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
