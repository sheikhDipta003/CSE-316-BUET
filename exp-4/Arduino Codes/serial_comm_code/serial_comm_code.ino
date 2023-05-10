#include<SoftwareSerial.h>
//The SoftwareSerial library allows serial communication on other digital pins of an Arduino board, using software to replicate the functionality
//SoftwareSerial library has the following known limitations:
// --- It cannot transmit and receive data at the same time.
// --- If using multiple software serial ports, only one can receive data at a time.

SoftwareSerial SUART(2, 3); //RX = DPin-2; TX = DPin-3
//SoftwareSerial(rxPin, txPin, inverse_logic), by default inverse_logic is set to 'false'
int ledpin = 8, count = 0;

void setup() {
  Serial.begin(4800);
  SUART.begin(4800);    //set the baud rate
  pinMode(ledpin, OUTPUT);
}

void loop() {
  // byte n = SUART.available();
  // // //Get the number of bytes (characters) available for reading from a software serial port. This is data that has already arrived and stored in the serial receive buffer.

  // if (n != 0)
  // {
  //   char x = SUART.read();    //Return a character that was received on the RX pin of the SoftwareSerial object or return -1 if none is available.
  //   Serial.println(x);
  // }
  byte n = SUART.available();
  if(n != 0){
    char x = SUART.read();    //Return a character that was received on the RX pin of the SoftwareSerial object or return -1 if none is available.
    Serial.print(x);
    if((count % 2) == 0)  digitalWrite(ledpin, HIGH);
    else  digitalWrite(ledpin, LOW);
  }
  count++;
}
