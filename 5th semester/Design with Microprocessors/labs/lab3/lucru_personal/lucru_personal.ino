#include <LiquidCrystal.h> //pinii 7 - register select, 6 - enable, ultimii 4 biti sunt pinii de date
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

//deci LINIILE SUNT ECHIVALENTE SI CU LINIILE DIN COD
//ADICA
//B0000 - LINIA 0
//B0000 - LINIA 1

byte logic_and[8] = {
B11000,
B11000,
B11000,
B11000,
B11000,
B11000,
B11000,
};

byte equal_sign[8] = {
B00000,
B11111,
B00000,
B00000,
B11111,
B00000,
B00000,
};
void setup() {
lcd.begin(16, 2); 

lcd.createChar(0, logic_and);
lcd.createChar(1, equal_sign);

lcd.setCursor(0, 0);    //pune pozitia pe lcd
lcd.print("1 ");    

lcd.write(byte(0)); 
lcd.print(" 2 ");
lcd.write(1);

lcd.print(" 2 ");
}

void loop()
{
}