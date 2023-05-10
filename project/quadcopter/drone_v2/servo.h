#include<Servo.h>

Servo esc[2][2];
int pin[2][2]={{8,10},{11,9}};
int range[2][2];
int xx;

void servo_setup(){
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      esc[i][j].attach(pin[i][j]);
      esc[i][j].writeMicroseconds(1000);
    }
  }
  // range[0][0]=1500;
  // range[0][1]=1800;
  // range[1][1]=2000;
  // range[1][0]=2000;
}

void servo_write(int thrust,double pidx,double pidy){
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      double mili=thrust+(j-i)*pidx+((i==j)?(i?1:-1):0)*pidy;
      int mapped=map(mili,1000,2000,1000,range[i][j]);
      if(xx){
        Serial.print("For motor ");
        Serial.print(i?"Backward ":"Forward ");
        Serial.print(j?"Right : ":"Left : ");
        Serial.println(mapped);
        Serial.print("X angle: ");
        Serial.println(errx);
        Serial.print("Y angle: ");
        Serial.println(erry);
      }
      esc[i][j].write(mapped);
    }
  }
  xx=0;
}
