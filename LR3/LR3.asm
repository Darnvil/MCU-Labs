
_task2:

;LR3.c,41 :: 		void task2(){
;LR3.c,42 :: 		max_ = arr[0];
	PUSH       R2
	PUSH       R3
	LDS        R16, _arr+0
	LDS        R17, _arr+1
	STS        _max_+0, R16
	STS        _max_+1, R17
;LR3.c,43 :: 		min_ = arr[0];
	STS        _mIn_+0, R16
	STS        _mIn_+1, R17
;LR3.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,45 :: 		for(i = 0; i<10;i++){
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
	BRLT       L__task275
	JMP        L_task21
L__task275:
;LR3.c,46 :: 		if (arr[i] > max_){
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
	BRLT       L__task276
	JMP        L_task23
L__task276:
;LR3.c,47 :: 		max_ = arr[i];
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
;LR3.c,48 :: 		}
L_task23:
;LR3.c,49 :: 		if(arr[i] < min_){
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
	BRLT       L__task277
	JMP        L_task24
L__task277:
;LR3.c,50 :: 		min_ = arr[i];
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
;LR3.c,51 :: 		}
L_task24:
;LR3.c,45 :: 		for(i = 0; i<10;i++){
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,52 :: 		}
	JMP        L_task20
L_task21:
;LR3.c,53 :: 		Lcd_Out_CP("Max = ");
	LDI        R27, #lo_addr(?lstr1_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,54 :: 		Lcd_Out_CP(max_);
	LDS        R2, _max_+0
	LDS        R3, _max_+1
	CALL       _Lcd_Out_CP+0
;LR3.c,55 :: 		Lcd_Out_CP("; Min = ");
	LDI        R27, #lo_addr(?lstr2_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,56 :: 		Lcd_Out_CP(min_);
	LDS        R2, _mIn_+0
	LDS        R3, _mIn_+1
	CALL       _Lcd_Out_CP+0
;LR3.c,57 :: 		}
L_end_task2:
	POP        R3
	POP        R2
	RET
; end of _task2

_task3:

;LR3.c,58 :: 		void task3(){
;LR3.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	PUSH       R2
	PUSH       R3
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,60 :: 		Lcd_Out_CP("(2a^2 - 4b)/5\n");
	LDI        R27, #lo_addr(?lstr3_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,61 :: 		Lcd_Out_CP(500);
	LDI        R27, 244
	MOV        R2, R27
	LDI        R27, 1
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,62 :: 		a = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _a+0, R16
	STS        _a+1, R17
;LR3.c,63 :: 		b = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _b+0, R16
	STS        _b+1, R17
;LR3.c,64 :: 		res = (2 * a * a - 4 * b) / 5;
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
;LR3.c,65 :: 		Lcd_Out_CP("A=");
	LDI        R27, #lo_addr(?lstr4_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,66 :: 		Lcd_Out_CP(a);
	LDS        R2, _a+0
	LDS        R3, _a+1
	CALL       _Lcd_Out_CP+0
;LR3.c,67 :: 		Lcd_Out_CP(" B=");
	LDI        R27, #lo_addr(?lstr5_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,68 :: 		Lcd_Out_CP("b");
	LDI        R27, #lo_addr(?lstr6_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,69 :: 		Lcd_Out_CP("; ");
	LDI        R27, #lo_addr(?lstr7_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,70 :: 		Lcd_Out_CP(res);
	LDS        R2, _res+0
	LDS        R3, _res+1
	CALL       _Lcd_Out_CP+0
;LR3.c,71 :: 		}
L_end_task3:
	POP        R3
	POP        R2
	RET
; end of _task3

_Pixels:

;LR3.c,73 :: 		void Pixels(int F){
;LR3.c,74 :: 		switch(F){
	JMP        L_Pixels5
;LR3.c,75 :: 		case 1:
L_Pixels7:
;LR3.c,76 :: 		character[2] = 16;
	LDI        R27, 16
	STS        _character+2, R27
;LR3.c,77 :: 		character[3] = 16;
	LDI        R27, 16
	STS        _character+3, R27
;LR3.c,78 :: 		character[4] = 16;
	LDI        R27, 16
	STS        _character+4, R27
;LR3.c,79 :: 		character[5] = 16;
	LDI        R27, 16
	STS        _character+5, R27
;LR3.c,80 :: 		break;
	JMP        L_Pixels6
;LR3.c,81 :: 		case 2:
L_Pixels8:
;LR3.c,82 :: 		character[2] = 24;
	LDI        R27, 24
	STS        _character+2, R27
;LR3.c,83 :: 		character[3] = 24;
	LDI        R27, 24
	STS        _character+3, R27
;LR3.c,84 :: 		character[4] = 24;
	LDI        R27, 24
	STS        _character+4, R27
;LR3.c,85 :: 		character[5] = 24;
	LDI        R27, 24
	STS        _character+5, R27
;LR3.c,86 :: 		break;
	JMP        L_Pixels6
;LR3.c,87 :: 		case 3:
L_Pixels9:
;LR3.c,88 :: 		character[2] = 28;
	LDI        R27, 28
	STS        _character+2, R27
;LR3.c,89 :: 		character[3] = 28;
	LDI        R27, 28
	STS        _character+3, R27
;LR3.c,90 :: 		character[4] = 28;
	LDI        R27, 28
	STS        _character+4, R27
;LR3.c,91 :: 		character[5] = 28;
	LDI        R27, 28
	STS        _character+5, R27
;LR3.c,92 :: 		break;
	JMP        L_Pixels6
;LR3.c,93 :: 		case 4:
L_Pixels10:
;LR3.c,94 :: 		character[2] = 30;
	LDI        R27, 30
	STS        _character+2, R27
;LR3.c,95 :: 		character[3] = 30;
	LDI        R27, 30
	STS        _character+3, R27
;LR3.c,96 :: 		character[4] = 30;
	LDI        R27, 30
	STS        _character+4, R27
;LR3.c,97 :: 		character[5] = 30;
	LDI        R27, 30
	STS        _character+5, R27
;LR3.c,98 :: 		break;
	JMP        L_Pixels6
;LR3.c,99 :: 		default:
L_Pixels11:
;LR3.c,100 :: 		character[2] = 31;
	LDI        R27, 31
	STS        _character+2, R27
;LR3.c,101 :: 		character[3] = 31;
	LDI        R27, 31
	STS        _character+3, R27
;LR3.c,102 :: 		character[4] = 31;
	LDI        R27, 31
	STS        _character+4, R27
;LR3.c,103 :: 		character[5] = 31;
	LDI        R27, 31
	STS        _character+5, R27
;LR3.c,104 :: 		}
	JMP        L_Pixels6
L_Pixels5:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__Pixels80
	LDI        R27, 1
	CP         R2, R27
L__Pixels80:
	BRNE       L__Pixels81
	JMP        L_Pixels7
L__Pixels81:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__Pixels82
	LDI        R27, 2
	CP         R2, R27
L__Pixels82:
	BRNE       L__Pixels83
	JMP        L_Pixels8
L__Pixels83:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__Pixels84
	LDI        R27, 3
	CP         R2, R27
L__Pixels84:
	BRNE       L__Pixels85
	JMP        L_Pixels9
L__Pixels85:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__Pixels86
	LDI        R27, 4
	CP         R2, R27
L__Pixels86:
	BRNE       L__Pixels87
	JMP        L_Pixels10
L__Pixels87:
	JMP        L_Pixels11
L_Pixels6:
;LR3.c,106 :: 		}
L_end_Pixels:
	RET
; end of _Pixels

_CustomChar:

;LR3.c,108 :: 		void CustomChar(int F) {
;LR3.c,109 :: 		Lcd_Cmd(64);
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 64
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
	POP        R2
	POP        R3
;LR3.c,110 :: 		for (j=0;F>0;j+=4) {
	LDI        R27, 0
	STS        _j+0, R27
	STS        _j+1, R27
L_CustomChar12:
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	BRLT       L__CustomChar89
	JMP        L_CustomChar13
L__CustomChar89:
;LR3.c,111 :: 		Pixels(F);
	CALL       _Pixels+0
;LR3.c,112 :: 		for (ch = 2; ch<=5; ch++) Lcd_Chr_CP(character[ch]);
	LDI        R27, 2
	STS        _ch+0, R27
L_CustomChar15:
	LDS        R17, _ch+0
	LDI        R16, 5
	CP         R16, R17
	BRSH       L__CustomChar90
	JMP        L_CustomChar16
L__CustomChar90:
	LDI        R17, #lo_addr(_character+0)
	LDI        R18, hi_addr(_character+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LD         R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
	LDS        R16, _ch+0
	SUBI       R16, 255
	STS        _ch+0, R16
	JMP        L_CustomChar15
L_CustomChar16:
;LR3.c,113 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	PUSH       R3
	PUSH       R2
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,114 :: 		Lcd_Chr(0, j, 0);
	CLR        R4
	LDS        R3, _j+0
	CLR        R2
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
;LR3.c,115 :: 		F-=4;
	MOVW       R16, R2
	SUBI       R16, 4
	SBCI       R17, 0
	MOVW       R2, R16
;LR3.c,110 :: 		for (j=0;F>0;j+=4) {
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 252
	SBCI       R17, 255
	STS        _j+0, R16
	STS        _j+1, R17
;LR3.c,116 :: 		}
	JMP        L_CustomChar12
L_CustomChar13:
;LR3.c,117 :: 		}
L_end_CustomChar:
	POP        R4
	RET
; end of _CustomChar

_task4:

;LR3.c,119 :: 		void task4(){
;LR3.c,121 :: 		F = abs(2*xx[rand()%12]-768)/16;
	PUSH       R2
	PUSH       R3
	CALL       _rand+0
	LDI        R20, 12
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_xx+0)
	LDI        R17, hi_addr(_xx+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z+
	LD         R17, Z+
	LSL        R16
	ROL        R17
	SUBI       R16, 0
	SBCI       R17, 3
	MOVW       R2, R16
	CALL       _abs+0
	LDI        R20, 16
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _F+0, R16
	STS        _F+1, R17
;LR3.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,123 :: 		CustomChar(F);
	LDS        R2, _F+0
	LDS        R3, _F+1
	CALL       _CustomChar+0
;LR3.c,124 :: 		}
L_end_task4:
	POP        R3
	POP        R2
	RET
; end of _task4

_task5:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;LR3.c,127 :: 		void task5(){
;LR3.c,128 :: 		i = 0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;LR3.c,129 :: 		while(1)
L_task518:
;LR3.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,132 :: 		for (i = 0; i < 16; i++)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_task520:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 16
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task593
	JMP        L_task521
L__task593:
;LR3.c,134 :: 		text1[i] = text[i+temp%29];
	LDI        R18, #lo_addr(_text1+0)
	LDI        R19, hi_addr(_text1+0)
	LDS        R16, _i+0
	LDS        R17, _i+1
	ADD        R16, R18
	ADC        R17, R19
	STD        Y+0, R16
	STD        Y+1, R17
	LDI        R20, 29
	LDI        R21, 0
	LDS        R16, _temp+0
	LDS        R17, _temp+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	LDS        R18, _i+0
	LDS        R19, _i+1
	ADD        R18, R16
	ADC        R19, R17
	LDI        R16, #lo_addr(_text+0)
	LDI        R17, hi_addr(_text+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R18, Z
	LDD        R16, Y+0
	LDD        R17, Y+1
	MOVW       R30, R16
	ST         Z, R18
;LR3.c,132 :: 		for (i = 0; i < 16; i++)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,135 :: 		}
	JMP        L_task520
L_task521:
;LR3.c,136 :: 		Lcd_Out(1,1,text1);
	LDI        R27, #lo_addr(_text1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_text1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,137 :: 		delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task523:
	DEC        R16
	BRNE       L_task523
	DEC        R17
	BRNE       L_task523
	DEC        R18
	BRNE       L_task523
	NOP
	NOP
;LR3.c,138 :: 		temp++;
	LDS        R16, _temp+0
	LDS        R17, _temp+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _temp+0, R16
	STS        _temp+1, R17
;LR3.c,139 :: 		if (temp == 22) temp = 0;
	CPI        R17, 0
	BRNE       L__task594
	CPI        R16, 22
L__task594:
	BREQ       L__task595
	JMP        L_task525
L__task595:
	LDI        R27, 0
	STS        _temp+0, R27
	STS        _temp+1, R27
L_task525:
;LR3.c,140 :: 		}
	JMP        L_task518
;LR3.c,141 :: 		}
L_end_task5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _task5

_task1_1:

;LR3.c,143 :: 		void task1_1(){
;LR3.c,144 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,146 :: 		Lcd_Out(1,2,txt1); //
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,147 :: 		Lcd_Out(2,4,txt2); //
	LDI        R27, #lo_addr(_txt2+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt2+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,148 :: 		}
L_end_task1_1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_1

_task1_2:

;LR3.c,149 :: 		void task1_2(){
;LR3.c,150 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,152 :: 		Lcd_Out(1,4,txt3); //
	LDI        R27, #lo_addr(_txt3+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt3+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,153 :: 		Lcd_Out(2,4,txt4); //
	LDI        R27, #lo_addr(_txt4+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt4+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,154 :: 		}
L_end_task1_2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_2

_task1_3:

;LR3.c,155 :: 		void task1_3(){
;LR3.c,156 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,157 :: 		Lcd_Out(1,1,txt5); //
	LDI        R27, #lo_addr(_txt5+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt5+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,158 :: 		Lcd_Out(2,1,txt6); //
	LDI        R27, #lo_addr(_txt6+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt6+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,159 :: 		}
L_end_task1_3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_3

_task1_4:

;LR3.c,160 :: 		void task1_4(){
;LR3.c,161 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,163 :: 		Lcd_Out(1,1,txt7); //
	LDI        R27, #lo_addr(_txt7+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt7+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,164 :: 		Lcd_Out(2,4,txt8); //
	LDI        R27, #lo_addr(_txt8+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt8+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,165 :: 		}
L_end_task1_4:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_4

_task1_5:

;LR3.c,166 :: 		void task1_5(){
;LR3.c,167 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,169 :: 		Lcd_Out(1,1,txt9); //
	LDI        R27, #lo_addr(_txt9+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt9+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,170 :: 		Lcd_Out(2,1,txt10); //
	LDI        R27, #lo_addr(_txt10+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt10+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,171 :: 		}
L_end_task1_5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_5

_task1_6:

;LR3.c,172 :: 		void task1_6(){
;LR3.c,173 :: 		while(1)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
L_task1_626:
;LR3.c,175 :: 		Lcd_Cmd(_LCD_CLEAR); //
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,177 :: 		Lcd_Out(1,1,txt11); //
	LDI        R27, #lo_addr(_txt11+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt11+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,178 :: 		Lcd_Out(2,1,txt12); //
	LDI        R27, #lo_addr(_txt12+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt12+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,179 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_628:
	DEC        R16
	BRNE       L_task1_628
	DEC        R17
	BRNE       L_task1_628
	DEC        R18
	BRNE       L_task1_628
	NOP
	NOP
;LR3.c,181 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_630
;LR3.c,182 :: 		return;
	JMP        L_end_task1_6
L_task1_630:
;LR3.c,184 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,186 :: 		Lcd_Out(1,1,txt13); //
	LDI        R27, #lo_addr(_txt13+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt13+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,187 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_631:
	DEC        R16
	BRNE       L_task1_631
	DEC        R17
	BRNE       L_task1_631
	DEC        R18
	BRNE       L_task1_631
	NOP
	NOP
;LR3.c,189 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_633
;LR3.c,190 :: 		return;
	JMP        L_end_task1_6
L_task1_633:
;LR3.c,191 :: 		}
	JMP        L_task1_626
;LR3.c,192 :: 		}
L_end_task1_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_6

_task1:

;LR3.c,194 :: 		void task1()
;LR3.c,196 :: 		while(1)
L_task134:
;LR3.c,198 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task136
;LR3.c,200 :: 		task1_1();
	CALL       _task1_1+0
;LR3.c,201 :: 		}
L_task136:
;LR3.c,202 :: 		while(PINB7_bit);
L_task137:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task138
	JMP        L_task137
L_task138:
;LR3.c,204 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task139
;LR3.c,206 :: 		task1_2();
	CALL       _task1_2+0
;LR3.c,207 :: 		}
L_task139:
;LR3.c,208 :: 		while(PINB6_bit);
L_task140:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task141
	JMP        L_task140
L_task141:
;LR3.c,210 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task142
;LR3.c,212 :: 		task1_3();
	CALL       _task1_3+0
;LR3.c,213 :: 		}
L_task142:
;LR3.c,214 :: 		while(PINB5_bit);
L_task143:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task144
	JMP        L_task143
L_task144:
;LR3.c,216 :: 		if(PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task145
;LR3.c,218 :: 		task1_4();
	CALL       _task1_4+0
;LR3.c,219 :: 		}
L_task145:
;LR3.c,220 :: 		while(PINB4_bit);
L_task146:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task147
	JMP        L_task146
L_task147:
;LR3.c,222 :: 		if(PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task148
;LR3.c,224 :: 		task1_5();
	CALL       _task1_5+0
;LR3.c,225 :: 		}
L_task148:
;LR3.c,226 :: 		while(PINB3_bit);
L_task149:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task150
	JMP        L_task149
L_task150:
;LR3.c,228 :: 		if(PINB2_bit)
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task151
;LR3.c,230 :: 		task1_6();
	CALL       _task1_6+0
;LR3.c,231 :: 		}
L_task151:
;LR3.c,232 :: 		while(PINB2_bit);
L_task152:
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task153
	JMP        L_task152
L_task153:
;LR3.c,234 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task154
;LR3.c,236 :: 		return;
	JMP        L_end_task1
;LR3.c,237 :: 		}
L_task154:
;LR3.c,238 :: 		while(PINB0_bit);
L_task155:
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task156
	JMP        L_task155
L_task156:
;LR3.c,239 :: 		}
	JMP        L_task134
;LR3.c,240 :: 		}
L_end_task1:
	RET
; end of _task1

_task_picker:

;LR3.c,242 :: 		void task_picker()
;LR3.c,244 :: 		while(1)
L_task_picker57:
;LR3.c,246 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker59
;LR3.c,248 :: 		task1();
	CALL       _task1+0
;LR3.c,249 :: 		}
L_task_picker59:
;LR3.c,250 :: 		while(PINB7_bit);
L_task_picker60:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker61
	JMP        L_task_picker60
L_task_picker61:
;LR3.c,252 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker62
;LR3.c,254 :: 		task2();
	CALL       _task2+0
;LR3.c,255 :: 		}
L_task_picker62:
;LR3.c,256 :: 		while(PINB6_bit);
L_task_picker63:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker64
	JMP        L_task_picker63
L_task_picker64:
;LR3.c,258 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker65
;LR3.c,260 :: 		task3();
	CALL       _task3+0
;LR3.c,261 :: 		}
L_task_picker65:
;LR3.c,262 :: 		while(PINB5_bit);
L_task_picker66:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker67
	JMP        L_task_picker66
L_task_picker67:
;LR3.c,263 :: 		if(PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task_picker68
;LR3.c,265 :: 		task4();
	CALL       _task4+0
;LR3.c,266 :: 		}
L_task_picker68:
;LR3.c,267 :: 		while(PINB4_bit);
L_task_picker69:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task_picker70
	JMP        L_task_picker69
L_task_picker70:
;LR3.c,268 :: 		if(PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task_picker71
;LR3.c,270 :: 		task5();
	CALL       _task5+0
;LR3.c,271 :: 		}
L_task_picker71:
;LR3.c,272 :: 		while(PINB3_bit);
L_task_picker72:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task_picker73
	JMP        L_task_picker72
L_task_picker73:
;LR3.c,273 :: 		}
	JMP        L_task_picker57
;LR3.c,274 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR3.c,277 :: 		void main() {
;LR3.c,278 :: 		DDRB = 0x00;
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR3.c,279 :: 		DDRC = 0xFF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR3.c,280 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LR3.c,282 :: 		Lcd_Init(); //
	CALL       _Lcd_Init+0
;LR3.c,284 :: 		task_picker();
	CALL       _task_picker+0
;LR3.c,285 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
