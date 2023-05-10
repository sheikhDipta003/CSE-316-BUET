int buzzOrNot = 20;
String msg = "Enter an integer: ";
int writepin = 8;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(writepin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.print(msg);
while(Serial.available() == 0){}
buzzOrNot = Serial.parseInt();
Serial.println(buzzOrNot);
if(buzzOrNot > 10)  {
    digitalWrite(writepin, HIGH);
    delay(2000);
    digitalWrite(writepin, LOW);
}

}
