#line 1 "E:/GitHub/ksuthars.github.io/PIC/Labs/Lab7/LCDInterface.c"

sbit LCD_RS at RE2_bit;
sbit LCD_RW at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_RW_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


char txt1[] = "Welcome to";
char txt2[] = "Project 7";
char txt3[] = "LCD Interface";
char txt4[] = "example";

char i;

void Move_Delay() {
 Delay_ms(500);
}

void main(){
 ADCON1 = 7;
 CMCON = 7;





 TRISE = 0;
 TRISE1_Bit = 0;
 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,txt1);


 Lcd_Out(2,5,txt2);
 Delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,6,txt3);
 Lcd_Out(2,6,txt4);

 Delay_ms(2000);


 for(i=0; i<4; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }

 while(1) {
 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 Move_Delay();
 }

 for(i=0; i<8; i++) {
 Lcd_Cmd(_LCD_SHIFT_RIGHT);
 Move_Delay();
 }
 }
}
