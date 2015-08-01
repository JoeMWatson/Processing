import processing.video.*; 


Capture cam;
PImage cap;
int s = 480;


void setup () 
{ 
  size (s,s); 
  smooth();
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, cameras[1]); 
  cam.start(); 
} 


void draw() { 
  cam.read();
  image (cam, 0, 0); 
  
   
} 

void mousePressed() { 
   cap = cam;
   image(cap, 0, 0); 
   cap.save("snap.jpg"); 
   delay(1200);   
} 
