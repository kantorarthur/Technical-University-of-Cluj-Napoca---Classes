int latchPin = 4;
int clockPin = 7;
static int numar = 4356;


int dataPin = 8; // Pinii SSD
const unsigned char ssdlut[] = {0b00111111, 0b00000110,
0b01011011, 0b01001111, 0b01100110, 0b01101101, 0b01111101,
0b00000111, 0b01111111, 0b01101111};
const unsigned char anodelut[] = {0b00000001, 0b00000010,
0b00000100, 0b00001000};
const unsigned char digits[] = {1,2,3,4}; // Numărul afişat va
//fi 1234. Modificaţi aici pt alt număr
void setup ()
{
pinMode(latchPin,OUTPUT);
pinMode(clockPin,OUTPUT);
pinMode(dataPin,OUTPUT);
pinMode(A1, INPUT); // Cei trei pini pentru registrii
// de deplasare, configuraţi ca ieșire
}
void loop()
{//A1 A2 A3
  int cpy_numar = numar;
  if(!digitalRead(A1))
    ++numar;
for(char i = 3; i >= 0; --i)
{
int ultima_cifra = cpy_numar % 10;
cpy_numar /= 10;
unsigned char digit = ultima_cifra; // cifra curentă
unsigned char cathodes = ~ssdlut[digit]; // catozii
//cifrei curente, vom nega valoarea din LUT
digitalWrite(latchPin,LOW); // vom activa semnalul
//latch pentru a permite scrierea
shiftOut(dataPin,clockPin,MSBFIRST, cathodes); //
//serializăm octetul anozilor
shiftOut(dataPin,clockPin,MSBFIRST, anodelut [i] );
// serializăm octetul anozilor
digitalWrite(latchPin,HIGH); // dezactivăm semnalul
//latch
delay(2); // așteptare
}

}