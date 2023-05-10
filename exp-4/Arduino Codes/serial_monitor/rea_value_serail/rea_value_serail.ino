int numBlinks;
String msg = "How many times to blink: ";
int blinkTime = 500;
int writePin = 12;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(writePin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
Serial.print(msg);
while(Serial.available() == 0){}
numBlinks = Serial.parseInt();

for(int i = 0; i < numBlinks ; i++){
  digitalWrite(writePin, HIGH);
  delay(blinkTime);
  digitalWrite(writePin, LOW);
  delay(blinkTime);
}
Serial.println();
}
