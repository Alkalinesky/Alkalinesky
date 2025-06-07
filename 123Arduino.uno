#include"Arduino.h"
 const int M1_forward=128;
 # define SHCP_pin 18
 # define EN_pin 16
 # define DATA_pin 5
 # define STCP_pin 17
 # define PWM1_pin 19

void setup() {
pinMode (M1_forward,OUTPUT);
pinMode (SHCP_pin,OUTPUT);
pinMode (STCP_pin,OUTPUT); 
pinMode (DATA_pin,OUTPUT);
pinMode (PWM1_pin,OUTPUT);
digitalWrite(16,LOW);
}
void setmotor(int direction, int speed){
analogWrite(PWM1_pin,speed);
  //shift Register
digitalWrite(STCP_pin,LOW);
shiftOut(DATA_pin, SHCP_pin, MSBFIRST, direction);
digitalWrite(STCP_pin, HIGH);
}
void moveforward(int speed){
  setmotor(M1_forward,speed);
}
void loop() {
moveforward(125);
delay(1000);

}
