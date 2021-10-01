
_main:

;CompassDemo.c,27 :: 		void main(){
;CompassDemo.c,28 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;CompassDemo.c,29 :: 		CMCON = 7;
	MOVLW      7
	MOVWF      CMCON+0
;CompassDemo.c,35 :: 		TRISE = 0;
	CLRF       TRISE+0
;CompassDemo.c,36 :: 		TRISE1_Bit = 0;
	BCF        TRISE1_bit+0, BitPos(TRISE1_bit+0)
;CompassDemo.c,37 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;CompassDemo.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CompassDemo.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CompassDemo.c,41 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CompassDemo.c,42 :: 		Lcd_Out(2,1,txt2);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CompassDemo.c,43 :: 		Delay_ms(5000);
	MOVLW      127
	MOVWF      R11+0
	MOVLW      212
	MOVWF      R12+0
	MOVLW      49
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;CompassDemo.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CompassDemo.c,45 :: 		Lcd_Out(1,1,txt3);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CompassDemo.c,46 :: 		Lcd_Out(2,1,txt4);                 // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CompassDemo.c,48 :: 		I2C1_Init(100000);         // initialize I2C communication
	MOVLW      50
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;CompassDemo.c,49 :: 		I2C1_Start();              // issue I2C start signal
	CALL       _I2C1_Start+0
;CompassDemo.c,50 :: 		I2C1_Rd(0u);             // send byte via I2C  (device address + W)
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
;CompassDemo.c,51 :: 		I2C1_Wr(2);                // send byte (address of EEPROM location)
	MOVLW      2
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;CompassDemo.c,52 :: 		I2C1_Wr(0xAA);             // send data (data to be written)
	MOVLW      170
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;CompassDemo.c,53 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL       _I2C1_Stop+0
;CompassDemo.c,56 :: 		while(1) {                         // Endless loop
L_main1:
;CompassDemo.c,57 :: 		}
	GOTO       L_main1
;CompassDemo.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
