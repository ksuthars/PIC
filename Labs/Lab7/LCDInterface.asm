
_Move_Delay:

;LCDInterface.c,26 :: 		void Move_Delay() {                  // Function used for text moving
;LCDInterface.c,27 :: 		Delay_ms(500);                     // You can change the moving speed here
	MOVLW      7
	MOVWF      R11+0
	MOVLW      88
	MOVWF      R12+0
	MOVLW      89
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;LCDInterface.c,28 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;LCDInterface.c,30 :: 		void main(){
;LCDInterface.c,31 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;LCDInterface.c,32 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;LCDInterface.c,38 :: 		TRISE = 0;
	CLRF       TRISE+0
;LCDInterface.c,39 :: 		TRISE1_Bit = 0;
	BCF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
;LCDInterface.c,40 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LCDInterface.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,44 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDInterface.c,47 :: 		Lcd_Out(2,5,txt2);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDInterface.c,48 :: 		Delay_ms(2000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;LCDInterface.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,51 :: 		Lcd_Out(1,6,txt3);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDInterface.c,52 :: 		Lcd_Out(2,6,txt4);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDInterface.c,54 :: 		Delay_ms(2000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LCDInterface.c,57 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	CLRF       _i+0
L_main3:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;LCDInterface.c,58 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,59 :: 		Move_Delay();
	CALL       _Move_Delay+0
;LCDInterface.c,57 :: 		for(i=0; i<4; i++) {               // Move text to the right 4 times
	INCF       _i+0, 1
;LCDInterface.c,60 :: 		}
	GOTO       L_main3
L_main4:
;LCDInterface.c,62 :: 		while(1) {                         // Endless loop
L_main6:
;LCDInterface.c,63 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	CLRF       _i+0
L_main8:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;LCDInterface.c,64 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,65 :: 		Move_Delay();
	CALL       _Move_Delay+0
;LCDInterface.c,63 :: 		for(i=0; i<8; i++) {             // Move text to the left 7 times
	INCF       _i+0, 1
;LCDInterface.c,66 :: 		}
	GOTO       L_main8
L_main9:
;LCDInterface.c,68 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	CLRF       _i+0
L_main11:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;LCDInterface.c,69 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDInterface.c,70 :: 		Move_Delay();
	CALL       _Move_Delay+0
;LCDInterface.c,68 :: 		for(i=0; i<8; i++) {             // Move text to the right 7 times
	INCF       _i+0, 1
;LCDInterface.c,71 :: 		}
	GOTO       L_main11
L_main12:
;LCDInterface.c,72 :: 		}
	GOTO       L_main6
;LCDInterface.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
