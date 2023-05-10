#include "accelerometer.h"
#include "servo.h"
#include "pid.h"

void interaction(){
  if(Serial.available()){
    char a=Serial.read();
    double val=Serial.parseFloat();
    if(a=='i')
      csumx=csumy=0;
    switch(a){
      case 'p':
      case 'P':p=val;
      break;
      case 'i':
      case 'I':i=val;
      break;
      case 'd':
      case 'D':d=val;
      break;
      case 't':
      case 'T':thrust=val;
      break;
      case 'f':
      case 'F':range[0][0]=val;
      break;
      case 'g':
      case 'G':range[0][1]=val;
      break;
      case 'x':
      case 'X':xx=1;
      break;
      case 'm':
      case 'M':mx=val;
      break;
      case 'c':
      case 'C':Serial.print("Csumx: ");
      Serial.println(csumx);
      Serial.print("Csumy: ");
      Serial.println(csumy);
      break;
    }
  }
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  servo_setup();
  accelero_setup();
  while(!Serial.available());
  while(Serial.available())
    Serial.read();
}

void loop() {
  // put your main code here, to run repeatedly:
  pidloop();
  interaction();
}
