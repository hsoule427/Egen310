import processing.serial.*;

Serial myPort;
String val;

void setup() {
  String portName = Serial.list()[3];
  println("Current port = " + portName);
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
  }
  if (val != null) {
    println(val);
  }
}
