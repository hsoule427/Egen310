import controlP5.*;

ControlP5 cp5;
String speedText = "0";
int speed = 0;
Textlabel speedLabel;

void setup() {
  size(300, 400);
  //background();
  
  cp5 = new ControlP5(this);
  speedLabel = cp5.addTextlabel("speedDisplay")
                  .setPosition(100, 50)
                  .setSize(200,40)
                  .setText("Current Speed: " + speed)
                  .setColor(color(255,0,0));
  
}

void draw() {
  background(150, 0, 150);
  if (keyPressed) {
    processKeyPress(key);
  }
}

void processKeyPress(char keyVal) {
  if (keyVal == 'w') {
    println("w was pushed");
    speed += 1;
    speedLabel.setText("Current Speed: " + speed);
  }
}
