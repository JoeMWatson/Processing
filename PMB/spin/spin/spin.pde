PImage one,two;
float th=0;
float dth=PI/200;
int W,H;
int i = 0;

void setup(){
 // W=1000


one = loadImage("black.png");
two = loadImage("black.png");
one.resize(one.width/2,one.height/2);
two.resize(two.width/2,two.height/2);
size(one.width*2,one.height);
}

void draw() {
//image(one,0,0);
//image(two,0,0);
///*
background(255);
translate(width/2, height/2);
rotate(th);
translate(-width/2, -height/2);
image(one,width/4,0);
translate(width/2, height/2);
rotate(-th);
translate(-width/2, -height/2);

translate(width/2, height/2);
rotate(-th);
translate(-width/2, -height/2);
image(two,width/4,0);
translate(width/2, height/2);
rotate(th);
translate(-width/2, -height/2);

float dth1 = dth*(cos(th+PI)+1+0.2);
th+=dth1;

//if (frameCount % 3 == 0 && frameCount < 1500) {saveFrame("image-####.gif"); println(i); i++;}
//*/
}

