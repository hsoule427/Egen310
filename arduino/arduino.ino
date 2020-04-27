String val;

// First motor connected to pin 3 on microprocessor
int motorPinA = 3;
// These pins specify if motor A rotates clockwise or counterclockwise
int AN1 = 4;
int AN2 = 7;

// Second motor connected to pin 9
int motorPinB = 9;
// These pins specify if motor B rotate counterclockwise or clockwise
int BN1 = 12;
int BN2 = 13;

// delayHi refers to the amount of time(ms) to keep the motors in a high or 'on' state
float delayHi = 1.0;
// delayLo refers to the amount of time(ms) to keep the motors in a low or 'off' state
float delayLo = 1.0;

int motorState = LOW;

void setup() { 
  Serial.begin(9600); // Specify baud rate of 9600
  // Set all connected pins to OUTPUT mode, as they will send signals to the motor controller
  pinMode(motorPinA, OUTPUT);
  pinMode(AN1, OUTPUT);
  pinMode(AN2, OUTPUT);
  // AN1, AN2, BN1, BN2 all set to low (off) to start
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
    // Receive signal sent from controller app over the Bluetooth connection
    val = Serial.read();
    
    if (val != NULL) {
      Serial.println("You pushed " + val);
      if (val == "119") { //119 refers to 'W' key, forward control
        accelerate(); 
      }
      else if (val == "115") { // 115 refers to 'S' key, backward control
        deccelerate();
      }
      else if (val == "32") { // 32 is the Space bar, which turns the motor on or off.
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

// Acceleration and deceleration are specified by how long a delay there is between sending a high (on) and low (off) signal
// to the motors.
void accelerate() { //To accelerate, increase the delayHi (how long to keep motors on), and equally decrease delayLo
  if (delayHi < 2) {
    delayHi += 0.1;
    delayLo -= 0.1;  
  }
}

void deccelerate() { //To deccelerate, perform opposite function to accelerate()
  if (delayLo < 2) {
    delayHi -= 0.1;
     delayLo += 0.1; 
  }
}
