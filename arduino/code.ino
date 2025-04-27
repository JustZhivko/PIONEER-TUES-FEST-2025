#include <Servo.h>
#include<Wire.h>


int16_t AcX,AcY,AcZ,GyX,GyroY,GyroZ;
int  pitch;
int accAngleX;
int accAngleY;
int yaw;
int GyroX;
int gyroAngleX;
int  gyroAngleY;
int valueX = 110;
int valueY = 150;
Servo  servoX;
Servo servoY;


float elapsedTime, currentTime, previousTime;

int pos;

void setup(){
  Wire.begin();
  Wire.beginTransmission(0x68);
  Wire.write(0x6B); 
  Wire.write(0x00);    
  Wire.endTransmission(true);
  Serial.begin(9600);
  servoX.attach(5);
  servoY.attach(6);  
}

void loop()  {
  
  filter();
  map();
  previousTime = currentTime;        
  currentTime = millis();            
  elapsedTime = (currentTime - previousTime)  / 1000; 
  accAngleX = (atan(AcY / sqrt(pow(AcX, 2) + pow(AcZ, 2))) * 180 / PI)  - 0.58;
  accAngleY = (atan(-1 * AcX / sqrt(pow(AcY, 2) + pow(AcZ, 2))) * 180  / PI) + 1.58; 
 
  Wire.beginTransmission(0x68);
  Wire.write(0x3B);  
  Wire.endTransmission(false);
  Wire.requestFrom(0x68,12,true);
  AcX=Wire.read()<<8|Wire.read();    
  AcY=Wire.read()<<8|Wire.read();  
  AcZ=Wire.read()<<8|Wire.read();  
  GyroX=Wire.read()<<8|Wire.read();  
  GyroY=Wire.read()<<8|Wire.read();  
  GyroZ=Wire.read()<<8|Wire.read();  
  
  gyroAngleX = gyroAngleX +  GyroZ * elapsedTime;
  gyroAngleY = gyroAngleY + GyroY * elapsedTime;
  
  //Serial.print(valueX);
  
  
  //Serial.print("Accelerometer: ");
  //Serial.print("X = "); Serial.print(AcX);
  //Serial.print(" | Y = ");  Serial.print(AcY);
 // Serial.print(" | Z = "); Serial.println(AcZ);
  
  //Serial.print("Gyroscope: ");
 //Serial.print("X = "); Serial.print(GyX);
  // Serial.print(" | Y = "); Serial.print(GyroY);


  Serial.print(" | Z = ");
  Serial.println(GyroZ);
   delay(5);

}

void filter  () {
  Serial.print(GyroX);
  pitch = 0.9 * gyroAngleX + 0.1 * accAngleX;
  yaw = 0.9 * gyroAngleY + 0.1 * accAngleY;
}

void map () {

 valueY = map(yaw, -2000, 2000,  90, 130);
 valueX = map(pitch, -2000, 2000, 105, 145);
 servoX.write(valueX);
  servoY.write(valueY); 

}
