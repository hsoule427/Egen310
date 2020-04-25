String val;

int motorPinA = 3;
int AN1 = 4;
int AN2 = 7;

int motorPinB = 9;
int BN1 = 12;
int BN2 = 13;

float delayHi = 1.0;
float delayLo = 1.0;

int motorState = LOW;

void setup() {
  Serial.begin(9600);
  pinMode(motorPinA, OUTPUT);
  pinMode(AN1, OUTPUT);
  pinMode(AN2, OUTPUT);
  digitalWrite(AN1, LOW);
  digitalWrite(AN2, LOW);

  pinMode(motorPinB, OUTPUT);
  pinMode(BN1, OUTPUT);
  pinMode(BN2, OUTPUT);
  digitalWrite(BN1, LOW);
  digitalWrite(BN2, LOW);
  
}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
    
    if (val != NULL) {
      Serial.println("You pushed " + val);
      if (val == "119") {
        accelerate();
      }
      else if (val == "115") {
        deccelerate();
      }
      else if (val == "32") {
        toggleMotor();
      }
    }
  }
  digitalWrite(motorPinA, HIGH);
  digitalWrite(motorPinB, HIGH);
  delay(delayHi);
  digitalWrite(motorPinA, LOW);
  digitalWrite(motorPinB, LOW);
  delay(delayLo);
}

void toggleMotor() {
  if (motorState == LOW) {
    motorState = HIGH;
  }
  else if (motorState == HIGH) {
    motorState = LOW;
  }
  digitalWrite(AN2, motorState);
  digitalWrite(BN2, motorState);
  Serial.println("CURRENT MOTOR STATE:");
  Serial.println(motorState);
}

void accelerate() {
  if (delayHi < 2) {
    delayHi += 0.1;
    delayLo -= 0.1;  
  }
}

void deccelerate() {
  if (delayLo < 2) {
    delayHi -= 0.1;
     delayLo += 0.1; 
  }
}
