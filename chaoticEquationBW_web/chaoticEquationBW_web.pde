//window dimensions
int w = 600;
int h = 600;
//variables
float a,b,c,d;
float sfx,sfy,yy,xx;
int opacity = 3;
int layers = 50; // number of layers
int layernum = 1000; // number of points per layers
int num = layers * layernum;
int death = 600; // keep for grayscale
float lastTime, delay;
int j;
//classes
dpoints[] points = new dpoints[num];

void setup(){
  //size(w,h,P3D); //P3D needed for render 
  jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  background(230);
  rectMode(CORNER);
  // equation parameters

  a = random(-5,5);
  b = random(-5,5);
  c = random(-5,5);
  d = random(-5,5);
  //scale factors and positioning factors
  sfx = 4;
  sfy = 4;
  xx = 0.5;
  yy = 0.5;
  //create points
  for (int i=0;i<num;i++) {
    points[i] = new dpoints();
  }
frameRate(60);
//noLoop();  //we dont want draw looping
j=0;
}

void draw(){
  // To get the evolution of the form, the points a split up into layers. Layers are required for the 'probablility distrubution' effect of the opacity.
  // When layers are repeated, the form takes a step further
  // Each layer is a unique colour
    if (j>layers-1){j=0;}
    for (int i=0;i<layernum;i++) {
      points[j*layernum + i].place(); // plots points in motion rather than one go
    }
  j++; 
}

// structure definition
class dpoints {
  float x,y,x2,y2;
  int age;
  // initializer
  dpoints () {
    x = random(-1,1);
    y = random(-1,1);
    age=0;
  }
  // calculate position and plot
  void place() {
    x2 = sin(a*y) - cos(b*x);
    y2 = sin(c*x) - cos(d*y);
    stroke(0,0,0,opacity);
    x=x2;
    y=y2;
    fill(layers-j,j,j,opacity); //plot in colour gradient though the layers with added opacity for layering
    ellipse(x/sfx*width*0.8+xx*width,y/sfy*height*0.8+yy*height,0.3,0.3); //use scalefactors to plot correctly 
    age++;
    if (age>death) {redo();}
  }
  // point reborn
  void redo() {
    x = random(-1,1);
    y = random(-1,1);
    age=0;
  }
}

