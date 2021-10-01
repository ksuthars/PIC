#line 1 "E:/GitHub/ksuthars.github.io/PIC/Labs/Lab101/CompassDemo.c"

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
char txt2[] = "Compass demo";
char txt3[] = "Testing";
char txt4[] = "I2C Readings";

char i;


void main(){
 ADCON1 = 7;
 CMCON = 7;





 TRISE = 0;
 TRISE1_Bit = 0;
 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,txt1);
 Lcd_Out(2,1,txt2);
 Delay_ms(5000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt3);
 Lcd_Out(2,1,txt4);

 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Rd(0u);
 I2C1_Wr(2);
 I2C1_Wr(0xAA);
 I2C1_Stop();


 while(1) {
 }
}
