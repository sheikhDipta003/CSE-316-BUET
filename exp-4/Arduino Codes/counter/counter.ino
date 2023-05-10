int count = 0;

void setup() {
  // put your setup code here, to run once:
pinMode(13,OUTPUT);
pinMode(12,OUTPUT);
pinMode(11,OUTPUT);
pinMode(10,OUTPUT);
}

void writeToPin(int count){
if(count & 0x1) digitalWrite(10, HIGH);
else digitalWrite(10, LOW);

if(count & 0x2) digitalWrite(11, HIGH);
else digitalWrite(11, LOW);

if(count & 0x4) digitalWrite(12, HIGH);
else digitalWrite(12, LOW);

if(count & 0x8) digitalWrite(13, HIGH);
else digitalWrite(13, LOW);
}

void loop() {
  // put your main code here, to run repeatedly:
writeToPin(count);
count = (count + 1) % 16;
delay(500);
}
