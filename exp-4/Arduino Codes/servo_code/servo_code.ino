#include <Servo.h>

int servoPin = 9;
int servoPos = 0; //angular position of servo (0 degrees)
Servo myservo;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
myservo.attach(servoPin);   //attach pin 9 with the servo
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.print("Enter angular pos (-90 to 90 inclusive): ");
while(Serial.available() == 0){}
servoPos = Serial.parseInt();
Serial.println(servoPos);
myservo.write(servoPos);
}
