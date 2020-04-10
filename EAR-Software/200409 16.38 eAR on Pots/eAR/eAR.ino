/*
 * =====================================
 *              eAR Project
 *     Emergency Automatic Respirator
 *    Open Hardware Open Source Project
 * =====================================
 * Firmware Design started by Celso Monteiro in Apri 2, 2020 
 * Project target is to provide a simple ventilator system to help human breathing
 * 
 * 
 *  Compiled by Arduino 1.8.5 for Arduino Pro Mini
 *  FlexLed Serial Dump @57600 bps
 *  
 *  DISCLAIMER: we will NOT take any responsability on devices built using partial or total information from this project. 
 *  Any device used for life support and medical applications must meet all local requirements 
 *  and they must be homologated by local regulatory agencies in ANY case.

 ########################
    Revision History
 ########################

#R200402EAR01 - inverted pots or not ar now SW defined - depending on the pot travel
  - Default and recommended = Inverted pot

#R200403EAR01 - superloop timing is now interrupt driver - implemented by Flavio Alves based on original code by Jesse Tane

#R200403EAR02 - changes interrupt timing from 100ms to 10ms

#R200405EAR01 - adds motor mosfet drive, it IS now the standard drive, relay drive is too limited
  - adds PWM on High Side of Full bridge Motor Driver
  - problem with PWM, timer interrrupt interferes with PWM
    - Timer INT interferes with D9 adn D10
    - I was unable to make it work on D9 D10
    - D9 and D10 set to GPIO
    - D5 and D6 used for PWM on high side, analogWrite worked!
    - HARDWARE CHANGED on RELAY MODULE: SWAPPED LSB AND HSA pins on Arduino
    - FIRMWARE CHANGED on CPU MODULE: SWAPPED LSB AND HSA pins on Arduino
  - Relay driver treatment is the same, uses only Low Side lines LSA and LSB, unchanged
  - Mosfet Low Side Current limits now reduces Motor Peak Current
    - Ipk now limited to less than 5.5 Amps @99% PWM 12V with Capacitor Bank
    
#R200406EAR01 - adds motor absolute position based on car tank level sensor
#define ArmPosSns A5 // entrada leitura sensor posicao Motor
U16 ArmPosSensor;  // position sensor reading

#R200408EAR01 - Added pressure sensor on SW

#R200408EAR02 - Added GUI to Project
  - FlexLed changed output format for GUI interface
  - 10 Hz update rate, pre-processing is necessary due to Dumb GUI
  - Motor_phase replaced by Motor_Status
  - created new vars for setpoints and results

#R200408EAR03 - provides Fixed setpoints for frame generation only

#R200408EAR04 - HW change - swapped Arduino A4 and A5 functions due to an error on PCB layout V0 (single sided boards)
  - change requested by Diego Padilha 

#R200408EAR05 - Implements BPM as f(pot)

#R200408EAR06 - Implements generic error strategy
  - ErrorCount is incremented on each error found
  - ErrorID is programmed on specific error found

#R200408EAR07 - Implements TidalVolumeSet as f(pot)

#R200408EAR08 - Implements Final_Arm_Position as f(Course, TidalVolumeSet)
  - From now on, the final arm course is based on Tidal Volume Set

#R200409EAR01 - Processes breath timing based on stablished BPM

#R200409EAR02 - Calculates Ramping_Speed based on Processes breath timing 
 - TR is from 51 to 235 (30-8 BPM) assuming 150ms of Plateau_Hold_Time
 - Ramping_Speed=(TidalVolumeSet*8)/Ramping_Insp_Time; 
    - 8 is a mult constant used to increase resolution
 - Ramping_Speed values ranged from 6 (8 BPM - 200 ml TV) to 125 (30 BPM - 800 ml TV)
 
#R200409EAR03 - Calculates PWM based on Ramping_Speed  

#R200409EAR04 - Implements Task Time monitoring through Red_Led signal
- At this moment:
  - Common is taking 2.9ms
  - T0 is taking 0.005 ms
  - T1 is taking 3.8 ms
  - T2 is taking 0.080 ms
  - T3 is taking 0.006 ms
  - T4 is taking 0.006 to 0.035 ms
  - T5 is taking 0.005 ms
  - T6 is taking 0.800 ms
  - T7 is taking 0.350 to 0.450 ms
  - T8 is taking 0.800 ms
  - T9 is taking 1.2 ms
  
- T1 is reading pots, too critical, so the amazing (!) task of reading pots was divided on T1 and T2.
- This is the current situation:
  - Common is taking 2.9ms
  - T0 is taking 0.005 ms
  - T1 is taking 1.9 ms
  - T2 is taking 2 ms
  - T3 is taking 0.006 ms
  - T4 is taking 0.006 to 0.035 ms
  - T5 is taking 0.005 ms
  - T6 is taking 0.800 ms
  - T7 is taking 0.350 to 0.450 ms
  - T8 is taking 0.800 ms
  - T9 is taking 1.2 ms

- Results: Today WC is 50% ocupation

Target: 
- Common is about to grow significantly, so it can go up to 6ms (WC)
  - Tasks shoulgd be limited to 4 ms (WC)

#R200409EAR04 Implements operation with calculated timing and Ramps
- motor state machine moved out os scheduler, as planned
- Timer_Motor updated to 16-bit

TO BE Implemented:
- external WDT


 */

// type definition
#define U8 unsigned char // define tipo unsigned char
#define U16 unsigned int
#define U32 unsigned long int

#include <SPI.h>
#include "TimerOne.h"

// Red_Led is used for process/task monitoring
#define Debug_Task_Period TRUE
#define Task_Period_Set 2 // Defines task under period measurement (0-9) 
#if (Task_Period_Set>20)
  #define Task_Common TRUE  //
#endif

#define Inverted_Pots 1 // #R200402EAR01 define que pots excursionam de +5V a zero, sentido CW
#define Offset_Pots 511

#define Ticks 10 // define o tempo entre cada execucao de loop, deve ser tunado para refletir degradacao do periodo em funcao da execucaoo das tasks

#define STD_PWM_Duty_Up 30 // percentage used for testing purposes
#define STD_PWM_Duty_Down 50 // percentage used for testing purposes

#define EOC_UP 226    // #R200406EAR01 defines End Of Course Ambu Uncompressed
#define EOC_Down 300  // #R200406EAR01 desfines End of Course Ambu Smashed

#define BPM_Min 8   // #R200408EAR05 - Implements BPM as f(pot)
#define BPM_Max 30  // #R200408EAR05 - Implements BPM as f(pot)

#define TVS_Min 200 // #R200408EAR07 - Implements TidalVolumeSet as f(pot)
#define TVS_Max 800 // #R200408EAR07 - Implements TidalVolumeSet as f(pot)

// Defines Serial Dump on FlexLed
//
#define FlexLed_Debug TRUE  // focus on specific items for debugging purpose
#ifdef FlexLed_Debug
  // focus on specific items for debugging purpose
  #define sDump_BC TRUE   // Breath Counts
  #define sDump_MS TRUE   // Motor Status
  #define sDump_Pots TRUE // All Potentiometers
  #define sDump_IM TRUE   // Motor Current (I)
  #define sDump_AS TRUE   // Arm Position Sensor
  #define sDump_EC TRUE   // Error Count and ID
  #define sDump_PW TRUE   // PWM Duty
  // #define sDump_PS TRUE   // Pressure Sensor
  // #define sDump_IOs TRUE  // Inputs and Outputs
  #define sDump_PL TRUE   // Plateau Pressure SET
  #define sDump_PM TRUE   // Pressure Max Limit SET
  #define sDump_AP TRUE   // Assisted Pressure Threshold SET
  #define sDump_TS TRUE   // Tidal Volume SET
  #define sDump_BM TRUE   // BPM SET
  #define sDump_IE TRUE   // IE SET
  #define sDump_TB TRUE   // Total BPM Time
  #define sDump_TI TRUE   // Total Inspiration Time
  #define sDump_TE TRUE   // Total Expiration Time
  #define sDump_TR TRUE   // Ramping Inspiration Time
  #define sDump_RS TRUE   // Ramping_Speed
  #define sDump_PR TRUE   // PWM_Ramp
  #define sDump_TV TRUE   // Resulting Tidal Volume
  #define sDump_PX TRUE   // Resulting Pressure
#else
  // Release Version FlexLed
  #define sDump_BC TRUE   // Breath Counts
  #define sDump_MS TRUE   // Motor Status
  #define sDump_Pots TRUE // All Potentiometers
  #define sDump_IM TRUE   // Motor Current (I)
  #define sDump_AS TRUE   // Arm Position Sensor
  #define sDump_EC TRUE   // Error Count and ID
  #define sDump_PW TRUE   // PWM Duty
  #define sDump_PS TRUE   // Pressure Sensor
  #define sDump_IOs TRUE  // Inputs and Outputs
  #define sDump_PL TRUE   // Plateau Pressure SET
  #define sDump_PM TRUE   // Pressure Max Limit SET
  #define sDump_AP TRUE   // Assisted Pressure Threshold SET
  #define sDump_TS TRUE   // Tidal Volume SET
  #define sDump_BM TRUE   // BPM SET
  #define sDump_IE TRUE   // IE SET
  // #define sDump_TB TRUE   // Total BPM Time
  // #define sDump_TI TRUE   // Total Inspiration Time
  // #define sDump_TE TRUE   // Total Expiration Time
  // #define sDump_TR TRUE   // Ramping Inspiration Time
  // #define sDump_RS TRUE   // Ramping_Speed
  // #define sDump_PR TRUE   // PWM_Ramp
  #define sDump_TV TRUE   // Resulting Tidal Volume
  #define sDump_PX TRUE   // Resulting Pressure
#endif


// ==================================
// definicao das entradas do HARDWARE
// ==================================
#define I_Shunt A7 // entrada leitura corrente shunt
#define Pot1 A0    // pots
#define Pot2 A1    //
#define Pot3 A2    //
#define Pot4 A3    //
#define Px_Sns A6 // #R200408EAR01 - Added pressure sensor on SW
// #R200408EAR04 - HW change - swapped Arduino A4 and A5 functions due to an error on PCB layout V0 (single sided boards)
#define ArmPosSns A4 // #R200406EAR01 entrada leitura sensor posicao Motor




// leituras das entradas, ja em formato final
U16 I_Read;
U16 Pos_Pot1; // Passar para array?
U16 Pos_Pot2;
U16 Pos_Pot3;
U16 Pos_Pot4;
U16 Px_Sensor; // #R200408EAR01 - Added pressure sensor on SW

// Assignment of Pots
#define Pot_Tidal Pos_Pot1
#define Pot_BPM Pos_Pot2

U16 ArmPosSensor; // #R200406EAR01 Arm Position Sensor

// ===================================
// definicao dos saidas de acionamento
// ===================================

#define BEEP 4           // BIP
#define Latch_Inputs 3   // IO baseado em SPI
#define Latch_Outputs 10 // IO baseado em SPI

#define LSA 8            // Low Side A Bridge !
#define LSB 9            // Low Side B Bridge !
#define HSA 5 // #R200405EAR01
#define HSB 6 //

#define Red_Led 7 // multipurpose red led 


// VARS
// ====
byte InputsExp[4];
byte OutputsExp[4];
#define SPI_Loopback_Mode 1
U8 SPI_Error_Count;

U8 Dummy;
U16 Dummy16;
U8 Dummy_Count;
U8 cnt;
U8 Seq_Tasks; // Controla Task Scheduler Vagaba

U16 Timer_Motor;

// Maquina de estados rudimentar para controle de motor
U8 Motor_Status;
#define M_CCW_Stop 0
#define M_CW_Start 1
#define M_CW_Stable 2
#define M_CW_Ending 3
#define M_CW_Stop 4
#define M_CCW_Start 5
#define M_CCW_Stable 6
#define M_CCW_Ending 7

U8 Motor_Spin;  // #R200406EAR01 - adds motor absolute position based on car tank level sensor
#define M_NoSpin 0
#define M_Spin_CW 1
#define M_Spin_CCW 2
// U16 ArmSensorFailure; // // #R200406EAR01 - counts ARM Sensor failures

U16 Motor_Current;
U16 Motor_Peak_Current;

U32 Breath_Cycles;

U16 HSA_Duty; // #R200405EAR01
U16 HSB_Duty; // #R200405EAR01
U16 PWM_Duty; // #R200405EAR01 

U16 PX_Sensor;

// ==========================
//  KEY APP VARS - setpoints
// ==========================
U8 PlateauPressure;    // PL normally around 35, upto 70 in exceptional cases
U8 PressureMaxLimit;    // PM 15-40 range   
U8 AssistedPressureThreshold; // AP 0-50 range TBD
U16 TidalVolumeSet;            // TV around 250-800 ml range
U8 BPM;       // BM 8-30 BPM
U8 IE_Ratio;      // IE 1-4 1:1 a 1:4

// Intermediate Results
U16 Final_Arm_Position; //#R200408EAR08 - Implements Final_Arm_Position as f(Course, TidalVolumeSet)
U16 Total_BPM_Time;  // *10ms Total Time of breathing cycle #R200409EAR01
U16 Total_Insp_Time;  // *10ms Total Inspiration Time #R200409EAR01
U16 Total_Exp_Time; // *10ms Total Expiration Time #R200409EAR01
U16 Plateau_Hold_Time;  // *10ms Hold Time after ramping pressure before expiration #R200409EAR01

U16 Ramping_Insp_Time;  // *10ms ramping pressure time before Plateau #R200409EAR01
U16 Ramping_Speed;  // Tidal Volume/Ramping_Insp_Time - before Plateau #R200409EAR01
U8 PWM_Ramp; // #R200409EAR03 - Calculates PWM based on Ramping_Speed  


// ========================
//  KEY APP VARS - Results
// ========================

U16 TidalVolume;     // TV around 250-800 ml range
U8 MeasuredPressure;    // PX 0-100 cm h20

U16 InstantTidalVolume; // Arm position sensor translated into displacement volume

// Auxiliary VARS
U8 Last_Valid_BPM;
U16 Last_Valid_TVS;



// =======================
//  E R R O R   C O D E S
// =======================
// #R200408EAR06 - Implements generic error strategy
U16 ErrorCount; // Generic Error Counter
U8 ErrorID;   // Generic Error ID
#define NoErr 0x00
#define ErrArmSensor 0x01
#define ErrBPM 0x02
#define ErrTVS_Pot 0x03

#include "PWM_LookUpTable.c"

// =====================
//   FUNCOES UTILIZADAS
// =====================
void Dump_HexChar(U8 HexChar)
{
  if (HexChar < 0x10)
    Serial.print("0");
  Serial.print(HexChar, HEX);
}

// #R190917CSB01 - 8 samples average result - Implementado calculo de medias de 8 leituras
int Average_Read(byte Input_CH)
{
  long Sum_Readings;
  byte samples;
#define num_samples 8

  Sum_Readings = 0;
  for (samples = 0; samples < num_samples; samples++)
  {
    Sum_Readings = Sum_Readings + analogRead(Input_CH);
  }
  Sum_Readings = (Sum_Readings + (num_samples / 2)) / num_samples;
  return (Sum_Readings & 0xFFFF);
}

void Beep_ON(void)
{
  digitalWrite(BEEP, HIGH);
}

void Beep_OFF(void)
{
  digitalWrite(BEEP, LOW);
}

void Set_LSA(void)
{
  digitalWrite(LSA, HIGH);
}

void Set_LSB(void)
{
  digitalWrite(LSB, HIGH);
}

void Reset_LSA(void)
{
  digitalWrite(LSA, LOW);
}

void Reset_LSB(void)
{
  digitalWrite(LSB, LOW);
}

void Reset_HSA(void)
{
  HSA_Duty=0;
  analogWrite(HSA,HSA_Duty);
}

void Reset_HSB(void)
{
  HSB_Duty=0;
  analogWrite(HSB,HSB_Duty);
}

void Reset_OUTs(void)
{
  Reset_LSA();
  Reset_LSB();
  // #R200405EAR01 adds PWM on High Side of Full bridge Motor Driver
  PWM_Duty=0;
  Reset_HSA();
  Reset_HSB();
}

/*
// #R200405EAR01 adds PWM on High Side of Full bridge Motor Driver
void Set_PWM_HSA(void)
{
  Reset_HSB();
  analogWrite(HSA,HSA_Duty);  
}


// #R200405EAR01 adds PWM on High Side of Full bridge Motor Driver
void Set_PWM_HSB(void)
{
  Reset_HSA();
  analogWrite(HSA,HSB_Duty);  
}
*/

void Motor_CW(byte Duty)
{
  Reset_LSA();
  Reset_HSB();
  Set_LSB();
  HSA_Duty=Duty;
  analogWrite(HSA,HSA_Duty); // #R200405EAR01 
  //Timer1.setPwmDuty(HSA,HSA_Duty); // #R200405EAR01 
  Motor_Spin=M_Spin_CW ;  // #R200406EAR01 
}

void Motor_CCW(byte Duty)
{
  Reset_LSB();
  Reset_HSA();
  Set_LSA();
  HSB_Duty=Duty;
  analogWrite(HSB,HSB_Duty); // #R200405EAR01 
  //Timer1.setPwmDuty(HSB,HSB_Duty); // #R200405EAR01 
  Motor_Spin=M_Spin_CCW ;  // #R200406EAR01 

}

void Motor_Stop(void)
{
  Reset_OUTs(); // #R200405EAR01 adds PWM on High Side of Full bridge Motor Driver
  Motor_Spin=M_NoSpin ;  // #R200406EAR01 
}

void IncErrorCount(void)
{
if (ErrorCount!=0xFFFF) ErrorCount++;  
}

// =====================
// =====================
//    INITIALIZATION
// =====================
// =====================

void setup()
{
  pinMode(LSA, OUTPUT);
  pinMode(LSB, OUTPUT);
  pinMode(BEEP, OUTPUT);
  pinMode(Latch_Inputs, OUTPUT);
  pinMode(Latch_Outputs, OUTPUT);
  pinMode (HSA, OUTPUT);  // #R200405EAR01 - adds motor mosfet drive
  pinMode (HSB, OUTPUT);  // #R200405EAR01 - adds motor mosfet drive
  pinMode (Red_Led, OUTPUT);  // multipurpose led output
  
  // Timer1.pwm(HSA, 0, 65535); // #R200405EAR01 
  // Timer1.pwm(HSB, 0, 65535); // #R200405EAR01 
  
  Reset_OUTs();

  // start the SPI library:
  SPI.begin();

  Beep_ON();
  delay(100);
  Serial.begin(57600); // initialize serial interface for user interface - Serial Arduino Padrao
  Serial.println();
  Serial.println();
  Serial.println(F("======================"));
  Serial.println(F(" e-AR HW v1 SW v00.00 "));
  Serial.println(F("======================"));

  // set the data rate for the SoftwareSerial port - Serial FlexLed
  // Serial.begin(57600);

  Motor_Status = M_CCW_Stop; 
  Motor_Stop(); // #R200405EAR01 - adds motor mosfet drive
  
  Timer_Motor = 100; // Start em 1s
  Beep_OFF();

  Last_Valid_TVS=TVS_Min;
  Last_Valid_BPM=BPM_Min;
 
  // #R200403EAR02 changes interrupt timing from 100ms to 10ms
  Timer1.initialize(10000); // set a timer of length 10000 microseconds 10msec - or 100Hz ferquency
  // Timer1.initialize(100000); // set a timer of length 100000 microseconds (or 0.1 sec - or 10Hz => the led will blink 5 times, 5 cycles of on-and-off, per second)
  Timer1.attachInterrupt( controller ); // attach the service routine here
}

// =====================
// =====================
//       MAIN LOOP
// =====================
// =====================

void loop()
{
  
} // end loop

void controller()
{
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
#ifdef Task_Common
    digitalWrite(Red_Led, HIGH);
#endif
 
  // Update SPI based slow IOs 
  // Reads inputs on 74HC165 shift registers 
  // duplicated to double pulse lengths
  digitalWrite(Latch_Inputs, LOW);  // when HC165 LI is low level inputs are read
  digitalWrite(Latch_Inputs, LOW);  // 
  digitalWrite(Latch_Inputs, HIGH); // HC165 in LI allows shift register op
  digitalWrite(Latch_Inputs, HIGH); // 

  // SPI.beginTransaction();
  // As entradas tem que ser complementadas porque em GND => entrada ativa
  // Inputs are complemented because they're active when grounded
  InputsExp[0] = ((SPI.transfer(OutputsExp[0]) ^ 0xFF));
  // SPI.endTransaction();

  // depois do procedimento SPI atualizar os latches das saídas
  // after SPI data shifting, update HC595 output latches
  // Dupliquei para dar mais tempo - duplicated to double pulse lengths
  digitalWrite(Latch_Outputs, HIGH);
  digitalWrite(Latch_Outputs, HIGH);
  digitalWrite(Latch_Outputs, LOW);
  digitalWrite(Latch_Outputs, LOW);

  // Trecho executado a cada 10ms
  // faz leitura da corrente do motor sempre
  I_Read = (Average_Read(I_Shunt) + 1) / 2;

  Motor_Current = I_Read * 2;
  if (Motor_Peak_Current < Motor_Current)
  {
    Motor_Peak_Current = Motor_Current;
  }

  // #R200408EAR01 - Added pressure sensor on SW
  Px_Sensor=(Average_Read(Px_Sns) + 1) / 2;
  MeasuredPressure=Px_Sensor/5; 
  

  // #R200406EAR01 - adds motor absolute position based on car tank level sensor
  ArmPosSensor = (Average_Read(ArmPosSns) + 1) / 2;

  // FIXED SETPOINTS
  // ===============
  // Remove as implementation goes on
  // #R200408EAR03 - provide Fixed setpoints for frame generation only 
  PlateauPressure=35;    // PL normally around 35, upto 70 in exceptional cases
  Plateau_Hold_Time=15;  // *10ms 150ms
  PressureMaxLimit=40;    // PM 15-40 range   
  AssistedPressureThreshold=15; // AP 0-50 range TBD
  // TidalVolumeSet=350;            // TV around 250-800 ml range
  // BPM=12;       // BM 8-30 BPM
  IE_Ratio=2;      // IE 1-4 1:1 a 1:4


  // Controls Motor STOP
  // ===================
  switch (Motor_Spin)
    {
    case M_NoSpin:
      break;
      
    case M_Spin_CW:
      // if (ArmPosSensor >= EOC_Down) Motor_Stop();
      if (ArmPosSensor >= Final_Arm_Position) Motor_Stop();
      else if (ArmPosSensor < EOC_UP-50)
        {
        // Sensor Failure
        // ArmSensorFailure++;
        IncErrorCount();
        ErrorID=ErrArmSensor;
        }
      break;
      
    case M_Spin_CCW:
      if (ArmPosSensor <= EOC_UP) Motor_Stop();
      else if (ArmPosSensor < (EOC_UP-50))
        {
        // Sensor Failure
        // ArmSensorFailure++;
        IncErrorCount();
        ErrorID=ErrArmSensor;
        }
      break;
      
    default:
      break;
    }
    

    // trata o motor - provavelmente será fora deste scheduler
    // 
    switch (Motor_Status)
    {
    case M_CCW_Stop:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Timer_Motor foi zerado agora, mudanca de fase
          Breath_Cycles++; // incrementa contador de ciclos

          // RESET CYCLE BASED VARS
          //=======================
          
          // Reset Motor Current Peak Hold
          // We can now check peak current at each cycle
          Motor_Peak_Current=0;

          // Reset Tidal Volume
          TidalVolume=0;
          
          Motor_Status = M_CW_Ending; // normal seria esperar

          
          // #R200409EAR04 Implements operation with calculated timing and Ramps
          Timer_Motor = Ramping_Insp_Time; // programa timer 
          // Timer_Motor = 200; // 2 segundos fixo, fazer f(pots)
          Dummy16=(U16)PWM_Ramp*255;
          PWM_Duty=(Dummy16/100); // PWM_Duty 
          //PWM_Duty=STD_PWM_Duty_Down*255/100; // PWM_Duty is constant 4 debug only
          Motor_CW(PWM_Duty);
          
        }
      }
      else
      {
        Motor_Stop();
      }
      break;

    case M_CW_Start:
      break;

    case M_CW_Stable:
      break;

    case M_CW_Ending:
      if (Timer_Motor)
        {
        Timer_Motor--;
        if (!Timer_Motor)
          {
          // Timer_Motor foi zerado agora, mudanca de fase
          Motor_Status = M_CW_Stop; //
          Motor_Stop();
          Timer_Motor = Plateau_Hold_Time;  //
          }
      }
      else
      {
      Motor_CW(PWM_Duty);
      }
      break;

    case M_CW_Stop:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Now we start motor return
          Motor_Status = M_CCW_Ending; //
          PWM_Duty=STD_PWM_Duty_Up*255/100; // PWM_Duty on return is constant
          Motor_CCW(PWM_Duty);
          Timer_Motor = Total_Exp_Time; // Sets Time for expirantion period as calculated
        }
      }
      else
      {
        Motor_Stop();
      }

      break;

    case M_CCW_Ending:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Timer_Motor foi zerado agora, mudanÃ§a de fase
          Motor_Status = M_CCW_Stop; //
          Motor_Stop();
          Timer_Motor = 1; // começa idediatamente novo ciclo, o motor já deve estar parado
        }
      }
      else
      {
      Motor_CCW(PWM_Duty);
      }

      break;

    default:
      break;
    } // switch




#ifdef Task_Common
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    digitalWrite(Red_Led, LOW);
#endif
  

  // Task Scheduler Va.. Simple Task scheduler
  // One task each 10ms, 10 Tasks, reetruning to same task takes 100ms
  
  switch (Seq_Tasks)
  {
  case 0:
    // reservaded for system check

    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif
    
    break;

  case 1:

    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

    // read pots at 10Hz rate
    // motor cuurent now is read on 100Hz // I_Read = (Average_Read(I_Shunt) + 1) / 2;

#ifdef Inverted_Pots
    Pos_Pot1 = Offset_Pots - ((Average_Read(Pot1) + 1) / 2);
    if (Pos_Pot1 > 0x8000)
      Pos_Pot1 = 0;
    Pos_Pot2 = Offset_Pots - ((Average_Read(Pot2) + 1) / 2);
    if (Pos_Pot2 > 0x8000)
      Pos_Pot2 = 0;
#else
    Pos_Pot1 = (Average_Read(Pot1) + 1) / 2;
    Pos_Pot2 = (Average_Read(Pot2) + 1) / 2;
#endif

    break;

  case 2:

    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

    // read pots at 10Hz rate
    // motor cuurent now is read on 100Hz // I_Read = (Average_Read(I_Shunt) + 1) / 2;

#ifdef Inverted_Pots
    Pos_Pot3 = Offset_Pots - ((Average_Read(Pot3) + 1) / 2);
    if (Pos_Pot3 > 0x8000)
      Pos_Pot3 = 0;
    Pos_Pot4 = Offset_Pots - ((Average_Read(Pot4) + 1) / 2);
    if (Pos_Pot4 > 0x8000)
      Pos_Pot4 = 0;
#else
    Pos_Pot3 = (Average_Read(Pot3) + 1) / 2;
    Pos_Pot4 = (Average_Read(Pot4) + 1) / 2;
#endif

  
    // PROCESSA POT BPM
    // ================
    // #R200408EAR05 - Implements BPM as f(pot)
    // calculates BPM set according to POT
    // Y=BPM (8-30) X=Pot readings (0-511)
    // 20% 102 on pot
    // 80% 409 on pot
    // y = Ax+B
    // y = 0,0717 X + 0,691
    // multiply by 256 on both sides
    
    Dummy16=((Pot_BPM*18)+177)/256;
    BPM=(U8)Dummy16;

    if (BPM<2) // BPM > MAX was not considered as error due to desperate operator behaviour
      {
      // possible error on Pot or human operator
      IncErrorCount();
      ErrorID=ErrBPM;
      BPM=Last_Valid_BPM; // assumes last valid reading
      }
    else
      {
      // boundaries check
      if (BPM<BPM_Min) BPM=BPM_Min;
      else if (BPM>BPM_Max) BPM=BPM_Max;
          else
            {
            // looks like a valid BPM reading
            Last_Valid_BPM=BPM;
            }
      } 
    
    // #R200409EAR01 - Processes breath timing based on stablished BPM
    // ===============================================================
    // Now we have BPM set in expected range so Let's process breathing Timing
    // Thanks MIT for definitions of periods
    // All timing is expressed in 10ms resolution

    // ATMega can take a lot of time doing this, no 16/8 divide instruction available

    // Total breathing period
    Total_BPM_Time=6000/BPM;

    // Total inspiration period
    Total_Insp_Time=Total_BPM_Time/(1+IE_Ratio);

    // Total expiration period
    Total_Exp_Time=Total_BPM_Time-Total_Insp_Time;

    // Ramping Time (TR) on inspiration
    // Here we assumed Plateau_Hold_Time as part of inspiration cycle
    Ramping_Insp_Time=Total_Insp_Time-Plateau_Hold_Time;

    // #R200409EAR02 - Calculates Ramping_Speed based on Processes breath timing 
    // =========================================================================
    // TR is from 51 to 235 (30-8 BPM) assuming 150ms of Plateau_Hold_Time
    // Let's calculate ramping Speed, it will be used to set first PWM approximation
    // The number 8 was a mult constant used to increase resolution
    Ramping_Speed=(TidalVolumeSet*8)/Ramping_Insp_Time; 

    // Ramping_Speed values ranged from 6 (8 BPM - 200 ml TV) to 125 (30 BPM - 800 ml TV)
    // It seems good enough to build a lookup table
    
    // #R200409EAR03 - Calculates PWM based on Ramping_Speed 
    // =====================================================
    // RS Ramping_Speed values ranged from 6 (8 BPM - 200 ml TV) to 125 (30 BPM - 800 ml TV)

    if (Ramping_Speed > 255) Ramping_Speed=255; // Speed Bump!
    PWM_Ramp=PWM_Table[Ramping_Speed];
    if (PWM_Ramp > 99) PWM_Ramp=99; // PWM Bump!
    
     

    
    

    // PROCESS TIDAL POT
    // ==================
    // #R200408EAR07 - Implements TidalVolumeSet as f(pot)
    // calculates TidalVolumeSet according to POT
    // 20% 102 on pot
    // 80% 409 on pot
    // simply multiply by 2 and it's reasonable
    // 20% 204ml
    // 80% 818ml
    
    TidalVolumeSet=(Pot_Tidal*2);

    if (TidalVolumeSet<TVS_Min-100) // TV > MAX was not considered as error due to desperate operator behaviour
      {
      // possible error on Pot or human operator
      IncErrorCount();
      ErrorID=ErrTVS_Pot;
      TidalVolumeSet=Last_Valid_TVS; // assumes last valid reading
      }
    else
      {
      // boundaries check
      if (TidalVolumeSet<TVS_Min) TidalVolumeSet=TVS_Min;
      else if (TidalVolumeSet>TVS_Max) TidalVolumeSet=TVS_Max;
          else
            {
            // looks like a valid BPM reading
            Last_Valid_TVS=TidalVolumeSet;
            }
      } 

    // Calculates Final_Arm_Position as f(Course, TidalVolumeSet)
    // ==========================================================
    // #R200408EAR08 - Implements Final_Arm_Position as f(Course, TidalVolumeSet)
    // Total_Course=EOC_Down-EOC_UP;
    Dummy16=TidalVolumeSet/10;     // 20-80 range
    Final_Arm_Position=((EOC_Down-EOC_UP)*Dummy16)/100; // this is displacement
    Final_Arm_Position=Final_Arm_Position+EOC_UP;       // adds initial position to get Final_Arm_Position


    break;

  case 3:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

  
    // instant Tidal Volume calculation
    // first aproximation: f(arm pos)
    if (ArmPosSensor>=EOC_UP)
      {
      InstantTidalVolume=(ArmPosSensor-EOC_UP)*6;
      }
    
    // stores peak reading
    
    if (InstantTidalVolume>TidalVolume) TidalVolume=InstantTidalVolume;
    
    // pressure check
    
    break;

  case 4:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

  

    break;

  case 5:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

  
    break;

  case 6:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

  
      Serial.print("D"); // D means valid Data record to be displayed (for future protocol extensions)

    // RAW (HW) VARS PRINT
#ifdef sDump_BC    
    Serial.print(" BC:");
    Serial.print(Breath_Cycles, DEC);
#endif

#ifdef sDump_MS    
    Serial.print(" MS:");
    Serial.print(Motor_Status, DEC);
#endif

#ifdef sDump_Pots    
    Serial.print(" P1:");
    Serial.print(Pos_Pot1, DEC);

    Serial.print(" P2:");
    Serial.print(Pos_Pot2, DEC);

    Serial.print(" P3:");
    Serial.print(Pos_Pot3, DEC);

    Serial.print(" P4:");
    Serial.print(Pos_Pot4, DEC);
#endif

#ifdef sDump_IM    

    Serial.print(" IM:");
    Serial.print(Motor_Current, DEC);

    Serial.print(" IP:");
    Serial.print(Motor_Peak_Current, DEC);
#endif
    
#ifdef sDump_AS    
    Serial.print(" AS:");
    Serial.print(ArmPosSensor, DEC);
#endif
  
    break;

  case 7:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

  
#ifdef sDump_EC    

    Serial.print(" EC:");
    Serial.print(ErrorCount, DEC);

    Serial.print(" EI:");
    Serial.print(ErrorID, DEC);
#endif

#ifdef sDump_PW    
    Serial.print(" PW:");
    Serial.print(PWM_Duty, DEC);
#endif

#ifdef sDump_PS    
    Serial.print(" PS:");
    Serial.print(Px_Sensor, DEC);
#endif

#ifdef sDump_IOs    
    Serial.print(" O0:");
    Serial.print(OutputsExp[0], DEC);

    Serial.print(" I0:");
    Serial.print(InputsExp[0], DEC);

    // somente para depuracao
    if (SPI_Loopback_Mode)
    {
      OutputsExp[0]++;
    }
#endif
    break;

  case 8:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif

    
  /* // for Debug Only
    Serial.print("  Duty:");
    Serial.print(PWM_Duty, DEC);
    Serial.print("  HSA:");
    Serial.print(HSA_Duty, DEC);
    Serial.print("  HSB:");
    Serial.print(HSB_Duty, DEC);
  */
    // SETPOINTS
    
#ifdef sDump_PL
    Serial.print(" PL:");
    Serial.print(PlateauPressure, DEC);
#endif

#ifdef sDump_PM
    Serial.print(" PM:");
    Serial.print(PressureMaxLimit, DEC);
#endif

#ifdef sDump_AP
    Serial.print(" AP:");
    Serial.print(AssistedPressureThreshold, DEC);
#endif

#ifdef sDump_TS
    Serial.print(" TS:");
    Serial.print(TidalVolumeSet, DEC);
#endif

#ifdef sDump_BM
    Serial.print(" BM:");
    Serial.print(BPM, DEC);
#endif

#ifdef sDump_IE
    Serial.print(" IE:");
    Serial.print(IE_Ratio, DEC);
#endif

    break;

  case 9:
    // Task Period Measurement
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
    if (Seq_Tasks==Task_Period_Set) digitalWrite(Red_Led, HIGH);
#endif


#ifdef sDump_TB
    Serial.print(" TB:");
    Serial.print(Total_BPM_Time, DEC);
#endif

#ifdef sDump_TI
    Serial.print(" TI:");
    Serial.print(Total_Insp_Time, DEC);
#endif

#ifdef sDump_TE
    Serial.print(" TE:");
    Serial.print(Total_Exp_Time, DEC);
#endif

#ifdef sDump_TR
    Serial.print(" TR:");
    Serial.print(Ramping_Insp_Time, DEC);
#endif

#ifdef sDump_RS
    Serial.print(" RS:");
    Serial.print(Ramping_Speed, DEC);
#endif

#ifdef sDump_PR
    Serial.print(" PR:");
    Serial.print(PWM_Ramp, DEC);
#endif



    // RESULTS

#ifdef sDump_TV
    Serial.print(" TV:");
    Serial.print(TidalVolume, DEC);
#endif

#ifdef sDump_PX
    Serial.print(" PX:");
    Serial.print(MeasuredPressure, DEC);
#endif

    Serial.println();

    break;

  default:
    // reservado para reboot
    break;
  }
  
  Seq_Tasks++;
  if (Seq_Tasks >= 10) {
    Seq_Tasks = 0;
  }
  
#ifdef Debug_Task_Period
    // #R200409EAR04 - Implements Task Time monitoring through Red_Led signal
  digitalWrite(Red_Led, LOW);
#endif
    
}
