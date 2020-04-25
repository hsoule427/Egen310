int motorPinA = 3;
int AN1 = 4;
int AN2 = 7;

int motorPinB = 9;
int BN1 = 12;
int BN2 = 13;

void setup() {
  Serial.begin(9600);
  pinMode(motorPinA, OUTPUT);
  pinMode(AN1, OUTPUT);
  pinMode(AN2, OUTPUT);
  digitalWrite(AN1, LOW);
  digitalWrite(AN2, HIGH);

  pinMode(motorPinB, OUTPUT);
  pinMode(BN1, OUTPUT);
  pinMode(BN2, OUTPUT);
  digitalWrite(BN1, LOW);
  digitalWrite(BN2, HIGH);

}

void loop() {
  digitalWrite(motorPinA, HIGH);
  digitalWrite(motorPinB, HIGH);
  delay(1);
  digitalWrite(motorPinA, LOW);
  digitalWrite(motorPinB, LOW);
  delay(1);
  
}
