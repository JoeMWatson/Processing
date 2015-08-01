import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;

 float t;
  
  float radius = 5;
  float ang = 0, ang2 = 0;
  int pts = 120;
  float depth = 30;
  
  
void setup() {
  size(600,400,P3D); 
  //frameRate(20);
  //smooth();
  
  camera = new PeasyCam(this, 300);
  camera.setMinimumDistance(50);
  camera.setMaximumDistance(5000); 
  
 t = 0;

}

void draw() {
  background(255);
   
   // AXES
  stroke(255,0,0);         // red = Z
  line(0,0,-100,0,0,100);
  stroke(0,255,0);         // green = Y 
  line(0,-100,0,0,100,0);
  stroke(0,0,255);         // blue = X
  line(-100,0,0,100,0,0);
  
  rotateY(5*t);
  rotateX(exp(-t/100)*cos(-5*t));
  rotateZ(exp(-t/100)*-sin(-5*t));


  //body
 beginShape(QUAD_STRIP); 
 for (int i=0; i<=pts; i++){
   float  px = cos(radians(ang))*radius;
   float  py = sin(radians(ang))*radius;
   vertex(px,depth,py); 
   vertex(px,-depth,py); 
   ang+=360/pts;
 }
 endShape(); 
 
 //cap 1
 beginShape(POLYGON); 
 for (int i=0; i<=pts; i++){
   float  px = cos(radians(ang))*radius;
   float  py = sin(radians(ang))*radius;
   vertex(px,depth,py); 
   ang+=360/pts;
 }
 endShape(); 

 //cap2
 beginShape(POLYGON); 
 for (int i=0; i<=pts; i++){
   float  px = cos(radians(ang))*radius;
   float  py = sin(radians(ang))*radius;
   vertex(px,-depth,py); 
   ang+=360/pts;
 }
 endShape(); 
 
 ang2+=PI/120; //for rotation
 
 rotateZ(-exp(-t)*-sin(-5*t));
 rotateX(-exp(-t)*cos(-5*t));
 rotateY(-5*t);
  
 t+=0.1;
 
}
