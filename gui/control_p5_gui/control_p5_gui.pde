import controlP5.*;

ControlP5 cp5;
String speedText = "0";
int speed = 0;
Textlabel speedLabel;
Button forwardButton;
Button backButton;
Button leftButton;
Button rightButton;


void setup() {
  size(300, 400);
  //background();
  
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
  background(150, 0, 150);
  //if (keyPressed) {
  //  //processKeyPress(key);
  //  keyReleased();
  //}
  
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
    //speed += 1;
    //speedLabel.setText("Current Speed: " + speed);
    forward();
  }
  else if (key == 's' || key == 'S') {
    backward();
    //speed -= 1;
    //speedLabel.setText("Current Speed: " + speed);
  }
  else if (key == 'a' || key == 'A') {
  }
  else if (key == 'd' || key == 'D') {
  }
}

void forward() {
  println("You pushed the forward button.");
  speed += 1;
  speedLabel.setText("Current Speed: " + speed);
}

void backward() {
  println("You pushed the backward button.");
  speed -= 1;
  speedLabel.setText("Current Speed: " + speed);
}

void left() {
  println("You pushed the left button.");
}

void right() {

}
