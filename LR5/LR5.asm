
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;LR5.c,34 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
;LR5.c,35 :: 		PORTA = 0;                             // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR5.c,36 :: 		PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;LR5.c,37 :: 		PORTA = shifter;                       // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;LR5.c,40 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;LR5.c,41 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR22
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR22:
;LR5.c,42 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;LR5.c,45 :: 		portd_index++ ;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;LR5.c,46 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR23
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR23:
;LR5.c,47 :: 		portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;LR5.c,48 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_clear_portd:

;LR5.c,50 :: 		void clear_portd()
;LR5.c,52 :: 		for (i = 0; i < 4; ++i)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_clear_portd2:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 4
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__clear_portd25
	JMP        L_clear_portd3
L__clear_portd25:
;LR5.c,53 :: 		portd_array[i] = 0;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 0
	ST         Z, R27
;LR5.c,52 :: 		for (i = 0; i < 4; ++i)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR5.c,53 :: 		portd_array[i] = 0;
	JMP        L_clear_portd2
L_clear_portd3:
;LR5.c,54 :: 		}
L_end_clear_portd:
	RET
; end of _clear_portd

_task1:

;LR5.c,56 :: 		void task1()
;LR5.c,58 :: 		TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;LR5.c,60 :: 		SREG_I_bit = 1;               // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;LR5.c,61 :: 		TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;LR5.c,66 :: 		while (acd > 0)
L_task17:
;LR5.c,68 :: 		digit = num_mask[acd % 10];
	LDS        R16, _num_mask+14
	LDS        R17, _num_mask+15
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR5.c,69 :: 		adc_rd /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _adc_rd+0
	LDS        R17, _adc_rd+1
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
	STS        _adc_rd+0, R16
	STS        _adc_rd+1, R17
;LR5.c,70 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR5.c,71 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR5.c,72 :: 		}
	JMP        L_task17
;LR5.c,74 :: 		}
L_end_task1:
	RET
; end of _task1

_task2:

;LR5.c,76 :: 		void task2()
;LR5.c,79 :: 		}
L_end_task2:
	RET
; end of _task2

_task_picker:

;LR5.c,81 :: 		void task_picker()
;LR5.c,83 :: 		while(1)
L_task_picker9:
;LR5.c,86 :: 		if(PORTB7_bit)
	IN         R27, PORTB7_bit+0
	SBRS       R27, BitPos(PORTB7_bit+0)
	JMP        L_task_picker11
;LR5.c,88 :: 		task1();
	CALL       _task1+0
;LR5.c,89 :: 		}
L_task_picker11:
;LR5.c,90 :: 		while (PORTB7_bit);
L_task_picker12:
	IN         R27, PORTB7_bit+0
	SBRS       R27, BitPos(PORTB7_bit+0)
	JMP        L_task_picker13
	JMP        L_task_picker12
L_task_picker13:
;LR5.c,92 :: 		if (PORTB6_bit)
	IN         R27, PORTB6_bit+0
	SBRS       R27, BitPos(PORTB6_bit+0)
	JMP        L_task_picker14
;LR5.c,94 :: 		task2();
	CALL       _task2+0
;LR5.c,95 :: 		}
L_task_picker14:
;LR5.c,96 :: 		while(PORTB6_bit);
L_task_picker15:
	IN         R27, PORTB6_bit+0
	SBRS       R27, BitPos(PORTB6_bit+0)
	JMP        L_task_picker16
	JMP        L_task_picker15
L_task_picker16:
;LR5.c,97 :: 		}
	JMP        L_task_picker9
;LR5.c,98 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR5.c,100 :: 		void main() {
;LR5.c,101 :: 		DDRB = 0x00;               // set PORTC as output
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR5.c,102 :: 		DDRC = 0xFF;               // set PORTC as output
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR5.c,103 :: 		DDRA = 0x0F;
	LDI        R27, 15
	OUT        DDRA+0, R27
;LR5.c,105 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LR5.c,107 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;LR5.c,108 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;LR5.c,109 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
;LR5.c,111 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LR5.c,112 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,113 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,115 :: 		while (1)
L_main17:
;LR5.c,117 :: 		Lcd_Out(1,6,message);
	LDI        R27, #lo_addr(_message+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_message+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR5.c,118 :: 		adc_rd = ADC_Read(5);
	LDI        R27, 5
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _adc_rd+0, R16
	STS        _adc_rd+1, R17
;LR5.c,119 :: 		PORTB = adc_rd;
	OUT        PORTB+0, R16
;LR5.c,120 :: 		converted = adc_rd / 1.564;
	LDI        R18, 0
	MOV        R19, R18
	CALL       _float_ulong2fp+0
	LDI        R20, 39
	LDI        R21, 49
	LDI        R22, 200
	LDI        R23, 63
	CALL       _float_fpdiv1+0
	CALL       _float_fpint+0
	STS        _converted+0, R16
	STS        _converted+1, R17
;LR5.c,121 :: 		IntToStr(converted, c);
	LDI        R27, #lo_addr(_c+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_c+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _IntToStr+0
;LR5.c,123 :: 		Lcd_Out(2,6,c);
	LDI        R27, #lo_addr(_c+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_c+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR5.c,124 :: 		Delay_ms (100);
	LDI        R18, 6
	LDI        R17, 19
	LDI        R16, 174
L_main19:
	DEC        R16
	BRNE       L_main19
	DEC        R17
	BRNE       L_main19
	DEC        R18
	BRNE       L_main19
	NOP
	NOP
;LR5.c,125 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR5.c,126 :: 		PORTC = Hi(adc_rd);
	LDS        R16, _adc_rd+1
	OUT        PORTC+0, R16
;LR5.c,127 :: 		}
	JMP        L_main17
;LR5.c,129 :: 		}
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
