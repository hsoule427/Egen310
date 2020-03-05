import processing.serial.*;

Serial myPort;
String val;
String keyVal;
boolean firstContact = false;

void setup() {
  size(750, 500);
  background(0, 20, 50);
  rectMode(CENTER); // CENTER MODE specifies center coord, width, height
  //rect args: center x, center y, width, height
  rect(175, 200, 50, 50); // UP / W
  rect(125, 250, 50, 50); // LEFT / A
  rect(175, 250, 50, 50); // DOWN / S
  rect(225, 250, 50, 50); // RIGHT / D
  rect(175, 300, 150, 50); //BRAKE / SPACE
  
  textSize(32);
  fill(0, 102, 153);
  text('W', 162, 212);
  text('S', 168, 260);
  text('A', 115, 260);
  text('D', 210, 260);
  
  for (int i = 0; i < Serial.list().length; i++) {
    println(Serial.list()[i]);
  }
  
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
}

void draw() {
  
}

void serialEvent(Serial myPort) {
  val = myPort.readStringUntil('\n');
  if (val != null) {
    val = trim(val);
    println(val);
  }
  
  if (firstContact == false) {
    if (val.equals('C')) {
      myPort.clear();
      firstContact = true;
      myPort.write('C');
      println("contact");
    }
  }
  else {
    println(val);
    if (keyPressed) {
      myPort.write(key);
    }
  }
}
