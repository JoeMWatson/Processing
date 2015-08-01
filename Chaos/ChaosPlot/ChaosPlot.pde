int w = 1300;
int h = 600;

float a,b,c,d;
float sfx,sfy,yy,xx;
int num = 8000;
int death = 250;
float lastTime, delay;

int i;

dpoints[] points = new dpoints[num];
dlines[] lines = new dlines[num];

void setup(){
size(w,h,P3D);  
background(230);
rectMode(CORNER);
//noStroke();
i=0;
a = 2.95667;
b = -2.20567;
c = 4.78;
d = -1.677;

sfx = 4;
sfy = 4;
xx = 0.5;
yy = 0.5;

for (int i=0;i<num;i++) {
  points[i] = new dpoints();
}
for (int i=0;i<num;i++) {
  lines[i] = new dlines();
}
//lastTime = 0;
//delay = 0;
//} 

  
}

void draw(){
  smooth();
//  if (i<2){
   for (int i=0;i<num;i++) {
    // lines[i].place();
  }
//  }
  //else {
  for (int i=0;i<num;i++) {
    points[i].place();
  }
  while (millis()-lastTime < delay){};
  lastTime = millis();
//}
i++;
}

class dpoints {
float x,y,x2,y2;
int age;

dpoints () {
x = random(-1,1);
y = random(-1,1);
age=0;
}

void place() {
  x2 = sin(a*y) - cos(b*x);
  y2 = sin(c*x) - cos(d*y);
  stroke(0,7);
  x=x2;
  y=y2;
  //point((x/sfx+xx)*w,(y/sfy+yy)*h);
  fill(0,8);
  ellipse(x/sfx*w*0.8+xx*w,y/sfy*h*0.8+yy*h,0.1,0.1);
  age++;
  if (age>death) {redo();}
}
void redo() {
  x = random(-1,1);
  y = random(-1,1);
  age=0;
}
}
class dlines {
float x,y,x2,y2;
int age;

dlines () {
x = random(-1,1);
y = random(-1,1);
age=0;
}

void place() {
  x2 = sin(a*y) - cos(b*x);
  y2 = sin(c*x) - cos(d*y);
  stroke(255,7);
  fill(255,2);
  strokeWeight(0.05);
  line((x/sfx+xx)*w,(y/sfy+yy)*h,(x2/sfx+xx)*w,(y2/sfy+yy)*h);
  x=x2;
  y=y2;
  //point((x/sfx+xx)*w,(y/sfy+yy)*h);
  age++;
  if (age>death) {redo();}
}
void redo() {
  x = random(-1,1);
  y = random(-1,1);
  age=0;
}
}

void mousePressed() { 
   saveFrame("line-######.png");
   delay(1200);   
} 
