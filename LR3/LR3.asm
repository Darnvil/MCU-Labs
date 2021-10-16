
_task2:

;LR3.c,37 :: 		void task2(){
;LR3.c,38 :: 		max_ = arr[0];
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _arr+0
	LDS        R17, _arr+1
	STS        _max_+0, R16
	STS        _max_+1, R17
;LR3.c,39 :: 		min_ = arr[0];
	STS        _mIn_+0, R16
	STS        _mIn_+1, R17
;LR3.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,41 :: 		for(i = 0; i<10;i++){
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
	BRLT       L__task248
	JMP        L_task21
L__task248:
;LR3.c,42 :: 		if (arr[i] > max_){
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
	BRLT       L__task249
	JMP        L_task23
L__task249:
;LR3.c,43 :: 		max_ = arr[i];
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
;LR3.c,44 :: 		}
L_task23:
;LR3.c,45 :: 		if(arr[i] < min_){
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
	BRLT       L__task250
	JMP        L_task24
L__task250:
;LR3.c,46 :: 		min_ = arr[i];
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
;LR3.c,47 :: 		}
L_task24:
;LR3.c,41 :: 		for(i = 0; i<10;i++){
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,48 :: 		}
	JMP        L_task20
L_task21:
;LR3.c,49 :: 		Lcd_Out(1,2,txt1);
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,50 :: 		}
L_end_task2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task2

_task3:

;LR3.c,51 :: 		void task3(){
;LR3.c,52 :: 		Lcd_Out_CP(500);
	PUSH       R2
	PUSH       R3
	LDI        R27, 244
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,53 :: 		}
L_end_task3:
	POP        R3
	POP        R2
	RET
; end of _task3

_task1_1:

;LR3.c,55 :: 		void task1_1(){
;LR3.c,56 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,58 :: 		Lcd_Out(1,2,txt1); //
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,59 :: 		Lcd_Out(2,4,txt2); //
	LDI        R27, #lo_addr(_txt2+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt2+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,60 :: 		}
L_end_task1_1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_1

_task1_2:

;LR3.c,61 :: 		void task1_2(){
;LR3.c,62 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,64 :: 		Lcd_Out(1,4,txt3); //
	LDI        R27, #lo_addr(_txt3+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt3+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,65 :: 		Lcd_Out(2,4,txt4); //
	LDI        R27, #lo_addr(_txt4+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt4+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,66 :: 		}
L_end_task1_2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_2

_task1_3:

;LR3.c,67 :: 		void task1_3(){
;LR3.c,68 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,69 :: 		Lcd_Out(1,1,txt5); //
	LDI        R27, #lo_addr(_txt5+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt5+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,70 :: 		Lcd_Out(2,1,txt6); //
	LDI        R27, #lo_addr(_txt6+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt6+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,71 :: 		}
L_end_task1_3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_3

_task1_4:

;LR3.c,72 :: 		void task1_4(){
;LR3.c,73 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,75 :: 		Lcd_Out(1,1,txt7); //
	LDI        R27, #lo_addr(_txt7+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt7+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,76 :: 		Lcd_Out(2,4,txt8); //
	LDI        R27, #lo_addr(_txt8+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt8+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,77 :: 		}
L_end_task1_4:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_4

_task1_5:

;LR3.c,78 :: 		void task1_5(){
;LR3.c,79 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,81 :: 		Lcd_Out(1,1,txt9); //
	LDI        R27, #lo_addr(_txt9+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt9+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,82 :: 		Lcd_Out(2,1,txt10); //
	LDI        R27, #lo_addr(_txt10+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt10+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,83 :: 		}
L_end_task1_5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_5

_task1_6:

;LR3.c,84 :: 		void task1_6(){
;LR3.c,85 :: 		while(1)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
L_task1_65:
;LR3.c,87 :: 		Lcd_Cmd(_LCD_CLEAR); //
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,89 :: 		Lcd_Out(1,1,txt11); //
	LDI        R27, #lo_addr(_txt11+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt11+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,90 :: 		Lcd_Out(2,1,txt12); //
	LDI        R27, #lo_addr(_txt12+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt12+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,91 :: 		Delay_ms(1000);
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
;LR3.c,93 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_69
;LR3.c,94 :: 		return;
	JMP        L_end_task1_6
L_task1_69:
;LR3.c,96 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,98 :: 		Lcd_Out(1,1,txt13); //
	LDI        R27, #lo_addr(_txt13+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt13+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,99 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_610:
	DEC        R16
	BRNE       L_task1_610
	DEC        R17
	BRNE       L_task1_610
	DEC        R18
	BRNE       L_task1_610
	NOP
	NOP
;LR3.c,101 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_612
;LR3.c,102 :: 		return;
	JMP        L_end_task1_6
L_task1_612:
;LR3.c,103 :: 		}
	JMP        L_task1_65
;LR3.c,104 :: 		}
L_end_task1_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_6

_task1:

;LR3.c,106 :: 		void task1()
;LR3.c,108 :: 		while(1)
L_task113:
;LR3.c,110 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task115
;LR3.c,112 :: 		task1_1();
	CALL       _task1_1+0
;LR3.c,113 :: 		}
L_task115:
;LR3.c,114 :: 		while(PINB7_bit);
L_task116:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task117
	JMP        L_task116
L_task117:
;LR3.c,116 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task118
;LR3.c,118 :: 		task1_2();
	CALL       _task1_2+0
;LR3.c,119 :: 		}
L_task118:
;LR3.c,120 :: 		while(PINB6_bit);
L_task119:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task120
	JMP        L_task119
L_task120:
;LR3.c,122 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task121
;LR3.c,124 :: 		task1_3();
	CALL       _task1_3+0
;LR3.c,125 :: 		}
L_task121:
;LR3.c,126 :: 		while(PINB5_bit);
L_task122:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task123
	JMP        L_task122
L_task123:
;LR3.c,128 :: 		if(PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task124
;LR3.c,130 :: 		task1_4();
	CALL       _task1_4+0
;LR3.c,131 :: 		}
L_task124:
;LR3.c,132 :: 		while(PINB4_bit);
L_task125:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task126
	JMP        L_task125
L_task126:
;LR3.c,134 :: 		if(PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task127
;LR3.c,136 :: 		task1_5();
	CALL       _task1_5+0
;LR3.c,137 :: 		}
L_task127:
;LR3.c,138 :: 		while(PINB3_bit);
L_task128:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task129
	JMP        L_task128
L_task129:
;LR3.c,140 :: 		if(PINB2_bit)
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task130
;LR3.c,142 :: 		task1_6();
	CALL       _task1_6+0
;LR3.c,143 :: 		}
L_task130:
;LR3.c,144 :: 		while(PINB2_bit);
L_task131:
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task132
	JMP        L_task131
L_task132:
;LR3.c,146 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task133
;LR3.c,148 :: 		return;
	JMP        L_end_task1
;LR3.c,149 :: 		}
L_task133:
;LR3.c,150 :: 		while(PINB0_bit);
L_task134:
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task135
	JMP        L_task134
L_task135:
;LR3.c,151 :: 		}
	JMP        L_task113
;LR3.c,152 :: 		}
L_end_task1:
	RET
; end of _task1

_task_picker:

;LR3.c,154 :: 		void task_picker()
;LR3.c,156 :: 		while(1)
L_task_picker36:
;LR3.c,158 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker38
;LR3.c,160 :: 		task1();
	CALL       _task1+0
;LR3.c,161 :: 		}
L_task_picker38:
;LR3.c,162 :: 		while(PINB7_bit);
L_task_picker39:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker40
	JMP        L_task_picker39
L_task_picker40:
;LR3.c,164 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker41
;LR3.c,166 :: 		task2();
	CALL       _task2+0
;LR3.c,167 :: 		}
L_task_picker41:
;LR3.c,168 :: 		while(PINB6_bit);
L_task_picker42:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker43
	JMP        L_task_picker42
L_task_picker43:
;LR3.c,170 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker44
;LR3.c,172 :: 		task3();
	CALL       _task3+0
;LR3.c,173 :: 		}
L_task_picker44:
;LR3.c,174 :: 		while(PINB5_bit);
L_task_picker45:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker46
	JMP        L_task_picker45
L_task_picker46:
;LR3.c,175 :: 		}
	JMP        L_task_picker36
;LR3.c,176 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR3.c,179 :: 		void main() {
;LR3.c,180 :: 		DDRB = 0x00;
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR3.c,181 :: 		DDRC = 0xFF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR3.c,182 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LR3.c,184 :: 		Lcd_Init(); //
	CALL       _Lcd_Init+0
;LR3.c,187 :: 		task_picker();
	CALL       _task_picker+0
;LR3.c,188 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
