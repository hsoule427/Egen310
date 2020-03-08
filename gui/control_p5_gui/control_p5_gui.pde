import controlP5.*;
import processing.serial.*;

Serial myPort;
String val;
ControlP5 cp5;
String speedText = "0";
int speed = 0;
Textlabel speedLabel;
Button forwardButton;
Button backButton;
Button leftButton;
Button rightButton;


void setup() {
  // Establish Bluetooth connection
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  // Set up gui
  size(300, 400);
  cp5 = new ControlP5(this);
  speedLabel = cp5.addTextlabel("speedDisplay")
                  .setPosition(100, 50)
                  .setSize(200,40)
                  .setText("Current Speed: " + speed)
                  .setColor(color(255,0,0));
  
  forwardButton = cp5.addButton("forward")
                     .setCaptionLabel("Foward: W")
                     .setPosition(100, 70)
                     .setSize(100, 50);
  
  backButton = cp5.addButton("backward")
                  .setCaptionLabel("Backward: S")
                  .setPosition(100, 140)
                  .setSize(100, 50);
                     
  leftButton = cp5.addButton("left")
                  .setCaptionLabel("Left: A")
                  .setPosition(100, 210)
                  .setSize(100, 50);

  rightButton = cp5.addButton("right")
                   .setCaptionLabel("Right: D")
                   .setPosition(100, 280)
                   .setSize(100, 50);
}

void draw() {
  // Redraw background so label updates will work
  background(150, 0, 150);
  
  val = myPort.readStringUntil('\n');
  if (val != null) {
    val = trim(val);
    println(val);
  }
  
}

void processKeyPress(char keyVal) {
  if (keyVal == 'w') {
    forward();
  }
  else if (keyVal == 's') {
    backward();
  }
  else if (keyVal == 'a') {
    println("a was pushed");
  }
  else if (keyVal == 'd') {
    println("d was pushed");
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    forward();
  }
  else if (key == 's' || key == 'S') {
    backward();
  }
  else if (key == 'a' || key == 'A') {
    left();
  }
  else if (key == 'd' || key == 'D') {
    right();
  }
}

void forward() {
  speed += 1;
  speedLabel.setText("Current Speed: " + speed);
  myPort.write(key);
}

void backward() {
  speed -= 1;
  speedLabel.setText("Current Speed: " + speed);
  myPort.write(key);
}

void left() {
  myPort.write(key);
}

void right() {
  myPort.write(key);
}
