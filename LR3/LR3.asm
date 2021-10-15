
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR3.c,35 :: 		void main() {
;LR3.c,36 :: 		Lcd_Init(); //
	PUSH       R2
	CALL       _Lcd_Init+0
;LR3.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,38 :: 		}
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_task2:

;LR3.c,40 :: 		void task2(){
;LR3.c,41 :: 		max_ = arr[0];
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _arr+0
	LDS        R17, _arr+1
	STS        _max_+0, R16
	STS        _max_+1, R17
;LR3.c,42 :: 		min_ = arr[0];
	STS        _mIn_+0, R16
	STS        _mIn_+1, R17
;LR3.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,44 :: 		for(i = 0; i<10;i++){
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_task20:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task212
	JMP        L_task21
L__task212:
;LR3.c,45 :: 		if (arr[i] > max_){
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_arr+0)
	LDI        R17, hi_addr(_arr+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R18, Z+
	LD         R19, Z+
	LDS        R16, _max_+0
	LDS        R17, _max_+1
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__task213
	JMP        L_task23
L__task213:
;LR3.c,46 :: 		max_ = arr[i];
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_arr+0)
	LDI        R17, hi_addr(_arr+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z+
	LD         R17, Z+
	STS        _max_+0, R16
	STS        _max_+1, R17
;LR3.c,47 :: 		}
L_task23:
;LR3.c,48 :: 		if(arr[i] < min_){
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_arr+0)
	LDI        R17, hi_addr(_arr+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R18, Z+
	LD         R19, Z+
	LDS        R16, _mIn_+0
	LDS        R17, _mIn_+1
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task214
	JMP        L_task24
L__task214:
;LR3.c,49 :: 		min_ = arr[i];
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_arr+0)
	LDI        R17, hi_addr(_arr+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z+
	LD         R17, Z+
	STS        _mIn_+0, R16
	STS        _mIn_+1, R17
;LR3.c,50 :: 		}
L_task24:
;LR3.c,44 :: 		for(i = 0; i<10;i++){
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,51 :: 		}
	JMP        L_task20
L_task21:
;LR3.c,52 :: 		Lcd_Out(1,2,txt1);
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,53 :: 		}
L_end_task2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task2

_task3:

;LR3.c,54 :: 		void task3(){
;LR3.c,55 :: 		Lcd_Out_CP(500);
	PUSH       R2
	PUSH       R3
	LDI        R27, 244
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,56 :: 		}
L_end_task3:
	POP        R3
	POP        R2
	RET
; end of _task3

_task1_1:

;LR3.c,58 :: 		void task1_1(){
;LR3.c,59 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,61 :: 		Lcd_Out(1,2,txt1); //
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,62 :: 		Lcd_Out(2,4,txt2); //
	LDI        R27, #lo_addr(_txt2+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt2+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,63 :: 		}
L_end_task1_1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_1

_task1_2:

;LR3.c,64 :: 		void task1_2(){
;LR3.c,65 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,67 :: 		Lcd_Out(1,4,txt3); //
	LDI        R27, #lo_addr(_txt3+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt3+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,68 :: 		Lcd_Out(2,4,txt4); //
	LDI        R27, #lo_addr(_txt4+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt4+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,69 :: 		}
L_end_task1_2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_2

_task1_3:

;LR3.c,70 :: 		void task1_3(){
;LR3.c,71 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,73 :: 		Lcd_Out(1,1,txt5); //
	LDI        R27, #lo_addr(_txt5+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt5+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,74 :: 		Lcd_Out(2,1,txt6); //
	LDI        R27, #lo_addr(_txt6+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt6+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,75 :: 		}
L_end_task1_3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_3

_task1_4:

;LR3.c,76 :: 		void task1_4(){
;LR3.c,77 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,79 :: 		Lcd_Out(1,1,txt7); //
	LDI        R27, #lo_addr(_txt7+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt7+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,80 :: 		Lcd_Out(2,4,txt8); //
	LDI        R27, #lo_addr(_txt8+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt8+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,81 :: 		}
L_end_task1_4:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_4

_task1_5:

;LR3.c,82 :: 		void task1_5(){
;LR3.c,83 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,85 :: 		Lcd_Out(1,1,txt9); //
	LDI        R27, #lo_addr(_txt9+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt9+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,86 :: 		Lcd_Out(2,1,txt10); //
	LDI        R27, #lo_addr(_txt10+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt10+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,87 :: 		}
L_end_task1_5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_5

_task1_6:

;LR3.c,88 :: 		void task1_6(){
;LR3.c,89 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,91 :: 		Lcd_Out(1,1,txt11); //
	LDI        R27, #lo_addr(_txt11+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt11+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,92 :: 		Lcd_Out(2,1,txt12); //
	LDI        R27, #lo_addr(_txt12+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt12+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,93 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_65:
	DEC        R16
	BRNE       L_task1_65
	DEC        R17
	BRNE       L_task1_65
	DEC        R18
	BRNE       L_task1_65
	NOP
	NOP
;LR3.c,94 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,96 :: 		Lcd_Out(1,1,txt13); //
	LDI        R27, #lo_addr(_txt13+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt13+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,97 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_67:
	DEC        R16
	BRNE       L_task1_67
	DEC        R17
	BRNE       L_task1_67
	DEC        R18
	BRNE       L_task1_67
	NOP
	NOP
;LR3.c,98 :: 		}
L_end_task1_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_6
