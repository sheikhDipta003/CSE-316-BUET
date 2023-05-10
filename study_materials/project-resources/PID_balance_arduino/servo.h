#include <Servo.h>

Servo esc[2][2];
int pin[2][2]={{8,10},{11,9}};
int range[2][2];
// int xx;

void interaction(){
  if(Serial.available()){
    char a=Serial.read();
    double val=Serial.parseFloat();
    // if(a=='i')
    //   csumx=csumy=0;
    switch(a){
      case 'p':
      case 'P':kp=val;
      break;
      case 'i':
      case 'I':ki=val;
      break;
      case 'd':
      case 'D':kd=val;
      break;
      case 't':
      case 'T':throttle=val;
      break;
      case 'f':
      case 'F':range[0][0]=val;
      break;
      case 'g':
      case 'G':range[0][1]=val;
      break;
      // case 'x':
      // case 'X':xx=1;
      // break;
      // case 'm':
      // case 'M':mx=val;
      // break;
      // case 'c':
      // case 'C':Serial.print("Csumx: ");
      // Serial.println(csumx);
      // Serial.print("Csumy: ");
      // Serial.println(csumy);
      // break;
    }
  }
}

void servo_setup(){
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      esc[i][j].attach(pin[i][j]);
      esc[i][j].writeMicroseconds(1000);
    }
  }
   range[0][0]=1500;
   range[0][1]=1800;
  // range[1][1]=2000;
  // range[1][0]=2000;
}

void servo_write(){
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      esc[i][j].writeMicroseconds(1200);
    }
  }
}