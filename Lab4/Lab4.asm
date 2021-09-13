
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Lab4.c,20 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF
;Lab4.c,22 :: 		PORTA = 0;                        // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;Lab4.c,23 :: 		PORTC = portd_array[portd_index]; // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;Lab4.c,24 :: 		PORTA = shifter;                  // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;Lab4.c,27 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;Lab4.c,28 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR31
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR31:
;Lab4.c,29 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;Lab4.c,32 :: 		portd_index++;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;Lab4.c,33 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR32
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR32:
;Lab4.c,34 :: 		portd_index = 0; // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;Lab4.c,35 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_enter_value_to_portd_array:

;Lab4.c,37 :: 		void enter_value_to_portd_array(int value)
;Lab4.c,39 :: 		while (value > 0)
L_enter_value_to_portd_array2:
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	BRLT       L__enter_value_to_portd_array34
	JMP        L_enter_value_to_portd_array3
L__enter_value_to_portd_array34:
;Lab4.c,41 :: 		digit = num_mask[value % 10];
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	POP        R2
	POP        R3
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
;Lab4.c,42 :: 		value /= 10;
	PUSH       R3
	PUSH       R2
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R2
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	POP        R2
	POP        R3
	MOVW       R2, R16
;Lab4.c,43 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;Lab4.c,44 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;Lab4.c,45 :: 		}
	JMP        L_enter_value_to_portd_array2
L_enter_value_to_portd_array3:
;Lab4.c,46 :: 		}
L_end_enter_value_to_portd_array:
	RET
; end of _enter_value_to_portd_array

_task1:

;Lab4.c,48 :: 		void task1()
;Lab4.c,50 :: 		DDRD = 0xFF;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 255
	OUT        DDRD+0, R27
;Lab4.c,51 :: 		while (1)
L_task14:
;Lab4.c,53 :: 		while (j < 9)
L_task16:
	LDS        R18, _j+0
	LDS        R19, _j+1
	LDI        R16, 9
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task136
	JMP        L_task17
L__task136:
;Lab4.c,55 :: 		PORTD = sequence[j];
	LDS        R16, _j+0
	LDS        R17, _j+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_sequence+0)
	LDI        R17, hi_addr(_sequence+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTD+0, R16
;Lab4.c,56 :: 		enter_value_to_portd_array(PORTD);
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _enter_value_to_portd_array+0
;Lab4.c,57 :: 		Sound_Play(1397, 100);
	LDI        R27, 100
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 117
	MOV        R2, R27
	LDI        R27, 5
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,58 :: 		Delay_ms(1000); // Do we need to change that?
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task18:
	DEC        R16
	BRNE       L_task18
	DEC        R17
	BRNE       L_task18
	DEC        R18
	BRNE       L_task18
	NOP
	NOP
;Lab4.c,59 :: 		j++;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _j+0, R16
	STS        _j+1, R17
;Lab4.c,60 :: 		}
	JMP        L_task16
L_task17:
;Lab4.c,61 :: 		Sound_Play(440, 100);
	LDI        R27, 100
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 184
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,62 :: 		j--;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _j+0, R16
	STS        _j+1, R17
;Lab4.c,63 :: 		while (j > 0)
L_task110:
	LDS        R18, _j+0
	LDS        R19, _j+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task137
	JMP        L_task111
L__task137:
;Lab4.c,65 :: 		PORTD = sequence[j];
	LDS        R16, _j+0
	LDS        R17, _j+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_sequence+0)
	LDI        R17, hi_addr(_sequence+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTD+0, R16
;Lab4.c,66 :: 		enter_value_to_portd_array(PORTD);
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _enter_value_to_portd_array+0
;Lab4.c,67 :: 		Sound_Play(1318, 100);
	LDI        R27, 100
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, 38
	MOV        R2, R27
	LDI        R27, 5
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,68 :: 		Delay_ms(1000); // Do we need to change that?
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task112:
	DEC        R16
	BRNE       L_task112
	DEC        R17
	BRNE       L_task112
	DEC        R18
	BRNE       L_task112
	NOP
	NOP
;Lab4.c,69 :: 		j--;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _j+0, R16
	STS        _j+1, R17
;Lab4.c,70 :: 		}
	JMP        L_task110
L_task111:
;Lab4.c,71 :: 		}
	JMP        L_task14
;Lab4.c,72 :: 		}
L_end_task1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1

_d5:

;Lab4.c,74 :: 		void d5(int duration)
;Lab4.c,76 :: 		Sound_Play(1244, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 220
	MOV        R2, R27
	LDI        R27, 4
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,77 :: 		}
L_end_d5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _d5

_e5:

;Lab4.c,79 :: 		void e5(int duration)
;Lab4.c,81 :: 		Sound_Play(1318, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 38
	MOV        R2, R27
	LDI        R27, 5
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,82 :: 		}
L_end_e5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _e5

_f5:

;Lab4.c,83 :: 		void f5(int duration)
;Lab4.c,85 :: 		Sound_Play(1396, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 116
	MOV        R2, R27
	LDI        R27, 5
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,86 :: 		}
L_end_f5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _f5

_g5:

;Lab4.c,87 :: 		void g5(int duration)
;Lab4.c,89 :: 		Sound_Play(1568, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 32
	MOV        R2, R27
	LDI        R27, 6
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,90 :: 		}
L_end_g5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _g5

_a5:

;Lab4.c,91 :: 		void a5(int duration)
;Lab4.c,93 :: 		Sound_Play(1720, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 184
	MOV        R2, R27
	LDI        R27, 6
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,94 :: 		}
L_end_a5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _a5

_ad5:

;Lab4.c,95 :: 		void ad5(int duration)
;Lab4.c,97 :: 		Sound_Play(1865, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 73
	MOV        R2, R27
	LDI        R27, 7
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,98 :: 		}
L_end_ad5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _ad5

_h5:

;Lab4.c,100 :: 		void h5(int duration)
;Lab4.c,102 :: 		Sound_Play(1975, duration);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R4, R2
	LDI        R27, 183
	MOV        R2, R27
	LDI        R27, 7
	MOV        R3, R27
	CALL       _Sound_Play+0
;Lab4.c,103 :: 		}
L_end_h5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _h5

_play_popular_song:

;Lab4.c,105 :: 		void play_popular_song()
;Lab4.c,107 :: 		d5(QUARTER_NOTE_DUR);
	PUSH       R2
	PUSH       R3
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,108 :: 		g5(QUARTER_NOTE_DUR);
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,109 :: 		h5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _h5+0
;Lab4.c,110 :: 		a5(HALF_NOTE_DUR);
	LDI        R27, 53
	MOV        R2, R27
	LDI        R27, 3
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,111 :: 		Delay_ms(EIGTH_NOTE_DUR);
	LDI        R18, 11
	LDI        R17, 103
	LDI        R16, 78
L_play_popular_song14:
	DEC        R16
	BRNE       L_play_popular_song14
	DEC        R17
	BRNE       L_play_popular_song14
	DEC        R18
	BRNE       L_play_popular_song14
;Lab4.c,112 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,113 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,114 :: 		f5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,115 :: 		e5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _e5+0
;Lab4.c,116 :: 		d5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,117 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,118 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,119 :: 		f5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,120 :: 		e5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _e5+0
;Lab4.c,121 :: 		d5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,122 :: 		Delay_ms(SIXTEENTH_NOTE_DUR);
	LDI        R18, 6
	LDI        R17, 45
	LDI        R16, 168
L_play_popular_song16:
	DEC        R16
	BRNE       L_play_popular_song16
	DEC        R17
	BRNE       L_play_popular_song16
	DEC        R18
	BRNE       L_play_popular_song16
;Lab4.c,123 :: 		g5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,124 :: 		a5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,125 :: 		ad5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,126 :: 		Delay_ms(SIXTEENTH_NOTE_DUR);
	LDI        R18, 6
	LDI        R17, 45
	LDI        R16, 168
L_play_popular_song18:
	DEC        R16
	BRNE       L_play_popular_song18
	DEC        R17
	BRNE       L_play_popular_song18
	DEC        R18
	BRNE       L_play_popular_song18
;Lab4.c,127 :: 		g5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,128 :: 		a5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,129 :: 		ad5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,130 :: 		Delay_ms(SIXTEENTH_NOTE_DUR);
	LDI        R18, 6
	LDI        R17, 45
	LDI        R16, 168
L_play_popular_song20:
	DEC        R16
	BRNE       L_play_popular_song20
	DEC        R17
	BRNE       L_play_popular_song20
	DEC        R18
	BRNE       L_play_popular_song20
;Lab4.c,131 :: 		g5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,132 :: 		a5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,133 :: 		ad5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,134 :: 		Delay_ms(HALF_NOTE_DUR);
	LDI        R18, 42
	LDI        R17, 167
	LDI        R16, 57
L_play_popular_song22:
	DEC        R16
	BRNE       L_play_popular_song22
	DEC        R17
	BRNE       L_play_popular_song22
	DEC        R18
	BRNE       L_play_popular_song22
	NOP
;Lab4.c,135 :: 		d5(QUARTER_NOTE_DUR);
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,136 :: 		g5(QUARTER_NOTE_DUR);
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,137 :: 		ad5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,138 :: 		a5(HALF_NOTE_DUR);
	LDI        R27, 53
	MOV        R2, R27
	LDI        R27, 3
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,139 :: 		Delay_ms(EIGTH_NOTE_DUR);
	LDI        R18, 11
	LDI        R17, 103
	LDI        R16, 78
L_play_popular_song24:
	DEC        R16
	BRNE       L_play_popular_song24
	DEC        R17
	BRNE       L_play_popular_song24
	DEC        R18
	BRNE       L_play_popular_song24
;Lab4.c,140 :: 		d5(QUARTER_NOTE_DUR);
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,141 :: 		g5(QUARTER_NOTE_DUR);
	LDI        R27, 154
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,142 :: 		ad5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,143 :: 		a5(HALF_NOTE_DUR);
	LDI        R27, 53
	MOV        R2, R27
	LDI        R27, 3
	MOV        R3, R27
	CALL       _a5+0
;Lab4.c,144 :: 		Delay_ms(EIGTH_NOTE_DUR);
	LDI        R18, 11
	LDI        R17, 103
	LDI        R16, 78
L_play_popular_song26:
	DEC        R16
	BRNE       L_play_popular_song26
	DEC        R17
	BRNE       L_play_popular_song26
	DEC        R18
	BRNE       L_play_popular_song26
;Lab4.c,145 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,146 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,147 :: 		f5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,148 :: 		e5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _e5+0
;Lab4.c,149 :: 		d5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,150 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,151 :: 		f5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,152 :: 		f5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _f5+0
;Lab4.c,153 :: 		e5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _e5+0
;Lab4.c,154 :: 		d5(SIXTEENTH_NOTE_DUR);
	LDI        R27, 102
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _d5+0
;Lab4.c,155 :: 		Delay_ms(SIXTEENTH_NOTE_DUR);
	LDI        R18, 6
	LDI        R17, 45
	LDI        R16, 168
L_play_popular_song28:
	DEC        R16
	BRNE       L_play_popular_song28
	DEC        R17
	BRNE       L_play_popular_song28
	DEC        R18
	BRNE       L_play_popular_song28
;Lab4.c,156 :: 		ad5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _ad5+0
;Lab4.c,157 :: 		g5(EIGTH_NOTE_DUR);
	LDI        R27, 205
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _g5+0
;Lab4.c,158 :: 		}
L_end_play_popular_song:
	POP        R3
	POP        R2
	RET
; end of _play_popular_song

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Lab4.c,160 :: 		void main()
;Lab4.c,164 :: 		DDRA = 0x0f;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	LDI        R27, 15
	OUT        DDRA+0, R27
;Lab4.c,165 :: 		PORTA = 0;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Lab4.c,166 :: 		DDRC = 0xff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;Lab4.c,167 :: 		PORTC = 0;
	LDI        R27, 0
	OUT        PORTC+0, R27
;Lab4.c,169 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;Lab4.c,170 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;Lab4.c,171 :: 		shifter = 1; // Initial number value
	LDI        R27, 1
	STS        _shifter+0, R27
;Lab4.c,173 :: 		TCCR0 = 0x03; // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;Lab4.c,175 :: 		SREG_I_bit = 1; // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;Lab4.c,176 :: 		TOIE0_bit = 1;  // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;Lab4.c,178 :: 		Sound_Init(&PORTB, 1); // Initialize sound pin
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTB+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTB+0)
	MOV        R3, R27
	CALL       _Sound_Init+0
;Lab4.c,181 :: 		task1();
	CALL       _task1+0
;Lab4.c,183 :: 		play_popular_song();
	CALL       _play_popular_song+0
;Lab4.c,184 :: 		}
L_end_main:
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
