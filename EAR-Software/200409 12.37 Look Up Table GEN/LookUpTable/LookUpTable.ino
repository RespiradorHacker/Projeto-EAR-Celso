/*
 * LookUpTable Generator
 * Firmware Design by Celso Monteiro in April 9, 2020 
 *  Compiled by Arduino 1.8.5 for Arduino Pro Mini
 *  FlexLed Serial Dump @57600 bps
 *  
 *  Ramping_Speed values ranged from 6 (8 BPM - 200 ml TV) to 125 (30 BPM - 800 ml TV)
 */

// type definition
#define U8 unsigned char // define tipo unsigned char
#define U16 unsigned int
#define U32 unsigned long int

#define Speed_Start 6 // X1
#define Speed_End 125 // X2
#define PWM_Start 20  // Y1
#define PWM_End 90    // Y2

U8 Speed;
float A;
float B;
float PWM;

U8 DeltaX;
U8 DeltaY;
U16 Int_PWM;

// =====================
// =====================
//    INITIALIZATION
// =====================
// =====================

void setup()
{
  delay(100);
  Serial.begin(57600); // initialize serial interface for user interface - Serial Arduino Padrao
  Serial.println();
  Serial.println();

  // calculate linear relationship
  DeltaY=PWM_End-PWM_Start;
  DeltaX=Speed_End-Speed_Start;

  A=DeltaY;
  A=A/DeltaX;
  
  B=PWM_End-(A*Speed_End);

  Serial.print(" // LookUpTable GEN 1.0 - X Axis: Desired Speed, Y Axis: PWM -");

  Serial.print("  X1:");
  Serial.print(Speed_Start, DEC);  

  Serial.print("  X2:");
  Serial.print(Speed_End, DEC);  

  Serial.print("  Y1:");
  Serial.print(PWM_Start, DEC);  

  Serial.print("  Y2:");
  Serial.print(PWM_End, DEC);  

  Serial.print("  A:");
  Serial.print(A, 4);  

  Serial.print("  B:");
  Serial.print(B, 4);  
  Serial.println();

  Serial.print("const unsigned char PWM_Table [256] = {");
  Serial.println();
  
}

// =====================
// =====================
//       MAIN LOOP
// =====================
// =====================

void loop()
{
  for (Speed=0;Speed<255;Speed++)
  {
  PWM=A*Speed+B; 
  Serial.print(" ");
  Serial.print(PWM, 0);
  Serial.print(" , // ");
  Serial.print(Speed, DEC);
  Serial.println();
  delay (10);
  }

  PWM=A*Speed+B; 
  Serial.print(" ");
  Serial.print(PWM, 0);
  Serial.print("  // ");
  Serial.print(Speed, DEC);
  Serial.println();
  Serial.print(" };");  
  Serial.println();

for (;;);
} // end loop


