// LCD module connections
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
// End LCD module connections

char txt1[] = "Welcome to";
char txt2[] = "Compass demo";
char txt3[] = "Testing";
char txt4[] = "I2C Readings";

char i;                              // Loop variable


void main(){
  ADCON1 = 7;
  CMCON = 7;
//  ANSEL  = 0;                        // Configure AN pins as digital I/O
//  ANSELH = 0;
//  C1ON_bit = 0;                      // Disable comparators
//  C2ON_bit = 0;

  TRISE = 0;
  TRISE1_Bit = 0;
  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  Lcd_Out(1,1,txt1);                 // Write text in first row
  Lcd_Out(2,1,txt2);                 // Write text in second row
  Delay_ms(5000);
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Out(1,1,txt3);                 // Write text in first row
  Lcd_Out(2,1,txt4);                 // Write text in second row

  I2C1_Init(100000);         // initialize I2C communication
  I2C1_Start();              // issue I2C start signal
  I2C1_Rd(0u);             // send byte via I2C  (device address + W)
  I2C1_Wr(2);                // send byte (address of EEPROM location)
  I2C1_Wr(0xAA);             // send data (data to be written)
  I2C1_Stop();               // issue I2C stop signal


  while(1) {                         // Endless loop
  }
}