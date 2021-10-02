
_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;LR1.c,15 :: 		void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
;LR1.c,16 :: 		PORTA = 0;                             // Turn off all 7seg displays
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,17 :: 		PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
	LDI        R17, #lo_addr(_portd_array+0)
	LDI        R18, hi_addr(_portd_array+0)
	LDS        R16, _portd_index+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	OUT        PORTC+0, R16
;LR1.c,18 :: 		PORTA = shifter;                       // turn on appropriate 7seg. display
	LDS        R16, _shifter+0
	OUT        PORTA+0, R16
;LR1.c,21 :: 		shifter <<= 1;
	MOV        R17, R16
	LSL        R17
	STS        _shifter+0, R17
;LR1.c,22 :: 		if (shifter > 8u)
	LDI        R16, 8
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR85
	JMP        L_Timer0Overflow_ISR0
L__Timer0Overflow_ISR85:
;LR1.c,23 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
L_Timer0Overflow_ISR0:
;LR1.c,26 :: 		portd_index++ ;
	LDS        R16, _portd_index+0
	MOV        R17, R16
	SUBI       R17, 255
	STS        _portd_index+0, R17
;LR1.c,27 :: 		if (portd_index > 3u)
	LDI        R16, 3
	CP         R16, R17
	BRLO       L__Timer0Overflow_ISR86
	JMP        L_Timer0Overflow_ISR1
L__Timer0Overflow_ISR86:
;LR1.c,28 :: 		portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
	LDI        R27, 0
	STS        _portd_index+0, R27
L_Timer0Overflow_ISR1:
;LR1.c,29 :: 		}
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_clear_portd:

;LR1.c,31 :: 		void clear_portd()
;LR1.c,33 :: 		for (i = 0; i < 4; ++i)
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
	BRLT       L__clear_portd88
	JMP        L_clear_portd3
L__clear_portd88:
;LR1.c,34 :: 		portd_array[i] = 0;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDI        R27, 0
	ST         Z, R27
;LR1.c,33 :: 		for (i = 0; i < 4; ++i)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,34 :: 		portd_array[i] = 0;
	JMP        L_clear_portd2
L_clear_portd3:
;LR1.c,35 :: 		}
L_end_clear_portd:
	RET
; end of _clear_portd

_num_changer:

;LR1.c,37 :: 		void num_changer(char * value)
;LR1.c,39 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,41 :: 		for (i = strlen(value) - 1; i >= 0; --i)
	CALL       _strlen+0
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _i+0, R16
	STS        _i+1, R17
L_num_changer5:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__num_changer90
	JMP        L_num_changer6
L__num_changer90:
;LR1.c,43 :: 		ch = value[i];
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	STS        _ch+0, R16
;LR1.c,44 :: 		switch(ch)
	JMP        L_num_changer8
;LR1.c,46 :: 		case '0':
L_num_changer10:
;LR1.c,48 :: 		digit = num_mask[0];
	LDS        R16, _num_mask+0
	LDS        R17, _num_mask+1
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,49 :: 		break;
	JMP        L_num_changer9
;LR1.c,51 :: 		case '1':
L_num_changer11:
;LR1.c,53 :: 		digit = num_mask[1];
	LDS        R16, _num_mask+2
	LDS        R17, _num_mask+3
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,54 :: 		break;
	JMP        L_num_changer9
;LR1.c,56 :: 		case '2':
L_num_changer12:
;LR1.c,58 :: 		digit = num_mask[2];
	LDS        R16, _num_mask+4
	LDS        R17, _num_mask+5
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,59 :: 		break;
	JMP        L_num_changer9
;LR1.c,61 :: 		case '3':
L_num_changer13:
;LR1.c,63 :: 		digit = num_mask[3];
	LDS        R16, _num_mask+6
	LDS        R17, _num_mask+7
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,64 :: 		break;
	JMP        L_num_changer9
;LR1.c,66 :: 		case '4':
L_num_changer14:
;LR1.c,68 :: 		digit = num_mask[4];
	LDS        R16, _num_mask+8
	LDS        R17, _num_mask+9
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,69 :: 		break;
	JMP        L_num_changer9
;LR1.c,71 :: 		case '5':
L_num_changer15:
;LR1.c,73 :: 		digit = num_mask[5];
	LDS        R16, _num_mask+10
	LDS        R17, _num_mask+11
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,74 :: 		break;
	JMP        L_num_changer9
;LR1.c,76 :: 		case '6':
L_num_changer16:
;LR1.c,78 :: 		digit = num_mask[6];
	LDS        R16, _num_mask+12
	LDS        R17, _num_mask+13
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,79 :: 		break;
	JMP        L_num_changer9
;LR1.c,81 :: 		case '7':
L_num_changer17:
;LR1.c,83 :: 		digit = num_mask[7];
	LDS        R16, _num_mask+14
	LDS        R17, _num_mask+15
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,84 :: 		break;
	JMP        L_num_changer9
;LR1.c,86 :: 		case '8':
L_num_changer18:
;LR1.c,88 :: 		digit = num_mask[8];
	LDS        R16, _num_mask+16
	LDS        R17, _num_mask+17
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,89 :: 		break;
	JMP        L_num_changer9
;LR1.c,91 :: 		case '9':
L_num_changer19:
;LR1.c,93 :: 		digit = num_mask[9];
	LDS        R16, _num_mask+18
	LDS        R17, _num_mask+19
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,94 :: 		break;
	JMP        L_num_changer9
;LR1.c,96 :: 		case 'a':
L_num_changer20:
;LR1.c,97 :: 		case 'A':
L_num_changer21:
;LR1.c,99 :: 		digit = num_mask[10];
	LDS        R16, _num_mask+20
	LDS        R17, _num_mask+21
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,100 :: 		break;
	JMP        L_num_changer9
;LR1.c,102 :: 		case 'b':
L_num_changer22:
;LR1.c,103 :: 		case 'B':
L_num_changer23:
;LR1.c,105 :: 		digit = num_mask[11];
	LDS        R16, _num_mask+22
	LDS        R17, _num_mask+23
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,106 :: 		break;
	JMP        L_num_changer9
;LR1.c,108 :: 		case 'c':
L_num_changer24:
;LR1.c,109 :: 		case 'C':
L_num_changer25:
;LR1.c,111 :: 		digit = num_mask[12];
	LDS        R16, _num_mask+24
	LDS        R17, _num_mask+25
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,112 :: 		break;
	JMP        L_num_changer9
;LR1.c,114 :: 		case 'd':
L_num_changer26:
;LR1.c,115 :: 		case 'D':
L_num_changer27:
;LR1.c,117 :: 		digit = num_mask[13];
	LDS        R16, _num_mask+26
	LDS        R17, _num_mask+27
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,118 :: 		break;
	JMP        L_num_changer9
;LR1.c,120 :: 		case 'e':
L_num_changer28:
;LR1.c,121 :: 		case 'E':
L_num_changer29:
;LR1.c,123 :: 		digit = num_mask[14];
	LDS        R16, _num_mask+28
	LDS        R17, _num_mask+29
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,124 :: 		break;
	JMP        L_num_changer9
;LR1.c,126 :: 		case 'f':
L_num_changer30:
;LR1.c,127 :: 		case 'F':
L_num_changer31:
;LR1.c,129 :: 		digit = num_mask[15];
	LDS        R16, _num_mask+30
	LDS        R17, _num_mask+31
	STS        _digit+0, R16
	STS        _digit+1, R17
;LR1.c,130 :: 		break;
	JMP        L_num_changer9
;LR1.c,132 :: 		default:
L_num_changer32:
;LR1.c,133 :: 		digit = num_mask[atoi(&value[i])];
	LDS        R16, _i+0
	LDS        R17, _i+1
	ADD        R16, R2
	ADC        R17, R3
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
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
;LR1.c,134 :: 		}
	JMP        L_num_changer9
L_num_changer8:
	LDS        R16, _ch+0
	CPI        R16, 48
	BRNE       L__num_changer91
	JMP        L_num_changer10
L__num_changer91:
	LDS        R16, _ch+0
	CPI        R16, 49
	BRNE       L__num_changer92
	JMP        L_num_changer11
L__num_changer92:
	LDS        R16, _ch+0
	CPI        R16, 50
	BRNE       L__num_changer93
	JMP        L_num_changer12
L__num_changer93:
	LDS        R16, _ch+0
	CPI        R16, 51
	BRNE       L__num_changer94
	JMP        L_num_changer13
L__num_changer94:
	LDS        R16, _ch+0
	CPI        R16, 52
	BRNE       L__num_changer95
	JMP        L_num_changer14
L__num_changer95:
	LDS        R16, _ch+0
	CPI        R16, 53
	BRNE       L__num_changer96
	JMP        L_num_changer15
L__num_changer96:
	LDS        R16, _ch+0
	CPI        R16, 54
	BRNE       L__num_changer97
	JMP        L_num_changer16
L__num_changer97:
	LDS        R16, _ch+0
	CPI        R16, 55
	BRNE       L__num_changer98
	JMP        L_num_changer17
L__num_changer98:
	LDS        R16, _ch+0
	CPI        R16, 56
	BRNE       L__num_changer99
	JMP        L_num_changer18
L__num_changer99:
	LDS        R16, _ch+0
	CPI        R16, 57
	BRNE       L__num_changer100
	JMP        L_num_changer19
L__num_changer100:
	LDS        R16, _ch+0
	CPI        R16, 97
	BRNE       L__num_changer101
	JMP        L_num_changer20
L__num_changer101:
	LDS        R16, _ch+0
	CPI        R16, 65
	BRNE       L__num_changer102
	JMP        L_num_changer21
L__num_changer102:
	LDS        R16, _ch+0
	CPI        R16, 98
	BRNE       L__num_changer103
	JMP        L_num_changer22
L__num_changer103:
	LDS        R16, _ch+0
	CPI        R16, 66
	BRNE       L__num_changer104
	JMP        L_num_changer23
L__num_changer104:
	LDS        R16, _ch+0
	CPI        R16, 99
	BRNE       L__num_changer105
	JMP        L_num_changer24
L__num_changer105:
	LDS        R16, _ch+0
	CPI        R16, 67
	BRNE       L__num_changer106
	JMP        L_num_changer25
L__num_changer106:
	LDS        R16, _ch+0
	CPI        R16, 100
	BRNE       L__num_changer107
	JMP        L_num_changer26
L__num_changer107:
	LDS        R16, _ch+0
	CPI        R16, 68
	BRNE       L__num_changer108
	JMP        L_num_changer27
L__num_changer108:
	LDS        R16, _ch+0
	CPI        R16, 101
	BRNE       L__num_changer109
	JMP        L_num_changer28
L__num_changer109:
	LDS        R16, _ch+0
	CPI        R16, 69
	BRNE       L__num_changer110
	JMP        L_num_changer29
L__num_changer110:
	LDS        R16, _ch+0
	CPI        R16, 102
	BRNE       L__num_changer111
	JMP        L_num_changer30
L__num_changer111:
	LDS        R16, _ch+0
	CPI        R16, 70
	BRNE       L__num_changer112
	JMP        L_num_changer31
L__num_changer112:
	JMP        L_num_changer32
L_num_changer9:
;LR1.c,135 :: 		portd_array[3 - i] = digit;
	LDS        R0, _i+0
	LDS        R1, _i+1
	LDI        R18, 3
	LDI        R19, 0
	SUB        R18, R0
	SBC        R19, R1
	LDI        R16, #lo_addr(_portd_array+0)
	LDI        R17, hi_addr(_portd_array+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LDS        R16, _digit+0
	ST         Z, R16
;LR1.c,41 :: 		for (i = strlen(value) - 1; i >= 0; --i)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,137 :: 		}
	JMP        L_num_changer5
L_num_changer6:
;LR1.c,138 :: 		}
L_end_num_changer:
	RET
; end of _num_changer

_num_changer_with_dot:

;LR1.c,140 :: 		void num_changer_with_dot(char * value, int dot_position)
;LR1.c,142 :: 		num_changer(value);
	CALL       _num_changer+0
;LR1.c,144 :: 		portd_array[dot_position] |= 0x80;
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
;LR1.c,145 :: 		}
L_end_num_changer_with_dot:
	RET
; end of _num_changer_with_dot

_task1:

;LR1.c,147 :: 		void task1()
;LR1.c,149 :: 		clear_portd();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _clear_portd+0
;LR1.c,150 :: 		while(1)
L_task133:
;LR1.c,152 :: 		if (PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task135
;LR1.c,153 :: 		num_changer("0059");
	LDI        R27, #lo_addr(?lstr1_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task135:
;LR1.c,154 :: 		while(PINB7_bit);
L_task136:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task137
	JMP        L_task136
L_task137:
;LR1.c,156 :: 		if (PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task138
;LR1.c,157 :: 		num_changer("4619");
	LDI        R27, #lo_addr(?lstr2_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task138:
;LR1.c,158 :: 		while(PINB6_bit);
L_task139:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task140
	JMP        L_task139
L_task140:
;LR1.c,160 :: 		if (PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task141
;LR1.c,161 :: 		num_changer_with_dot("0403", 2);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	LDI        R27, #lo_addr(?lstr3_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_LR1+0)
	MOV        R3, R27
	CALL       _num_changer_with_dot+0
L_task141:
;LR1.c,162 :: 		while(PINB5_bit);
L_task142:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task143
	JMP        L_task142
L_task143:
;LR1.c,164 :: 		if (PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task144
;LR1.c,165 :: 		num_changer("0013");
	LDI        R27, #lo_addr(?lstr4_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task144:
;LR1.c,166 :: 		while(PINB4_bit);
L_task145:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task146
	JMP        L_task145
L_task146:
;LR1.c,168 :: 		if (PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task147
;LR1.c,169 :: 		num_changer("0015");
	LDI        R27, #lo_addr(?lstr5_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task147:
;LR1.c,170 :: 		while(PINB3_bit);
L_task148:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task149
	JMP        L_task148
L_task149:
;LR1.c,172 :: 		if (PINB2_bit)
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task150
;LR1.c,173 :: 		num_changer("110b");
	LDI        R27, #lo_addr(?lstr6_LR1+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_LR1+0)
	MOV        R3, R27
	CALL       _num_changer+0
L_task150:
;LR1.c,174 :: 		while(PINB2_bit);
L_task151:
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task152
	JMP        L_task151
L_task152:
;LR1.c,176 :: 		if (PINB1_bit)
	IN         R27, PINB1_bit+0
	SBRS       R27, BitPos(PINB1_bit+0)
	JMP        L_task153
;LR1.c,178 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,179 :: 		for(k = 0; k <= 15; ++k)
	LDI        R27, 0
	STS        _k+0, R27
	STS        _k+1, R27
L_task154:
	LDS        R18, _k+0
	LDS        R19, _k+1
	LDI        R16, 15
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRSH       L__task1115
	JMP        L_task155
L__task1115:
;LR1.c,181 :: 		digit = num_mask[k];
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
;LR1.c,182 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,183 :: 		delay_ms(750);
	LDI        R18, 39
	LDI        R17, 13
	LDI        R16, 39
L_task157:
	DEC        R16
	BRNE       L_task157
	DEC        R17
	BRNE       L_task157
	DEC        R18
	BRNE       L_task157
	NOP
;LR1.c,179 :: 		for(k = 0; k <= 15; ++k)
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;LR1.c,184 :: 		}
	JMP        L_task154
L_task155:
;LR1.c,185 :: 		}
L_task153:
;LR1.c,186 :: 		while(PINB1_bit);
L_task159:
	IN         R27, PINB1_bit+0
	SBRS       R27, BitPos(PINB1_bit+0)
	JMP        L_task160
	JMP        L_task159
L_task160:
;LR1.c,188 :: 		if (PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task161
;LR1.c,189 :: 		return;
	JMP        L_end_task1
L_task161:
;LR1.c,190 :: 		while(PINB0_bit);
L_task162:
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task163
	JMP        L_task162
L_task163:
;LR1.c,191 :: 		}
	JMP        L_task133
;LR1.c,192 :: 		}
L_end_task1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1

_task2:

;LR1.c,194 :: 		void task2()
;LR1.c,196 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,198 :: 		a = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _a+0, R16
	STS        _a+1, R17
;LR1.c,199 :: 		digit = num_mask[a];
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
;LR1.c,200 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,201 :: 		delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task264:
	DEC        R16
	BRNE       L_task264
	DEC        R17
	BRNE       L_task264
	DEC        R18
	BRNE       L_task264
	NOP
	NOP
;LR1.c,204 :: 		b = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _b+0, R16
	STS        _b+1, R17
;LR1.c,205 :: 		digit = num_mask[b];
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
;LR1.c,206 :: 		portd_array[0] = digit;
	STS        _portd_array+0, R16
;LR1.c,207 :: 		delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task266:
	DEC        R16
	BRNE       L_task266
	DEC        R17
	BRNE       L_task266
	DEC        R18
	BRNE       L_task266
	NOP
	NOP
;LR1.c,209 :: 		i = 0;
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;LR1.c,211 :: 		res = (2 * a * a - 4 * b) / 5;
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
;LR1.c,213 :: 		if(res < 0)
	LDI        R18, 0
	LDI        R19, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task2117
	JMP        L_task268
L__task2117:
;LR1.c,215 :: 		res *= -1;
	LDS        R16, _res+0
	LDS        R17, _res+1
	LDI        R20, 255
	LDI        R21, 255
	CALL       _HWMul_16x16+0
	STS        _res+0, R16
	STS        _res+1, R17
;LR1.c,216 :: 		if (res / 10)
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	MOV        R27, R16
	OR         R27, R17
	BRNE       L__task2118
	JMP        L_task269
L__task2118:
;LR1.c,217 :: 		portd_array[2] = 0x40;
	LDI        R27, 64
	STS        _portd_array+2, R27
	JMP        L_task270
L_task269:
;LR1.c,219 :: 		portd_array[1] = 0x40;
	LDI        R27, 64
	STS        _portd_array+1, R27
L_task270:
;LR1.c,220 :: 		}
L_task268:
;LR1.c,222 :: 		while (res > 0)
L_task271:
	LDS        R18, _res+0
	LDS        R19, _res+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task2119
	JMP        L_task272
L__task2119:
;LR1.c,224 :: 		digit = num_mask[res % 10];
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
;LR1.c,225 :: 		res /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _res+0
	LDS        R17, _res+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _res+0, R16
	STS        _res+1, R17
;LR1.c,226 :: 		portd_array[i] = digit;
	LDI        R18, #lo_addr(_portd_array+0)
	LDI        R19, hi_addr(_portd_array+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LDS        R16, _digit+0
	ST         Z, R16
;LR1.c,227 :: 		i++;
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR1.c,228 :: 		}
	JMP        L_task271
L_task272:
;LR1.c,229 :: 		}
L_end_task2:
	RET
; end of _task2

_task3:

;LR1.c,231 :: 		void task3()
;LR1.c,233 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,235 :: 		portd_array[3] = num_mask[15];
	LDS        R16, _num_mask+30
	STS        _portd_array+3, R16
;LR1.c,236 :: 		portd_array[0] = num_mask[4];
	LDS        R16, _num_mask+8
	STS        _portd_array+0, R16
;LR1.c,237 :: 		}
L_end_task3:
	RET
; end of _task3

_task_picker:

;LR1.c,239 :: 		void task_picker()
;LR1.c,241 :: 		clear_portd();
	CALL       _clear_portd+0
;LR1.c,243 :: 		while(1)
L_task_picker73:
;LR1.c,245 :: 		if (PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker75
;LR1.c,246 :: 		task1();
	CALL       _task1+0
L_task_picker75:
;LR1.c,247 :: 		while(PINB7_bit);
L_task_picker76:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker77
	JMP        L_task_picker76
L_task_picker77:
;LR1.c,249 :: 		if (PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker78
;LR1.c,250 :: 		task2();
	CALL       _task2+0
L_task_picker78:
;LR1.c,251 :: 		while(PINB6_bit);
L_task_picker79:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker80
	JMP        L_task_picker79
L_task_picker80:
;LR1.c,253 :: 		if (PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker81
;LR1.c,254 :: 		task3();
	CALL       _task3+0
L_task_picker81:
;LR1.c,255 :: 		while(PINB5_bit);
L_task_picker82:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker83
	JMP        L_task_picker82
L_task_picker83:
;LR1.c,256 :: 		}
	JMP        L_task_picker73
;LR1.c,257 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR1.c,259 :: 		void main() {
;LR1.c,260 :: 		DDRA = 0x0f;
	LDI        R27, 15
	OUT        DDRA+0, R27
;LR1.c,261 :: 		PORTA = 0;
	LDI        R27, 0
	OUT        PORTA+0, R27
;LR1.c,262 :: 		DDRC = 0xff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR1.c,263 :: 		PORTC = 0;
	LDI        R27, 0
	OUT        PORTC+0, R27
;LR1.c,264 :: 		DDRB = 0x00;   // input
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR1.c,265 :: 		PORTB = 0;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LR1.c,267 :: 		digit = 0;
	LDI        R27, 0
	STS        _digit+0, R27
	STS        _digit+1, R27
;LR1.c,268 :: 		portd_index = 0;
	LDI        R27, 0
	STS        _portd_index+0, R27
;LR1.c,269 :: 		shifter = 1;
	LDI        R27, 1
	STS        _shifter+0, R27
;LR1.c,271 :: 		TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
	LDI        R27, 3
	OUT        TCCR0+0, R27
;LR1.c,273 :: 		SREG_I_bit = 1;               // Interrupt enable
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;LR1.c,274 :: 		TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
	IN         R27, TOIE0_bit+0
	SBR        R27, BitMask(TOIE0_bit+0)
	OUT        TOIE0_bit+0, R27
;LR1.c,276 :: 		task_picker();
	CALL       _task_picker+0
;LR1.c,277 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
