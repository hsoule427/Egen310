String val;
int motorPin = 11;
int AN1 = 2;
int AN2 = 4;
int delayHi = 0;
int delayLo = 0;

void setup() {
  Serial.begin(9600);
  pinMode(motorPin, OUTPUT);
  pinMode(AN1, OUTPUT);
  pinMode(AN2, OUTPUT);
  digitalWrite(AN1, LOW);
  digitalWrite(AN2, HIGH);
}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
    if (val != NULL) {
      Serial.println("You pushed " + val);
    }  
  }
}

void accelerate() {
  delayHi += 0.1;
  delayLo -= 0.1;
  
}

void deccelerate() {
  delayHi -= 0.1;
  delayLo += 0.1;
}
