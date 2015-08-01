import processing.video.*; 


Capture cam;
PImage cap;
int s = 480;
int sw;
float step;
float pi = 3.1415926;


void setup () 
{ 
  size (s,s); 
  smooth();
  /*
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this); 
   cam.start();
   cam.read();
   cap=cam;
   */
   
} 


void draw() { 

 background(255);
 cap = image('snap.jpg');
 image (cap, 0, 0);
 step = PI/100;
 sw = 9;
 // max thickness = 8 (9)
 float a;
 float t;
 noFill();
 float ss = s * sqrt(2);
 for (a = 10; a<ss; a+=20){
  for(t = 0; t<2*PI; t+=step) {
  
  strokeWeight(sw);
  arc(s/2,s/2,a,a,t,t+step);
  //sw+=1;
 // if(sw>4){sw=1;}
  }
 } 
 //filter(BLUR,0.5);
 


 
  
} 

void mousePressed() { 
   println("mouse");
  // cam.read();
   //cap = cam;
   //cam.stop();
   //delay(1200);   
} 

void keyPressed() {
  println("key");
  String name = "circles_" + str(day()) + "_" + str(minute()) + "_" + str(second()) + ".jpg";
  println(name);
  save(name);
}
