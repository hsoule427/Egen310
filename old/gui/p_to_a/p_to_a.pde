import processing.serial.*;

Serial myPort;
String val;

void setup() {
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (mousePressed == true) {
    myPort.write('1');
  }
  
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    if (val != null) {
      println(val);
    }
  } 
}
