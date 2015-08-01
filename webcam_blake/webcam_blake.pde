//Library för video stuff
import processing.video.*;
// A variable for the frame we grab from the webcam
Capture cam;
Capture vid1;
Capture vid2;
Capture vid3;
PImage a1;
PImage a2;
PImage a3;
PImage temp;
int i;
int W = 640;
int H = 480;
 
void setup() {
  size(W, H);
 
  String[] cameras = Capture.list();
 
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
 
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[1]); 
    cam.start(); 
    /*
    if (cam.available() == true) {
      cam.read();
    }
    a1 = cam;
    a2= cam;
    a3 = cam;
    */
  }
    a1 = createImage(W, H, RGB);
    a1.loadPixels();
    for (int i = 0; i < a1.pixels.length; i++) {
      a1.pixels[i] = color(0, 90, 102); 
    }
    a1.updatePixels();
    a2 = createImage(W, H, RGB);
    a2.loadPixels();
    for (int i = 0; i < a2.pixels.length; i++) {
      a1.pixels[i] = color(0, 90, 102); 
    }
    a2.updatePixels();
    a3 = createImage(W, H, RGB);
    a3.loadPixels();
    for (int i = 0; i < a3.pixels.length; i++) {
      a3.pixels[i] = color(0, 90, 102); 
    }
    a3.updatePixels();
 i=1;
}
 
void draw() {
  /*
  if (cam.available() == true) {
    cam.read();
  }
  */
  //vid = cam;
  image(a1, 0, 0);
  //tint(255, 126);
  image(a2, 200, 0);
  //tint(255, 126);
  image(a3, 300, 0);
  //blend(a2, 0, 0, W, H, 0,0, W, H, OVERLAY);
  //blend(a3, 0, 0, W, H, 0,0, W, H, OVERLAY);
  //filter(GRAY);
  //filter(BLUR, i);
  //filter(THRESHOLD);
}


void mousePressed()
{
  if (cam.available() == true) {
  cam.read();
  
  }
  temp = cam;
  if (i == 1){
    //vid1 = cam;
    a1 = temp;
    println("1");
  }
   if (i == 2){
    a2 = temp;
    println("2");
  }
   if (i == 3){
    a3 = temp;
    i=0;
    println("3");
  }
  i++;
}


