int pin = 13;
int dot = 100;
int dash = 500;

void setup() {
  // put your setup code here, to run once:
pinMode(pin,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
digitalWrite(pin,HIGH);
delay(dot);
digitalWrite(pin,LOW);
delay(dot);

digitalWrite(pin,HIGH);
delay(dot);
digitalWrite(pin,LOW);
delay(dot);

digitalWrite(pin,HIGH);
delay(dot);
digitalWrite(pin,LOW);
delay(dot+100);

digitalWrite(pin,HIGH);
delay(dash);
digitalWrite(pin,LOW);
delay(dash);

digitalWrite(pin,HIGH);
delay(dash);
digitalWrite(pin,LOW);
delay(dash);

digitalWrite(pin,HIGH);
delay(dash);
digitalWrite(pin,LOW);
delay(dash+100);
}
