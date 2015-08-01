import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import gab.opencv.*;
import processing.video.*;
PeasyCam camera;
Capture cam;
int H=700;
int W = 1100;
int nx = 600;
int ny = 400;
float[][] pro = new float[nx][ny];
PImage cap,grey;
OpenCV op; 
boolean taken;
float scale = 1;//nx/255;

void setup() {
  size(W,H,P3D); 
  frameRate(20);
  smooth();
  //SET UP CAM
  camera = new PeasyCam(this, nx);
  camera.setMinimumDistance(50);
  camera.setMaximumDistance(5000); 
  //SET UP WEBCAM
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  cam = new Capture(this, cameras[1]); 
  cam.start(); 
 taken = false; 
}

void draw() {
  background(0);
  /*
  // AXES
  stroke(255,0,0);         // red = Z
  line(0,0,-nx/2,0,0,nx/2);
  stroke(0,255,0);         // green = Y 
  line(0,-nx/2,0,0,nx/2,0);
  stroke(0,0,255);         // blue = X
  line(-nx/2,0,0,nx/2,0,0);
  */
  cam.read();
  cap = cam;
  if(cap.width > 0 && cap.height > 0) {
    op = new OpenCV(this, cap);
    op.gray(); 
    op.blur(8); 
    //op.adaptiveThreshold(591, 1)
    grey = op.getSnapshot();
    taken = true;
    //image(grey, -grey.width/2, -grey.height/2);
    int ww = grey.width/2;
    int hh = grey.height/2;
    stroke(255);
    float greyold;
    println("processing");
    int k =0;
    float max = 0;
    float min = 1000;
      for (int y=0;y<ny;y++){
          for (int x=0;x<nx;x++)  {
            color c = grey.get(x,y);
            float red = red(c);
            float green = green(c);
            float blue = blue(c);
            float greyc = 0.2126*red + 0.7152*green + 0.11*blue;
            pro[x][y] = 0.5*greyc-50;//greyc;//300*exp((greyc-255)/50);
            //println(k);
            k++;
            if(greyc>max){max = greyc;}
            if(greyc<min){min = greyc;}
          }
      }
      println(max);
      println(min);
      //println(greyc);
      //taken = false;
  }
  else {println("FAIL");}
  
  
  
  if(taken){
   //println("taken");
   //image(grey, -grey.width/2, -grey.height/2);
   strokeWeight(3);
   float xx, yy; 
   for(int y=0;y<ny-1;y+=4){
     for(int x=0;x<nx-1;x+=1){
       xx = -nx/2+x;
       yy = -ny/2+y;
       line(xx,yy,pro[x][y],xx+1,yy,pro[x+1][y]);
     }
     //println("a");
   }
    /*
    image(grey, -grey.width/2, -grey.height/2);
    int ww = grey.width/2;
    int hh = grey.height/2;
    stroke(50);
    float greyold;
    println("processing");
    int k =0;
    for (int y=hh/4; y<3*ww/4; y++){
      greyold = 100;
        for (int x=ww/4; x<3*ww/4; x++)  {
          color c = grey.get(x, y);
          float red = red(c);
          float green = green(c);
          float blue = blue(c);
          float greyc = (red+green+blue)/3;
          float xloc = -100+(400*x)/ww;
          float yloc = -100+(400*(y+1))/hh;
          line(xloc,yloc,greyold,xloc+1,yloc+1,greyc);
          greyold = greyc;
          println(k);
          k++;
        }
    }
    //println(greyc);
    //taken = false;
    */
  }

  
}

void keyPressed() {
  println("SNAP");
  /*
  cam.read();
  cap = cam;
  if(cap.width > 0 && cap.height > 0) {
    op = new OpenCV(this, cap);
    op.gray(); 
    op.blur(8); 
    //op.adaptiveThreshold(591, 1)
    grey = op.getSnapshot();
    taken = true;
    image(grey, -grey.width/2, -grey.height/2);
    int ww = grey.width/2;
    int hh = grey.height/2;
    stroke(50);
    float greyold;
    println("processing");
    int k =0;
    float max = 0;
    float min = 1000;
      for (int y=0;y<ny;y++){
          for (int x=0;x<nx;x++)  {
            color c = grey.get(x,y);
            float red = red(c);
            float green = green(c);
            float blue = blue(c);
            float greyc = 0.2126*red + 0.7152*green + 0.11*blue;
            pro[x][y] = 0.3*greyc-50;//greyc;//300*exp((greyc-255)/50);
            //println(k);
            k++;
            if(greyc>max){max = greyc;}
            if(greyc<min){min = greyc;}
          }
      }
      println(max);
      println(min);
      //println(greyc);
      //taken = false;
  }
  else {println("FAIL");}
  */
}

