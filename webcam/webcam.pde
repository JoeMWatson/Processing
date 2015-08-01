//Library för video stuff
import processing.video.*;
// A variable for the frame we grab from the webcam
Capture cam;
 
void setup() {
  size(640, 480);
 
//get a list of available camera modes and list them
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
 
}
 
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
}
