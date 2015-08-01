import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;
PeasyCam camera;
Capture cam;
int H=700;
int W = 1100;
int nx ,ny;
float[][] pro;
PImage cap,greyall,grey;
OpenCV op; 
//Rectangle[] faces;
boolean taken;
float scale = 1;//nx/255;

void setup() {
  size(W,H,P3D); 
  frameRate(2);
  //smooth();
  //SET UP CAM
  camera = new PeasyCam(this, H);
  camera.setMinimumDistance(50);
  camera.setMaximumDistance(5000); 
  //SET UP WEBCAM
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  //cam = new Capture(this, W/2, H/2, cameras[1]);
  cam = new Capture(this, 640/2, 480/2);
  op = new OpenCV(this, W/2, H/2); 
  op.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  
  cam.start(); 
  taken = false; 
  println("setup successul");
}

void draw() {
  background(255);
  println("detecting face");
  cam.read();
  
  cap = cam;
  
  println(cap.width);
  println(cap.height);
  op.loadImage(cam);
  image(cam,0,0);
  Rectangle[] faces = op.detect();
  println(faces.length);
  /*
  if(faces.length>0) {
    println("face detected");
    op.gray(); 
    op.blur(8); 
    //op.adaptiveThreshold(591, 1)
    greyall = op.getSnapshot();
    grey = greyall.get(faces[0].x, faces[0].y, faces[0].width, faces[0].height);
    //image(grey,-grey.width/2, -grey.height/2);
    if(grey.width > 1 && grey.height > 1 && faces.length > 0) {
      nx = grey.width;
      ny = grey.height;
      println(nx);
      println(ny);
      pro = new float[nx][ny];
      taken = true;
      //image(grey, -grey.width/2, -grey.height/2);
      int ww = grey.width/2;
      int hh = grey.height/2;
      stroke(0);
      float greyold;
      println("processing");
      
      int k =0;
      float max = 0;
      float min = 1000;
        for (int y=1;y<ny;y++){
          println(y);
            for (int x=1;x<nx;x++)  {
              println(x);
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
            
        }
    }
    
     
  }
  else {println("FAIL");}
  */
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

