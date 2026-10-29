//#include <LiquidCrystal.h>

//LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

#include "avr/interrupt.h"

volatile int button_cnt = 0;
const int button_pin = 14;


int dataPin = 8;

volatile bool INT0_ACT = false;
volatile bool INT1_ACT = true;

const unsigned char ssdlut[] = {0b00111111, 0b00000110,
0b01011011, 0b01001111, 0b01100110, 0b01101101, 0b01111101,
0b00000111, 0b01111111, 0b01101111, 0b01110111, 0b01011111, 0b00001111, 0b01011110, 0b01111001, 0b01000111};
const unsigned char anodelut[]
= {0b00000001, 0b00000010,
0b00000100, 0b00001000};

int latchPin = 4;
int clockPin = 7;

int anod = 3;

const int led[] = {15, 16, 17, 18};

volatile int buttonVar;

void setup()
{
    //lcd.begin(16, 2);
    buttonVar = true;

    pinMode(button_pin, INPUT_PULLUP);

    pinMode(20, INPUT);
    pinMode(21, INPUT);

    pinMode(latchPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    pinMode(dataPin, OUTPUT);

    pinMode(led[0], OUTPUT);
    pinMode(led[1], OUTPUT);
    pinMode(led[2], OUTPUT);
    pinMode(led[3], OUTPUT);

    EIMSK |= (1 << INT0);
    EIMSK |= (1 << INT1);

    EICRA |= (1 << ISC01);
    EICRA |= (1 << ISC11);

    sei();

}

const unsigned char digits[] = {1, 2, 3, 4};

void loop()
{

  bool apasat = (digitalRead(button_pin) == LOW);

  if(apasat)
  {
    if(anod == 3)
      anod = 2;
    else
      anod = 3;
    apasat = false;
  }
  
  // if(INT0_ACT)
  // {
  //   INT0_ACT = false;
  //   INT1_ACT = false;
  // }

  // if(INT1_ACT)
  // {
  //   ++button_cnt;
  //   if(button_cnt == 15)
  //     button_cnt = 0;
  // }
  if(buttonVar == false)
    delay(5000);

  if(buttonVar == true)
  {
    delay(500);
    ++button_cnt;
    if(button_cnt == 15)
      button_cnt = 0;
  }
  //for()
    //digitalWrite(led[i], HIGH);
    
  
  digitalWrite(led[0], HIGH);

  unsigned char digit = button_cnt;
  unsigned char cathodes = ~ssdlut[button_cnt];

  digitalWrite(latchPin, LOW);

  shiftOut(dataPin, clockPin, MSBFIRST, cathodes);

  shiftOut(dataPin, clockPin, MSBFIRST, anodelut[anod]);

  digitalWrite(latchPin, HIGH);


  int cnt = 0;
  volatile int cpy_btn = button_cnt;
  for(int i = 0; i < 4; ++i)
    digitalWrite(led[i], LOW);
  while(cpy_btn)
  {
    digitalWrite(led[cnt], HIGH);
    cpy_btn /= 2;
    ++cnt;
  }



  // lcd.print("cnt binar:");
  // lcd.setCursor(0, 1);
  // lcd.print();//aici trb in binar
  // bool apasat = (DigitalRead(button_pin) == LOW);

  // if(apasat)
  // {
  //   //trb sa schimb ledu de pe ssd
  //   //pe blocu led afisam in binar numar

  // }
}

ISR(INT0_vect)
{
  buttonVar = false;
}

ISR(INT1_vect)
{
  buttonVar = true;
}