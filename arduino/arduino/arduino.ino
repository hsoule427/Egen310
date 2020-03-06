String val;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    val = Serial.read();
    if (val != null) {
      Serial.println("You pushed " + val);
    }
  }

}
