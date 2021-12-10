
_task2:

;LR3.c,48 :: 		void task2(){
;LR3.c,49 :: 		max_ = arr[0];
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _arr+0
	LDS        R17, _arr+1
	STS        _max_+0, R16
	STS        _max_+1, R17
;LR3.c,50 :: 		min_ = arr[0];
	STS        _min_+0, R16
	STS        _min_+1, R17
;LR3.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,52 :: 		for(i = 0; i<10;i++){
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
	BRLT       L__task282
	JMP        L_task21
L__task282:
;LR3.c,53 :: 		if (arr[i] > max_){
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
	BRLT       L__task283
	JMP        L_task23
L__task283:
;LR3.c,54 :: 		max_ = arr[i];
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
;LR3.c,55 :: 		}
L_task23:
;LR3.c,56 :: 		if(arr[i] < min_){
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
	LDS        R16, _min_+0
	LDS        R17, _min_+1
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task284
	JMP        L_task24
L__task284:
;LR3.c,57 :: 		min_ = arr[i];
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
	STS        _min_+0, R16
	STS        _min_+1, R17
;LR3.c,58 :: 		}
L_task24:
;LR3.c,52 :: 		for(i = 0; i<10;i++){
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,59 :: 		}
	JMP        L_task20
L_task21:
;LR3.c,60 :: 		Lcd_Out_CP("Max = ");
	LDI        R27, #lo_addr(?lstr1_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,61 :: 		IntToStr(max_, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _max_+0
	LDS        R3, _max_+1
	CALL       _IntToStr+0
;LR3.c,63 :: 		Lcd_Out_CP(ch_p + 4);
	LDI        R27, #lo_addr(_ch_p+4)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+4)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,64 :: 		Lcd_Out_CP(";");
	LDI        R27, #lo_addr(?lstr2_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,65 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	LDI        R27, 192
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,66 :: 		Lcd_Out_CP("Min = ");
	LDI        R27, #lo_addr(?lstr3_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,67 :: 		IntToStr(min_, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _min_+0
	LDS        R3, _min_+1
	CALL       _IntToStr+0
;LR3.c,68 :: 		Lcd_Out_CP(ch_p + 4);
	LDI        R27, #lo_addr(_ch_p+4)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+4)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,69 :: 		}
L_end_task2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task2

_task3:

;LR3.c,70 :: 		void task3(){
;LR3.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,72 :: 		Lcd_Out_CP("(2a^2 - 4b)/5");
	LDI        R27, #lo_addr(?lstr4_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,73 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	LDI        R27, 192
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,74 :: 		a = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _a+0, R16
	STS        _a+1, R17
;LR3.c,75 :: 		b = rand() % 10;
	CALL       _rand+0
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	STS        _b+0, R16
	STS        _b+1, R17
;LR3.c,76 :: 		res = (2 * a * a - 4 * b) / 5;
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
;LR3.c,77 :: 		Lcd_Out_CP("A=");
	LDI        R27, #lo_addr(?lstr5_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,78 :: 		IntToStr(a, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _a+0
	LDS        R3, _a+1
	CALL       _IntToStr+0
;LR3.c,79 :: 		Lcd_Out_CP(ch_p + 4);
	LDI        R27, #lo_addr(_ch_p+4)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+4)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,80 :: 		Lcd_Out_CP(" B=");
	LDI        R27, #lo_addr(?lstr6_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,81 :: 		IntToStr(b, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _b+0
	LDS        R3, _b+1
	CALL       _IntToStr+0
;LR3.c,82 :: 		Lcd_Out_CP(ch_p + 4);
	LDI        R27, #lo_addr(_ch_p+4)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+4)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,83 :: 		Lcd_Out_CP("; ");
	LDI        R27, #lo_addr(?lstr7_LR3+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_LR3+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,84 :: 		IntToStr(res, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _res+0
	LDS        R3, _res+1
	CALL       _IntToStr+0
;LR3.c,85 :: 		Lcd_Out_CP(ch_p + 4);
	LDI        R27, #lo_addr(_ch_p+4)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+4)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,86 :: 		}
L_end_task3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task3

_Pixels:

;LR3.c,88 :: 		void Pixels(int F){
;LR3.c,107 :: 		}
L_end_Pixels:
	RET
; end of _Pixels

_CustomChar:

;LR3.c,109 :: 		void CustomChar(int F_1) {
;LR3.c,112 :: 		a = 0;
	PUSH       R4
	LDI        R27, 0
	STS        _a+0, R27
	STS        _a+1, R27
;LR3.c,113 :: 		for (j=1;F_1>0;j++) {
	LDI        R27, 1
	STS        _j+0, R27
	LDI        R27, 0
	STS        _j+1, R27
L_CustomChar5:
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R2
	CPC        R17, R3
	BRLT       L__CustomChar88
	JMP        L_CustomChar6
L__CustomChar88:
;LR3.c,115 :: 		switch(F_1){
	JMP        L_CustomChar8
;LR3.c,116 :: 		case 1:
L_CustomChar10:
;LR3.c,118 :: 		cmd = 96;
	LDI        R27, 96
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,119 :: 		a = 4;
	LDI        R27, 4
	STS        _a+0, R27
	LDI        R27, 0
	STS        _a+1, R27
;LR3.c,121 :: 		break;
	JMP        L_CustomChar9
;LR3.c,122 :: 		case 2:
L_CustomChar11:
;LR3.c,124 :: 		cmd = 88;
	LDI        R27, 88
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,125 :: 		a = 3;
	LDI        R27, 3
	STS        _a+0, R27
	LDI        R27, 0
	STS        _a+1, R27
;LR3.c,127 :: 		break;
	JMP        L_CustomChar9
;LR3.c,128 :: 		case 3:
L_CustomChar12:
;LR3.c,130 :: 		cmd = 80;
	LDI        R27, 80
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,131 :: 		a = 2;
	LDI        R27, 2
	STS        _a+0, R27
	LDI        R27, 0
	STS        _a+1, R27
;LR3.c,133 :: 		break;
	JMP        L_CustomChar9
;LR3.c,134 :: 		case 4:
L_CustomChar13:
;LR3.c,136 :: 		cmd = 72;
	LDI        R27, 72
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,137 :: 		a = 1;
	LDI        R27, 1
	STS        _a+0, R27
	LDI        R27, 0
	STS        _a+1, R27
;LR3.c,139 :: 		break;
	JMP        L_CustomChar9
;LR3.c,140 :: 		default:
L_CustomChar14:
;LR3.c,142 :: 		cmd = 64;
	LDI        R27, 64
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,143 :: 		a = 0;
	LDI        R27, 0
	STS        _a+0, R27
	STS        _a+1, R27
;LR3.c,145 :: 		}
	JMP        L_CustomChar9
L_CustomChar8:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar89
	LDI        R27, 1
	CP         R2, R27
L__CustomChar89:
	BRNE       L__CustomChar90
	JMP        L_CustomChar10
L__CustomChar90:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar91
	LDI        R27, 2
	CP         R2, R27
L__CustomChar91:
	BRNE       L__CustomChar92
	JMP        L_CustomChar11
L__CustomChar92:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar93
	LDI        R27, 3
	CP         R2, R27
L__CustomChar93:
	BRNE       L__CustomChar94
	JMP        L_CustomChar12
L__CustomChar94:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar95
	LDI        R27, 4
	CP         R2, R27
L__CustomChar95:
	BRNE       L__CustomChar96
	JMP        L_CustomChar13
L__CustomChar96:
	JMP        L_CustomChar14
L_CustomChar9:
;LR3.c,147 :: 		Lcd_Cmd(cmd);                      // F - 2
	PUSH       R3
	PUSH       R2
	LDS        R2, _cmd+0
	CALL       _Lcd_Cmd+0
	POP        R2
	POP        R3
;LR3.c,148 :: 		for (ch = 0; ch<=7; ch++)
	LDI        R27, 0
	STS        _ch+0, R27
L_CustomChar15:
	LDS        R17, _ch+0
	LDI        R16, 7
	CP         R16, R17
	BRSH       L__CustomChar97
	JMP        L_CustomChar16
L__CustomChar97:
;LR3.c,150 :: 		switch(F_1){
	JMP        L_CustomChar18
;LR3.c,151 :: 		case 1:
L_CustomChar20:
;LR3.c,153 :: 		Lcd_Chr_CP(character16[ch]);
	LDI        R17, #lo_addr(_character16+0)
	LDI        R18, hi_addr(_character16+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
;LR3.c,156 :: 		break;
	JMP        L_CustomChar19
;LR3.c,157 :: 		case 2:
L_CustomChar21:
;LR3.c,159 :: 		Lcd_Chr_CP(character24[ch]);
	LDI        R17, #lo_addr(_character24+0)
	LDI        R18, hi_addr(_character24+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
;LR3.c,162 :: 		break;
	JMP        L_CustomChar19
;LR3.c,163 :: 		case 3:
L_CustomChar22:
;LR3.c,165 :: 		Lcd_Chr_CP(character28[ch]);
	LDI        R17, #lo_addr(_character28+0)
	LDI        R18, hi_addr(_character28+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
;LR3.c,168 :: 		break;
	JMP        L_CustomChar19
;LR3.c,169 :: 		case 4:
L_CustomChar23:
;LR3.c,171 :: 		Lcd_Chr_CP(character30[ch]);
	LDI        R17, #lo_addr(_character30+0)
	LDI        R18, hi_addr(_character30+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
;LR3.c,174 :: 		break;
	JMP        L_CustomChar19
;LR3.c,175 :: 		default:
L_CustomChar24:
;LR3.c,177 :: 		Lcd_Chr_CP(character31[ch]);
	LDI        R17, #lo_addr(_character31+0)
	LDI        R18, hi_addr(_character31+0)
	LDS        R16, _ch+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _Lcd_Chr_CP+0
	POP        R2
	POP        R3
;LR3.c,180 :: 		}
	JMP        L_CustomChar19
L_CustomChar18:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar98
	LDI        R27, 1
	CP         R2, R27
L__CustomChar98:
	BRNE       L__CustomChar99
	JMP        L_CustomChar20
L__CustomChar99:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar100
	LDI        R27, 2
	CP         R2, R27
L__CustomChar100:
	BRNE       L__CustomChar101
	JMP        L_CustomChar21
L__CustomChar101:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar102
	LDI        R27, 3
	CP         R2, R27
L__CustomChar102:
	BRNE       L__CustomChar103
	JMP        L_CustomChar22
L__CustomChar103:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__CustomChar104
	LDI        R27, 4
	CP         R2, R27
L__CustomChar104:
	BRNE       L__CustomChar105
	JMP        L_CustomChar23
L__CustomChar105:
	JMP        L_CustomChar24
L_CustomChar19:
;LR3.c,148 :: 		for (ch = 0; ch<=7; ch++)
	LDS        R16, _ch+0
	SUBI       R16, 255
	STS        _ch+0, R16
;LR3.c,182 :: 		}
	JMP        L_CustomChar15
L_CustomChar16:
;LR3.c,184 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	PUSH       R3
	PUSH       R2
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,185 :: 		Lcd_Chr(1, j, a);
	LDS        R4, _a+0
	LDS        R3, _j+0
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
	POP        R2
	POP        R3
;LR3.c,187 :: 		F_1 -=5;
	MOVW       R16, R2
	SUBI       R16, 5
	SBCI       R17, 0
	MOVW       R2, R16
;LR3.c,113 :: 		for (j=1;F_1>0;j++) {
	LDS        R16, _j+0
	LDS        R17, _j+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _j+0, R16
	STS        _j+1, R17
;LR3.c,189 :: 		}
	JMP        L_CustomChar5
L_CustomChar6:
;LR3.c,193 :: 		}
L_end_CustomChar:
	POP        R4
	RET
; end of _CustomChar

_task4:

;LR3.c,195 :: 		void task4(){
;LR3.c,198 :: 		F = abs(2*xx[rand()%12]-768);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
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
	STS        _F+0, R16
	STS        _F+1, R17
;LR3.c,200 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,201 :: 		cmd = 64;
	LDI        R27, 64
	STS        _cmd+0, R27
	LDI        R27, 0
	STS        _cmd+1, R27
;LR3.c,205 :: 		CustomChar(F/16);
	LDI        R20, 16
	LDI        R21, 0
	LDS        R16, _F+0
	LDS        R17, _F+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	MOVW       R2, R16
	CALL       _CustomChar+0
;LR3.c,206 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,207 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	LDI        R27, 192
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,208 :: 		IntToStr(F, ch_p);
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R5, R27
	LDS        R2, _F+0
	LDS        R3, _F+1
	CALL       _IntToStr+0
;LR3.c,209 :: 		Lcd_Out_CP(ch_p );
	LDI        R27, #lo_addr(_ch_p+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_ch_p+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LR3.c,210 :: 		}
L_end_task4:
	POP        R5
	POP        R4
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

;LR3.c,212 :: 		void task5(){
;LR3.c,213 :: 		i = 0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;LR3.c,214 :: 		while(1)
L_task525:
;LR3.c,216 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,217 :: 		for (i = 0; i < 16; i++)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_task527:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 16
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__task5108
	JMP        L_task528
L__task5108:
;LR3.c,219 :: 		text1[i] = text[i+temp%29];
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
;LR3.c,217 :: 		for (i = 0; i < 16; i++)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;LR3.c,220 :: 		}
	JMP        L_task527
L_task528:
;LR3.c,221 :: 		Lcd_Out(1,1,text1);
	LDI        R27, #lo_addr(_text1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_text1+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,222 :: 		Delay_ms(400);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_task530:
	DEC        R16
	BRNE       L_task530
	DEC        R17
	BRNE       L_task530
	DEC        R18
	BRNE       L_task530
	NOP
;LR3.c,223 :: 		temp++;
	LDS        R16, _temp+0
	LDS        R17, _temp+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _temp+0, R16
	STS        _temp+1, R17
;LR3.c,224 :: 		if (temp == 22) temp = 0;
	CPI        R17, 0
	BRNE       L__task5109
	CPI        R16, 22
L__task5109:
	BREQ       L__task5110
	JMP        L_task532
L__task5110:
	LDI        R27, 0
	STS        _temp+0, R27
	STS        _temp+1, R27
L_task532:
;LR3.c,225 :: 		}
	JMP        L_task525
;LR3.c,226 :: 		}
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

;LR3.c,228 :: 		void task1_1(){
;LR3.c,229 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,231 :: 		Lcd_Out(1,2,txt1); //
	LDI        R27, #lo_addr(_txt1+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt1+0)
	MOV        R5, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,232 :: 		Lcd_Out(2,4,txt2); //
	LDI        R27, #lo_addr(_txt2+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt2+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,233 :: 		}
L_end_task1_1:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_1

_task1_2:

;LR3.c,234 :: 		void task1_2(){
;LR3.c,235 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,237 :: 		Lcd_Out(1,4,txt3); //
	LDI        R27, #lo_addr(_txt3+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt3+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,238 :: 		Lcd_Out(2,4,txt4); //
	LDI        R27, #lo_addr(_txt4+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt4+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,239 :: 		}
L_end_task1_2:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_2

_task1_3:

;LR3.c,240 :: 		void task1_3(){
;LR3.c,241 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,242 :: 		Lcd_Out(1,1,txt5); //
	LDI        R27, #lo_addr(_txt5+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt5+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,243 :: 		Lcd_Out(2,1,txt6); //
	LDI        R27, #lo_addr(_txt6+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt6+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,244 :: 		}
L_end_task1_3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_3

_task1_4:

;LR3.c,245 :: 		void task1_4(){
;LR3.c,246 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,248 :: 		Lcd_Out(1,1,txt7); //
	LDI        R27, #lo_addr(_txt7+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt7+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,249 :: 		Lcd_Out(2,4,txt8); //
	LDI        R27, #lo_addr(_txt8+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt8+0)
	MOV        R5, R27
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,250 :: 		}
L_end_task1_4:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_4

_task1_5:

;LR3.c,251 :: 		void task1_5(){
;LR3.c,252 :: 		Lcd_Cmd(_LCD_CLEAR); //
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,254 :: 		Lcd_Out(1,1,txt9); //
	LDI        R27, #lo_addr(_txt9+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt9+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,255 :: 		Lcd_Out(2,1,txt10); //
	LDI        R27, #lo_addr(_txt10+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt10+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,256 :: 		}
L_end_task1_5:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_5

_task1_6:

;LR3.c,257 :: 		void task1_6(){
;LR3.c,258 :: 		while(1)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
L_task1_633:
;LR3.c,260 :: 		Lcd_Cmd(_LCD_CLEAR); //
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,262 :: 		Lcd_Out(1,1,txt11); //
	LDI        R27, #lo_addr(_txt11+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt11+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,263 :: 		Lcd_Out(2,1,txt12); //
	LDI        R27, #lo_addr(_txt12+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt12+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,264 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_635:
	DEC        R16
	BRNE       L_task1_635
	DEC        R17
	BRNE       L_task1_635
	DEC        R18
	BRNE       L_task1_635
	NOP
	NOP
;LR3.c,266 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_637
;LR3.c,267 :: 		return;
	JMP        L_end_task1_6
L_task1_637:
;LR3.c,269 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,271 :: 		Lcd_Out(1,1,txt13); //
	LDI        R27, #lo_addr(_txt13+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt13+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LR3.c,272 :: 		Delay_ms(1000);
	LDI        R18, 51
	LDI        R17, 187
	LDI        R16, 224
L_task1_638:
	DEC        R16
	BRNE       L_task1_638
	DEC        R17
	BRNE       L_task1_638
	DEC        R18
	BRNE       L_task1_638
	NOP
	NOP
;LR3.c,274 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task1_640
;LR3.c,275 :: 		return;
	JMP        L_end_task1_6
L_task1_640:
;LR3.c,276 :: 		}
	JMP        L_task1_633
;LR3.c,277 :: 		}
L_end_task1_6:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _task1_6

_task1:

;LR3.c,279 :: 		void task1()
;LR3.c,281 :: 		while(1)
L_task141:
;LR3.c,283 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task143
;LR3.c,285 :: 		task1_1();
	CALL       _task1_1+0
;LR3.c,286 :: 		}
L_task143:
;LR3.c,287 :: 		while(PINB7_bit);
L_task144:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task145
	JMP        L_task144
L_task145:
;LR3.c,289 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task146
;LR3.c,291 :: 		task1_2();
	CALL       _task1_2+0
;LR3.c,292 :: 		}
L_task146:
;LR3.c,293 :: 		while(PINB6_bit);
L_task147:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task148
	JMP        L_task147
L_task148:
;LR3.c,295 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task149
;LR3.c,297 :: 		task1_3();
	CALL       _task1_3+0
;LR3.c,298 :: 		}
L_task149:
;LR3.c,299 :: 		while(PINB5_bit);
L_task150:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task151
	JMP        L_task150
L_task151:
;LR3.c,301 :: 		if(PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task152
;LR3.c,303 :: 		task1_4();
	CALL       _task1_4+0
;LR3.c,304 :: 		}
L_task152:
;LR3.c,305 :: 		while(PINB4_bit);
L_task153:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task154
	JMP        L_task153
L_task154:
;LR3.c,307 :: 		if(PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task155
;LR3.c,309 :: 		task1_5();
	CALL       _task1_5+0
;LR3.c,310 :: 		}
L_task155:
;LR3.c,311 :: 		while(PINB3_bit);
L_task156:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task157
	JMP        L_task156
L_task157:
;LR3.c,313 :: 		if(PINB2_bit)
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task158
;LR3.c,315 :: 		task1_6();
	CALL       _task1_6+0
;LR3.c,316 :: 		}
L_task158:
;LR3.c,317 :: 		while(PINB2_bit);
L_task159:
	IN         R27, PINB2_bit+0
	SBRS       R27, BitPos(PINB2_bit+0)
	JMP        L_task160
	JMP        L_task159
L_task160:
;LR3.c,319 :: 		if(PINB0_bit)
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task161
;LR3.c,321 :: 		return;
	JMP        L_end_task1
;LR3.c,322 :: 		}
L_task161:
;LR3.c,323 :: 		while(PINB0_bit);
L_task162:
	IN         R27, PINB0_bit+0
	SBRS       R27, BitPos(PINB0_bit+0)
	JMP        L_task163
	JMP        L_task162
L_task163:
;LR3.c,324 :: 		}
	JMP        L_task141
;LR3.c,325 :: 		}
L_end_task1:
	RET
; end of _task1

_task_picker:

;LR3.c,327 :: 		void task_picker()
;LR3.c,329 :: 		while(1)
L_task_picker64:
;LR3.c,331 :: 		if(PINB7_bit)
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker66
;LR3.c,333 :: 		task1();
	CALL       _task1+0
;LR3.c,334 :: 		}
L_task_picker66:
;LR3.c,335 :: 		while(PINB7_bit);
L_task_picker67:
	IN         R27, PINB7_bit+0
	SBRS       R27, BitPos(PINB7_bit+0)
	JMP        L_task_picker68
	JMP        L_task_picker67
L_task_picker68:
;LR3.c,337 :: 		if(PINB6_bit)
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker69
;LR3.c,339 :: 		task2();
	CALL       _task2+0
;LR3.c,340 :: 		}
L_task_picker69:
;LR3.c,341 :: 		while(PINB6_bit);
L_task_picker70:
	IN         R27, PINB6_bit+0
	SBRS       R27, BitPos(PINB6_bit+0)
	JMP        L_task_picker71
	JMP        L_task_picker70
L_task_picker71:
;LR3.c,343 :: 		if(PINB5_bit)
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker72
;LR3.c,345 :: 		task3();
	CALL       _task3+0
;LR3.c,346 :: 		}
L_task_picker72:
;LR3.c,347 :: 		while(PINB5_bit);
L_task_picker73:
	IN         R27, PINB5_bit+0
	SBRS       R27, BitPos(PINB5_bit+0)
	JMP        L_task_picker74
	JMP        L_task_picker73
L_task_picker74:
;LR3.c,348 :: 		if(PINB4_bit)
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task_picker75
;LR3.c,350 :: 		task4();
	CALL       _task4+0
;LR3.c,351 :: 		}
L_task_picker75:
;LR3.c,352 :: 		while(PINB4_bit);
L_task_picker76:
	IN         R27, PINB4_bit+0
	SBRS       R27, BitPos(PINB4_bit+0)
	JMP        L_task_picker77
	JMP        L_task_picker76
L_task_picker77:
;LR3.c,353 :: 		if(PINB3_bit)
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task_picker78
;LR3.c,355 :: 		task5();
	CALL       _task5+0
;LR3.c,356 :: 		}
L_task_picker78:
;LR3.c,357 :: 		while(PINB3_bit);
L_task_picker79:
	IN         R27, PINB3_bit+0
	SBRS       R27, BitPos(PINB3_bit+0)
	JMP        L_task_picker80
	JMP        L_task_picker79
L_task_picker80:
;LR3.c,358 :: 		}
	JMP        L_task_picker64
;LR3.c,359 :: 		}
L_end_task_picker:
	RET
; end of _task_picker

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LR3.c,361 :: 		void main() {
;LR3.c,362 :: 		DDRB = 0x00;
	PUSH       R2
	LDI        R27, 0
	OUT        DDRB+0, R27
;LR3.c,363 :: 		DDRC = 0xFF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;LR3.c,364 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LR3.c,366 :: 		Lcd_Init(); //
	CALL       _Lcd_Init+0
;LR3.c,367 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); //
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LR3.c,368 :: 		task_picker();
	CALL       _task_picker+0
;LR3.c,369 :: 		}
L_end_main:
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
