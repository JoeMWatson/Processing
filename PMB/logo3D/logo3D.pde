import processing.opengl.*;
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
int w = 600;
int h = 700;
PeasyCam camera;
PImage img;
void setup() {
  size(w, h, OPENGL);
  smooth();
    //SET UP CAM
  camera = new PeasyCam(this, 1200);
  camera.setMinimumDistance(1200);
  camera.setMaximumDistance(1200); 
  //load image
  img = loadImage("shield.jpg");
}


void draw() {
  background(255);
  // AXES
  stroke(255,0,0);         // red = Z
  line(0,0,-500,0,0,500);
  stroke(0,255,0);         // green = Y 
  line(0,-500,0,0,500,0);
  stroke(0,0,255);         // blue = X
  line(-500,0,0,500,0,0);
  //image
  int ww = img.width;
  int hh = img.height;
  image(img, -ww/2, -hh/2,ww,hh);
  //points
  ellipse(0,0,10,10);
  ellipse(-270,-395,10,10);
  ellipse(270,-395,10,10);
  ellipse(270,450,10,10);
  ellipse(270,450,10,10);
    ellipse(270,450,10,10);
  //curve(-1500.0,-395.0,0.0,-270.0,-395.0,540.0,270.0,-395.0,0.0,-270.0,-395.0,-270.0);
  
  
  //mouse
  frame.setTitle(" mouse location"
    + " | x "         + str((mouseX-w/2)*2)
    + " | y "     + str((mouseY-h/2)*2) 
    );

}
