#include <Servo.h>
Servo servo;
int servoPin = 2;

void setup() {
  servo.attach(servoPin);
}

void loop() {
//  servo.writeMicroseconds(2200);
//  delay(1);
//  servo.writeMicroseconds(1500);
  servo.write(95);
  delay(1);
  servo.write(150);
}
