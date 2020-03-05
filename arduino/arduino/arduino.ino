char val;
int ledPin = 13;
boolean ledState = LOW;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
  establishContact();

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(Serial.available());
  if (Serial.available()) {
    val = Serial.read();
    Serial.println("You pushed " + val);
  }

}

void establishContact() {
  while (Serial.available() > 0) {
    Serial.println("C");
    delay(300);
  }
}
