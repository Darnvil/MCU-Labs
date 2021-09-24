
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;LR1.c,14 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
;LR1.c,15 :: 		PORTA = 0;                             // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,16 :: 		PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;LR1.c,17 :: 		PORTA = shifter;                       // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;LR1.c,20 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;LR1.c,21 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR72
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR72:
;LR1.c,22 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;LR1.c,25 :: 		portd_index++ ;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;LR1.c,26 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR73
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR73:
;LR1.c,27 :: 		portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;LR1.c,28 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_clear_portd:

;LR1.c,30 :: 		void clear_portd()
;LR1.c,32 :: 		for (i = 0; i < 4; ++i)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_clear_portd2:
	LDS        R16, _i+0
	LDS        R17, _i+1
	CPI        R17, 0
	BRNE       L__clear_portd75
	CPI        R16, 4
L__clear_portd75:
	BRLO       L__clear_portd76
	JMP        L_clear_portd3
L__clear_portd76:
;LR1.c,33 :: 		portd_array[i] = 0;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 0
	ST         Z, R27
;LR1.c,32 :: 		for (i = 0; i < 4; ++i)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,33 :: 		portd_array[i] = 0;
	JMP        L_clear_portd2
L_clear_portd3:
;LR1.c,34 :: 		}
L_end_clear_portd:
	RET
; end of _clear_portd

_num_changer:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;LR1.c,36 :: 		void num_changer(char * value)
;LR1.c,38 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,40 :: 		for (i = strlen(value); i >= 0; --i)
	CALL       _strlen+0
	STS        _i+0, R16
	STS        _i+1, R17
L_num_changer5:
	LDS        R16, _i+0
	LDS        R17, _i+1
	CPI        R17, 0
	BRNE       L__num_changer78
	CPI        R16, 0
L__num_changer78:
	BRSH       L__num_changer79
	JMP        L_num_changer6
L__num_changer79:
;LR1.c,42 :: 		switch(value[i])
	LDS        R16, _i+0
	LDS        R17, _i+1
	ADD        R16, R2
	ADC        R17, R3
	STD        Y+0, R16
	STD        Y+1, R17
	JMP        L_num_changer8
;LR1.c,44 :: 		case 'a':
L_num_changer10:
;LR1.c,45 :: 		case 'A':
L_num_changer11:
;LR1.c,46 :: 		digit = num_mask[10];
	LDS        R16, _num_mask+20
	LDS        R17, _num_mask+21
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,47 :: 		break;
	JMP        L_num_changer9
;LR1.c,49 :: 		case 'b':
L_num_changer12:
;LR1.c,50 :: 		case 'B':
L_num_changer13:
;LR1.c,51 :: 		digit = num_mask[11];
	LDS        R16, _num_mask+22
	LDS        R17, _num_mask+23
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,52 :: 		break;
	JMP        L_num_changer9
;LR1.c,54 :: 		case 'c':
L_num_changer14:
;LR1.c,55 :: 		case 'C':
L_num_changer15:
;LR1.c,56 :: 		digit = num_mask[12];
	LDS        R16, _num_mask+24
	LDS        R17, _num_mask+25
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,57 :: 		break;
	JMP        L_num_changer9
;LR1.c,59 :: 		case 'd':
L_num_changer16:
;LR1.c,60 :: 		case 'D':
L_num_changer17:
;LR1.c,61 :: 		digit = num_mask[13];
	LDS        R16, _num_mask+26
	LDS        R17, _num_mask+27
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,62 :: 		break;
	JMP        L_num_changer9
;LR1.c,64 :: 		case 'e':
L_num_changer18:
;LR1.c,65 :: 		case 'E':
L_num_changer19:
;LR1.c,66 :: 		digit = num_mask[14];
	LDS        R16, _num_mask+28
	LDS        R17, _num_mask+29
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,67 :: 		break;
	JMP        L_num_changer9
;LR1.c,69 :: 		case 'f':
L_num_changer20:
;LR1.c,70 :: 		case 'F':
L_num_changer21:
;LR1.c,71 :: 		digit = num_mask[15];
	LDS        R16, _num_mask+30
	LDS        R17, _num_mask+31
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,72 :: 		break;
	JMP        L_num_changer9
;LR1.c,73 :: 		default:
L_num_changer22:
;LR1.c,74 :: 		digit = num_mask[atoi(value[i])];
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _atoi+0
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
;LR1.c,75 :: 		}
	JMP        L_num_changer9
L_num_changer8:
	LDD        R17, Y+0
	LDD        R18, Y+1
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 97
	BRNE       L__num_changer80
	JMP        L_num_changer10
L__num_changer80:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 65
	BRNE       L__num_changer81
	JMP        L_num_changer11
L__num_changer81:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 98
	BRNE       L__num_changer82
	JMP        L_num_changer12
L__num_changer82:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 66
	BRNE       L__num_changer83
	JMP        L_num_changer13
L__num_changer83:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 99
	BRNE       L__num_changer84
	JMP        L_num_changer14
L__num_changer84:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 67
	BRNE       L__num_changer85
	JMP        L_num_changer15
L__num_changer85:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 100
	BRNE       L__num_changer86
	JMP        L_num_changer16
L__num_changer86:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 68
	BRNE       L__num_changer87
	JMP        L_num_changer17
L__num_changer87:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 101
	BRNE       L__num_changer88
	JMP        L_num_changer18
L__num_changer88:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 69
	BRNE       L__num_changer89
	JMP        L_num_changer19
L__num_changer89:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 102
	BRNE       L__num_changer90
	JMP        L_num_changer20
L__num_changer90:
	MOV        R30, R17
	MOV        R31, R18
	LD         R16, Z
	CPI        R16, 70
	BRNE       L__num_changer91
	JMP        L_num_changer21
L__num_changer91:
	JMP        L_num_changer22
L_num_changer9:
;LR1.c,76 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR1.c,40 :: 		for (i = strlen(value); i >= 0; --i)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,77 :: 		}
	JMP        L_num_changer5
L_num_changer6:
;LR1.c,78 :: 		}
L_end_num_changer:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _num_changer

_num_changer_with_dot:

;LR1.c,80 :: 		void num_changer_with_dot(char * value, int dot_position)
;LR1.c,82 :: 		num_changer(value);
	CALL       _num_changer+0
;LR1.c,84 :: 		portd_array[dot_position] |= 0x80;
	LDI        R16, #lo_addr(_portd_array+0)
	LDI        R17, hi_addr(_portd_array+0)
	MOVW       R18, R4
	ADD        R18, R16
	ADC        R19, R17
	MOVW       R30, R18
	LD         R16, Z
	ORI        R16, 128
	MOVW       R30, R18
	ST         Z, R16
;LR1.c,85 :: 		}
L_end_num_changer_with_dot:
	RET
; end of _num_changer_with_dot

_task1:

;LR1.c,87 :: 		void task1()
;LR1.c,89 :: 		clear_portd();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _clear_portd+0
;LR1.c,90 :: 		while(1)
L_task123:
;LR1.c,92 :: 		if (PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task125
;LR1.c,93 :: 		num_changer("0059");
	LDI        R27, #lo_addr(?lstr1_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task125:
;LR1.c,94 :: 		while(PINB7_bit);
L_task126:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task127
	JMP        L_task126
L_task127:
;LR1.c,96 :: 		if (PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task128
;LR1.c,97 :: 		num_changer("4619");
	LDI        R27, #lo_addr(?lstr2_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task128:
;LR1.c,98 :: 		while(PINB6_bit);
L_task129:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task130
	JMP        L_task129
L_task130:
;LR1.c,100 :: 		if (PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task131
;LR1.c,101 :: 		num_changer_with_dot("0403", 2);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, #lo_addr(?lstr3_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_LR1+0)
	MOV        R3, R27
	CALL       _num_changer_with_dot+0
L_task131:
;LR1.c,102 :: 		while(PINB5_bit);
L_task132:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task133
	JMP        L_task132
L_task133:
;LR1.c,104 :: 		if (PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task134
;LR1.c,105 :: 		num_changer("17");
	LDI        R27, #lo_addr(?lstr4_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task134:
;LR1.c,106 :: 		while(PINB4_bit);
L_task135:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task136
	JMP        L_task135
L_task136:
;LR1.c,108 :: 		if (PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task137
;LR1.c,109 :: 		num_changer("15");
	LDI        R27, #lo_addr(?lstr5_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task137:
;LR1.c,110 :: 		while(PINB3_bit);
L_task138:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task139
	JMP        L_task138
L_task139:
;LR1.c,112 :: 		if (PINB2_bit)
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task140
;LR1.c,113 :: 		num_changer("110b");
	LDI        R27, #lo_addr(?lstr6_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task140:
;LR1.c,114 :: 		while(PINB2_bit);
L_task141:
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task142
	JMP        L_task141
L_task142:
;LR1.c,116 :: 		if (PINB1_bit)
	IN         R27, PINB1_bit+0
	SBRS       R27, BitPos(PINB1_bit+0)
	JMP        L_task143
;LR1.c,118 :: 		for(k = 0; k <= 16; ++k)
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
L_task144:
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 16
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRSH       L__task194
	JMP        L_task145
L__task194:
;LR1.c,120 :: 		digit = num_mask[k];
	LDS        R16, _k+0
	LDS        R17, _k+1
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
;LR1.c,121 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,122 :: 		delay_ms(750);
	LDI        R18, 39
	LDI        R17, 13
	LDI        R16, 39
L_task147:
	DEC        R16
	BRNE       L_task147
	DEC        R17
	BRNE       L_task147
	DEC        R18
	BRNE       L_task147
	NOP
;LR1.c,118 :: 		for(k = 0; k <= 16; ++k)
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;LR1.c,123 :: 		}
	JMP        L_task144
L_task145:
;LR1.c,124 :: 		}
L_task143:
;LR1.c,125 :: 		while(PINB1_bit);
L_task149:
	IN         R27, PINB1_bit+0
	SBRS       R27, BitPos(PINB1_bit+0)
	JMP        L_task150
	JMP        L_task149
L_task150:
;LR1.c,127 :: 		if (PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task151
;LR1.c,128 :: 		return;
	JMP        L_end_task1
L_task151:
;LR1.c,129 :: 		while(PINB0_bit);
L_task152:
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task153
	JMP        L_task152
L_task153:
;LR1.c,131 :: 		}
	JMP        L_task123
;LR1.c,132 :: 		}
L_end_task1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1

_task2:

;LR1.c,134 :: 		void task2()
;LR1.c,136 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,138 :: 		a = 10 + rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 246
	SBCI       R17, 255
	STS        _a+0, R16
	STS        _a+1, R17
;LR1.c,139 :: 		digit = num_mask[a];
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
;LR1.c,140 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,141 :: 		delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task254:
	DEC        R16
	BRNE       L_task254
	DEC        R17
	BRNE       L_task254
	DEC        R18
	BRNE       L_task254
	NOP
	NOP
;LR1.c,144 :: 		b = 10 + rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	SUBI       R16, 246
	SBCI       R17, 255
	STS        _b+0, R16
	STS        _b+1, R17
;LR1.c,145 :: 		res = (2 * a * a - 4 * b) / 5;
	LDS        R16, _a+0
	LDS        R17, _a+1
	LSL        R16
	ROL        R17
	LDS        R20, _a+0
	LDS        R21, _a+1
	CALL       _HWMul_16x16+0
	LDS        R18, _b+0
	LDS        R19, _b+1
	LSL        R18
	ROL        R19
	LSL        R18
	ROL        R19
	SUB        R16, R18
	SBC        R17, R19
	LDI        R20, 5
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _res+0, R16
	STS        _res+1, R17
;LR1.c,146 :: 		digit = num_mask[b];
	LDS        R16, _b+0
	LDS        R17, _b+1
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
;LR1.c,147 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,148 :: 		delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task256:
	DEC        R16
	BRNE       L_task256
	DEC        R17
	BRNE       L_task256
	DEC        R18
	BRNE       L_task256
	NOP
	NOP
;LR1.c,150 :: 		i = 0;
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;LR1.c,152 :: 		while (res > 0)
L_task258:
	LDS        R18, _res+0
	LDS        R19, _res+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task296
	JMP        L_task259
L__task296:
;LR1.c,154 :: 		digit = num_mask[res % 10];
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _res+0
	LDS        R17, _res+1
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
;LR1.c,155 :: 		res /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _res+0
	LDS        R17, _res+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _res+0, R16
	STS        _res+1, R17
;LR1.c,156 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR1.c,157 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,158 :: 		}
	JMP        L_task258
L_task259:
;LR1.c,159 :: 		}
L_end_task2:
	RET
; end of _task2

_task3:

;LR1.c,161 :: 		void task3()
;LR1.c,163 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,165 :: 		portd_array[3] = num_mask[15];
	LDS        R16, _num_mask+30
	STS        _portd_array+3, R16
;LR1.c,166 :: 		portd_array[0] = num_mask[4];
	LDS        R16, _num_mask+8
	STS        _portd_array+0, R16
;LR1.c,167 :: 		}
L_end_task3:
	RET
; end of _task3

_task_picker:

;LR1.c,169 :: 		void task_picker()
;LR1.c,171 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,173 :: 		while(1)
L_task_picker60:
;LR1.c,175 :: 		if (PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker62
;LR1.c,176 :: 		task1();
	CALL       _task1+0
L_task_picker62:
;LR1.c,177 :: 		while(PINB7_bit);
L_task_picker63:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker64
	JMP        L_task_picker63
L_task_picker64:
;LR1.c,179 :: 		if (PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker65
;LR1.c,180 :: 		task2();
	CALL       _task2+0
L_task_picker65:
;LR1.c,181 :: 		while(PINB6_bit);
L_task_picker66:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker67
	JMP        L_task_picker66
L_task_picker67:
;LR1.c,183 :: 		if (PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker68
;LR1.c,184 :: 		task3();
	CALL       _task3+0
L_task_picker68:
;LR1.c,185 :: 		while(PINB5_bit);
L_task_picker69:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker70
	JMP        L_task_picker69
L_task_picker70:
;LR1.c,186 :: 		}
	JMP        L_task_picker60
;LR1.c,187 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR1.c,189 :: 		void main() {
;LR1.c,190 :: 		DDRA = 0x0f;
	LDI        R27, 15
	OUT        DDRA+0, R27
;LR1.c,191 :: 		PORTA = 0;
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,192 :: 		DDRC = 0xff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR1.c,193 :: 		PORTC = 0;
	LDI        R27, 0
	OUT        PORTC+0, R27
;LR1.c,194 :: 		DDRB = 0x00;   // input
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR1.c,196 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;LR1.c,197 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;LR1.c,198 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
;LR1.c,200 :: 		TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;LR1.c,202 :: 		SREG_I_bit = 1;               // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;LR1.c,203 :: 		TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;LR1.c,205 :: 		task_picker();
	CALL       _task_picker+0
;LR1.c,206 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
