import processing.serial.*;

Serial myPort;

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
  text('A', 
}

void draw() {
  
}
