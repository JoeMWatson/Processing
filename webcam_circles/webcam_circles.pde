//Library för video stuff
import processing.video.*;
// A variable for the frame we grab from the webcam
Capture cam;
Capture vid;
PImage grey;
int i;
int W = 640;
int H = 480;
 
void setup() {
  size(W, H);
 
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
 grey = loadImage("snap.jpg");
}
 
void draw() {
  background(255);
  loadPixels();  
  if (cam.available() == true) {
    cam.read();
  }
  
  vid = cam;
  //grey=vid;
  image(grey, 0, 0);
  //filter(GRAY);
  //filter(BLUR, i);
  //filter(THRESHOLD);
  float rmax = sqrt(2)*W;
  
  float rstep = rmax/50;
  for (float r=rstep;r<rmax;r+=rstep){
    for(float th=0;th<2*PI;th+=PI/50){
      int x = round(W/2 + r*cos(th));
      int y = round(H/2 - r*sin(th));
      color c = grey.get(x,y);
      float red = red(c);
      float green = green(c);
      float blue = blue(c);
      float greyc = 0.2*red + 0.7*green + 0.1*blue;
      float sw = 8*(255-greyc)/255;
      noFill();
      print(sw);
      print(" ");
      stroke(0);
      strokeWeight(sw);
      arc(W/2,H/2,r,r,th,th+PI/20);
    }
  }
}


void mousePressed()
{
  i++;
  /*
  if (cam.available() == true) {
  cam.read();
  */
  //}
}


