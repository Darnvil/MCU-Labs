
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;LR5_2.c,19 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
;LR5_2.c,20 :: 		PORTA = 0;                             // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR5_2.c,21 :: 		PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;LR5_2.c,22 :: 		PORTA = shifter;                       // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;LR5_2.c,25 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;LR5_2.c,26 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR10
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR10:
;LR5_2.c,27 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;LR5_2.c,30 :: 		portd_index++ ;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;LR5_2.c,31 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR11
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR11:
;LR5_2.c,32 :: 		portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;LR5_2.c,33 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_clear_portd:

;LR5_2.c,35 :: 		void clear_portd(int l)
;LR5_2.c,37 :: 		for (; l < 4; ++l)
L_clear_portd2:
	LDI        R16, 4
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__clear_portd13
	JMP        L_clear_portd3
L__clear_portd13:
;LR5_2.c,38 :: 		portd_array[l] = 0;
	LDI        R16, #lo_addr(_portd_array+0)
	LDI        R17, hi_addr(_portd_array+0)
	MOVW       R30, R2
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 0
	ST         Z, R27
;LR5_2.c,37 :: 		for (; l < 4; ++l)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;LR5_2.c,38 :: 		portd_array[l] = 0;
	JMP        L_clear_portd2
L_clear_portd3:
;LR5_2.c,39 :: 		}
L_end_clear_portd:
	RET
; end of _clear_portd

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR5_2.c,41 :: 		void main()
;LR5_2.c,43 :: 		DDRB = 0xFF;
	PUSH       R2
	PUSH       R3
	LDI        R27, 255
	OUT        DDRB+0, R27
;LR5_2.c,44 :: 		DDRC = 0xFF;               // set PORTC as output
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR5_2.c,45 :: 		DDRA = 0x0F;
	LDI        R27, 15
	OUT        DDRA+0, R27
;LR5_2.c,49 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;LR5_2.c,50 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;LR5_2.c,51 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
;LR5_2.c,52 :: 		TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;LR5_2.c,54 :: 		SREG_I_bit = 1;               // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;LR5_2.c,55 :: 		TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;LR5_2.c,57 :: 		while(1)
L_main5:
;LR5_2.c,60 :: 		adc_rd = ADC_Read(5);
	LDI        R27, 5
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _adc_rd+0, R16
	STS        _adc_rd+1, R17
;LR5_2.c,61 :: 		PORTB = adc_rd;
	OUT        PORTB+0, R16
;LR5_2.c,62 :: 		converted = adc_rd / 1.564;
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
;LR5_2.c,63 :: 		while (converted > 0)
L_main7:
	LDS        R18, _converted+0
	LDS        R19, _converted+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__main15
	JMP        L_main8
L__main15:
;LR5_2.c,65 :: 		digit = num_mask[converted % 10];
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _converted+0
	LDS        R17, _converted+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_num_mask+0)
	LDI        R17, hi_addr(_num_mask+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z+
	LD         R17, Z+
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR5_2.c,66 :: 		converted /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _converted+0
	LDS        R17, _converted+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _converted+0, R16
	STS        _converted+1, R17
;LR5_2.c,67 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR5_2.c,68 :: 		clear_portd(i + 1);
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _clear_portd+0
;LR5_2.c,69 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR5_2.c,70 :: 		}
	JMP        L_main7
L_main8:
;LR5_2.c,72 :: 		i = 0;
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;LR5_2.c,73 :: 		}
	JMP        L_main5
;LR5_2.c,74 :: 		}
L_end_main:
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
