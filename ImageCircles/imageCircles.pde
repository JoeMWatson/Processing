//Library för video stuff
import processing.video.*;
// A variable for the frame we grab from the webcam
Capture cam;
Capture vid;
PImage grey;
int i;
PImage pic;
int w = 640;
int h = 480;
float step = PI/100;
int a = 320;
int b = 240;
float sw;
float g;
color c;
int xx, yy;

void setup() {
  size(w,h);
    String[] cameras = Capture.list();
 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
 
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[1]); 
    cam.start();     
  }      
 i=1;
  pic = loadImage("snap.jpg"); 
}

void draw() {
  background(0);
    loadPixels();  
  if (cam.available() == true) {
    cam.read();
  }
  
  pic = cam;
  //image(pic,0,0);
  noFill();
  stroke(255);
  
  for (int r=0; r<2*w; r+=7) {
    for (float t=0; t<2*PI; t+=step) {
      xx = int(a + r*cos(t));
      yy = int(b + r*sin(t));
      c = pic.get(xx,yy);
      g = (red(c) + blue(c) + green(c))/3;
      sw = 8*(g)/255;
      strokeWeight(sw);
      arc(a,b,2*r,2*r,t,t+step);
    }
  }
  filter(BLUR,0.8);
}

void mousePressed() { 
   saveFrame("line-######.png");
   delay(1200);   
} 
