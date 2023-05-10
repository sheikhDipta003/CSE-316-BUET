int greenPin = 9;
int adc = 255;
//adc = [analog * 256 / 5]
//analog = adc * 5.0 / 256  //approximated after obtaining the value of adc
//if the arduino is giving a voltage of 5v for x fraction of total period and 0 for (1-x) fraction, then-
//5x = analog
//So, time for which arduino is giving 5v = T * (analog / 5)

void setup() {
  // put your setup code here, to run once:
pinMode(greenPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
analogWrite(greenPin, adc);
}
