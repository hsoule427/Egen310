String val;

void setup() {
  Serial.begin(9600);

}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
    Serial.println("You clicked a " + val);
  }
}
