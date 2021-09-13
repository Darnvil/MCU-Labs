
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;LR1.c,11 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
;LR1.c,12 :: 		PORTA = 0;                             // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,13 :: 		PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;LR1.c,14 :: 		PORTA = shifter;                       // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;LR1.c,17 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;LR1.c,18 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR5
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR5:
;LR1.c,19 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;LR1.c,22 :: 		portd_index++ ;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;LR1.c,23 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR6
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR6:
;LR1.c,24 :: 		portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;LR1.c,25 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR1.c,28 :: 		void main() {
;LR1.c,29 :: 		DDRA = 0x0f;
	LDI        R27, 15
	OUT        DDRA+0, R27
;LR1.c,30 :: 		PORTA = 0;
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,31 :: 		DDRC = 0xff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR1.c,32 :: 		PORTC = 0;
	LDI        R27, 0
	OUT        PORTC+0, R27
;LR1.c,35 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;LR1.c,36 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;LR1.c,37 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
;LR1.c,40 :: 		TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;LR1.c,42 :: 		SREG_I_bit = 1;               // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;LR1.c,43 :: 		TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;LR1.c,45 :: 		while(num > 0)
L_main2:
	LDS        R18, _num+0
	LDS        R19, _num+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__main8
	JMP        L_main3
L__main8:
;LR1.c,47 :: 		digit = num_mask[num % 10];
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _num+0
	LDS        R17, _num+1
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
;LR1.c,48 :: 		num /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _num+0
	LDS        R17, _num+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _num+0, R16
	STS        _num+1, R17
;LR1.c,49 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR1.c,50 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,51 :: 		}
	JMP        L_main2
L_main3:
;LR1.c,52 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
