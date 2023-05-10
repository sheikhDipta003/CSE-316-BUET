//read the voltage across R2 and print it in the serial monitor
int readpin = A3;
int writePin = 9;
int adc = 255;
float V2 = 0.0;     //actual analog volatage mapped to readValue
int readValue = 0;  //arduino output(an integer from 0 to 1023 inclusive)
int delayTime = 500;

void setup() {
  // put your setup code here, to run once:
pinMode(writePin, OUTPUT);
pinMode(readpin, INPUT);
Serial.begin(9600);   //set-up the baud rate
}

void loop() {
  // put your main code here, to run repeatedly:
analogWrite(writePin, adc);
readValue = analogRead(readpin);
V2 = (5.0 / 1023.0) * readValue;
Serial.println(V2);
delay(delayTime);
}
