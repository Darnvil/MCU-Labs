
_task1:

;LR2.c,9 :: 		void task1()
;LR2.c,11 :: 		DDRB = 0xFF;
	LDI        R27, 255
	OUT        DDRB+0, R27
;LR2.c,13 :: 		do
L_task10:
;LR2.c,15 :: 		while (i>0)
L_task13:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task118
	JMP        L_task14
L__task118:
;LR2.c,17 :: 		PORTB = i;
	LDS        R16, _i+0
	OUT        PORTB+0, R16
;LR2.c,18 :: 		Delay_ms(500);
	LDI        R18, 26
	LDI        R17, 94
	LDI        R16, 111
L_task15:
	DEC        R16
	BRNE       L_task15
	DEC        R17
	BRNE       L_task15
	DEC        R18
	BRNE       L_task15
	NOP
;LR2.c,19 :: 		i/=2;
	LDI        R20, 2
	LDI        R21, 0
	LDS        R16, _i+0
	LDS        R17, _i+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _i+0, R16
	STS        _i+1, R17
;LR2.c,20 :: 		}
	JMP        L_task13
L_task14:
;LR2.c,21 :: 		i = 4;
	LDI        R27, 4
	STS        _i+0, R27
	LDI        R27, 0
	STS        _i+1, R27
;LR2.c,22 :: 		} while(1);
	JMP        L_task10
;LR2.c,23 :: 		}
L_end_task1:
	RET
; end of _task1

_task2:

;LR2.c,25 :: 		void task2()
;LR2.c,27 :: 		DDRD = 0xFF;
	LDI        R27, 255
	OUT        DDRD+0, R27
;LR2.c,28 :: 		while(1)
L_task27:
;LR2.c,30 :: 		while (j < 9)
L_task29:
	LDS        R18, _j+0
	LDS        R19, _j+1
	LDI        R16, 9
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task220
	JMP        L_task210
L__task220:
;LR2.c,32 :: 		PORTD = sequence[j];
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
;LR2.c,33 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task211:
	DEC        R16
	BRNE       L_task211
	DEC        R17
	BRNE       L_task211
	DEC        R18
	BRNE       L_task211
	NOP
	NOP
;LR2.c,34 :: 		j++;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _j+0, R16
	STS        _j+1, R17
;LR2.c,35 :: 		}
	JMP        L_task29
L_task210:
;LR2.c,36 :: 		j--;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _j+0, R16
	STS        _j+1, R17
;LR2.c,37 :: 		while (j > 0)
L_task213:
	LDS        R18, _j+0
	LDS        R19, _j+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task221
	JMP        L_task214
L__task221:
;LR2.c,39 :: 		PORTD = sequence[j];
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
;LR2.c,40 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task215:
	DEC        R16
	BRNE       L_task215
	DEC        R17
	BRNE       L_task215
	DEC        R18
	BRNE       L_task215
	NOP
	NOP
;LR2.c,41 :: 		j--;
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _j+0, R16
	STS        _j+1, R17
;LR2.c,42 :: 		}
	JMP        L_task213
L_task214:
;LR2.c,43 :: 		}
	JMP        L_task27
;LR2.c,44 :: 		}
L_end_task2:
	RET
; end of _task2

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR2.c,46 :: 		void main() {
;LR2.c,47 :: 		task2();
	CALL       _task2+0
;LR2.c,48 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
