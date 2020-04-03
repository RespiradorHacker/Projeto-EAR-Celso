/*
 * ===============
 *    Teste eAR
 * ===============
 * Teste Simples criado em 02/04/2020 por Celso Monteiro
 * Realiza por enquanto:
 * - leituras dos pots
 * - acionamento dos motores por reles
 * - leitura da corrente do motor
 * - expansão SPI
 * 
 *  Compilado pelo Arduino 1.8.5 para Arduino Pro Mini
 *  Baud Rate 57600 para interface com usuario (FlexLed)

 ########################
 Historico de alteracoes:
 ########################
 
CUIDADO: POTS Invertidos
#R200402EAR01 - implementa inverted pots por SW 

 
 */

// type definition
#define U8 unsigned char // define tipo unsigned char
#define U16 unsigned int
#define U32 unsigned long int

#include <SPI.h>
#include "TimerOne.h"

#define Inverted_Pots 1 // #R200402EAR01 define que pots excursionam de +5V a zero, sentido CW
#define Offset_Pots 511

#define Ticks 10 // define o tempo entre cada execucao de loop, deve ser tunado para refletir degradacao do periodo em funcao da execucaoo das tasks

// ==================================
// definicao das entradas do HARDWARE
// ==================================
#define I_Shunt A7 // entrada leitura corrente shunt
#define Pot1 A0    // pots
#define Pot2 A1    //
#define Pot3 A2    //
#define Pot4 A3    //

// leituras das entradas, ja em formato final
U16 I_Read;
U16 Pos_Pot1; // Passar para array?
U16 Pos_Pot2;
U16 Pos_Pot3;
U16 Pos_Pot4;

// ===================================
// definicao dos saidas de acionamento
// ===================================
#define LSA 8            // Low Side A Bridge
#define LSB 5            // Low Side B Bridge
#define BEEP 4           // BIP
#define Latch_Inputs 3   // IO baseado em SPI
#define Latch_Outputs 10 // IO baseado em SPI

// VARS
// ====
byte InputsExp[4];
byte OutputsExp[4];
#define SPI_Loopback_Mode 1
U8 SPI_Error_Count;

U8 Dummy;
U8 Dummy_Count;
U8 cnt;
U8 Seq_Tasks; // Controla Task Scheduler Vagaba

U8 Timer_Motor;

// Maquina de estados rudimentar para controle de motor
U8 Motor_Phase;
#define M_CCW_Stop 0
#define M_CW_Start 1
#define M_CW_Stable 2
#define M_CW_Ending 3
#define M_CW_Stop 4
#define M_CCW_Start 5
#define M_CCW_Stable 6
#define M_CCW_Ending 7

U16 Motor_Current;
U16 Motor_Peak_Current;

U32 Breath_Cycles;

// =====================
//   FUNCOES UTILIZADAS
// =====================
void Dump_HexChar(U8 HexChar)
{
  if (HexChar < 0x10)
    Serial.print("0");
  Serial.print(HexChar, HEX);
}

// #R190917CSB01 - Implementado cÃ¡lculo de mÃ©dias de 8 leituras
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

void Reset_OUTs(void)
{
  digitalWrite(LSA, LOW);
  digitalWrite(LSB, LOW);
}

void Motor_CCW()
{
  Set_LSA();
  Reset_LSB();
}
void Motor_CW()
{
  Reset_LSA();
  Set_LSB();
}

void Motor_Stop()
{
  Reset_LSA();
  Reset_LSB();
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

  Reset_OUTs();

  // start the SPI library:
  SPI.begin();

  Beep_ON();
  delay(100);
  Serial.begin(57600); // initialize serial interface for user interface - Serial Arduino Padrao
  Serial.println(F("======================================================================="));
  Serial.println(F("      Testes e-AR - by Celso Monteiro - FlexMotronics - 200402"));
  Serial.println(F("======================================================================="));

  // set the data rate for the SoftwareSerial port - Serial FlexLed
  // Serial.begin(57600);

  // CSB User Manual
  Serial.println();
  Serial.println(F("Pot P1 -  "));
  Serial.println();
  Serial.println(F("Pot P2 - "));
  Serial.println();

  Motor_Phase = M_CCW_Stop;
  Timer_Motor = 1; // Start imediato
  Beep_OFF();

  Timer1.initialize(100000); // set a timer of length 100000 microseconds (or 0.1 sec - or 10Hz => the led will blink 5 times, 5 cycles of on-and-off, per second)
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

  // Atualiza saidas e entradas Expansao SPI
  // Realiza Load nos shift registers do 74HC165
  // Dupliquei para dar mais tempo
  digitalWrite(Latch_Inputs, LOW);  // garante que houve a transferÃªncia, realizada por nÃ­vel, do HC165
  digitalWrite(Latch_Inputs, LOW);  // garante que houve a transferÃªncia, realizada por nÃ­vel, do HC165
  digitalWrite(Latch_Inputs, HIGH); // habilita operaÃ§Ã£o HC165 como shift register
  digitalWrite(Latch_Inputs, HIGH); // habilita operaÃ§Ã£o HC165 como shift register

  // SPI.beginTransaction();
  // As entradas tem que ser complementadas porque em GND => entrada ativa
  InputsExp[0] = ((SPI.transfer(OutputsExp[0]) ^ 0xFF));
  // SPI.endTransaction();

  // depois do procedimento SPI utilizar
  // Dupliquei para dar mais tempo
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

  // Task Scheduler Vagaba
  // Executa uma task a cada 10ms, 10 Tasks, para retornar na mesma task leva 100ms
  switch (Seq_Tasks)
  {
  case 0:
    // reservado para checagem do sistema
    break;

  case 1:
    // Faz leitura dos pots a cada 100ms

    I_Read = (Average_Read(I_Shunt) + 1) / 2;

#ifdef Inverted_Pots
    Pos_Pot1 = Offset_Pots - ((Average_Read(Pot1) + 1) / 2);
    if (Pos_Pot1 > 0x8000)
      Pos_Pot1 = 0;
    Pos_Pot2 = Offset_Pots - ((Average_Read(Pot2) + 1) / 2);
    if (Pos_Pot2 > 0x8000)
      Pos_Pot2 = 0;
    Pos_Pot3 = Offset_Pots - ((Average_Read(Pot3) + 1) / 2);
    if (Pos_Pot3 > 0x8000)
      Pos_Pot3 = 0;
    Pos_Pot4 = Offset_Pots - ((Average_Read(Pot4) + 1) / 2);
    if (Pos_Pot4 > 0x8000)
      Pos_Pot4 = 0;
#else
    Pos_Pot1 = (Average_Read(Pot1) + 1) / 2;
    Pos_Pot2 = (Average_Read(Pot2) + 1) / 2;
    Pos_Pot3 = (Average_Read(Pot3) + 1) / 2;
    Pos_Pot4 = (Average_Read(Pot4) + 1) / 2;
#endif

    break;

  case 2:
    // realiza calculos
    break;

  case 3:
    // checa pressoes
    break;

  case 4:
    // trata o motor - provavelmente serÃ¡ fora deste scheduler
    switch (Motor_Phase)
    {
    case M_CCW_Stop:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Timer_Motor foi zerado agora, mudanÃ§a de fase
          Breath_Cycles++; // incrementa contador de ciclos

          Motor_Phase = M_CW_Ending; // normal seria esperar
          Motor_CW();
          Timer_Motor = 20; // 2 segundos fixo, fazer f(pots)
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
          // Timer_Motor foi zerado agora, mudanÃ§a de fase
          Motor_Phase = M_CW_Stop; //
          Motor_Stop();
          Timer_Motor = 2; //
        }
      }
      else
      {
        Motor_CW();
      }
      break;

    case M_CW_Stop:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Timer_Motor foi zerado agora, mudanÃ§a de fase
          Motor_Phase = M_CCW_Ending; //
          Motor_CCW();
          Timer_Motor = 20; //
        }
      }
      else
      {
        Motor_Stop();
      }

      break;

    case M_CCW_Start:
      break;

    case M_CCW_Stable:
      break;

    case M_CCW_Ending:
      if (Timer_Motor)
      {
        Timer_Motor--;
        if (!Timer_Motor)
        {
          // Timer_Motor foi zerado agora, mudanÃ§a de fase
          Motor_Phase = M_CCW_Stop; //
          Motor_Stop();
          Timer_Motor = 10; //
        }
      }
      else
      {
        Motor_CCW();
      }

      break;

    default:
      break;
    } // switch

    break;

  case 5:
    break;

  case 6:
    break;

  case 7:
    break;

  case 8:

    break;

  case 9:
    //

    Serial.print("M");
    Serial.print(Motor_Phase, DEC);
    Serial.print(":");

    Serial.print(" P1:");
    Serial.print(Pos_Pot1, DEC);

    Serial.print(" P2:");
    Serial.print(Pos_Pot2, DEC);

    Serial.print(" P3:");
    Serial.print(Pos_Pot3, DEC);

    Serial.print(" P4:");
    Serial.print(Pos_Pot4, DEC);

    Serial.print("  IM:");
    Serial.print(Motor_Current, DEC);

    Serial.print("  IPK:");
    Serial.print(Motor_Peak_Current, DEC);

    Serial.print("  OUT:");
    Serial.print(OutputsExp[0], DEC);

    Serial.print("  IN:");
    Serial.print(InputsExp[0], DEC);

    // somente para depuracao
    if (SPI_Loopback_Mode)
    {
      OutputsExp[0]++;
    }

    Serial.print("  BC:");
    Serial.print(Breath_Cycles, DEC);

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
    
}
