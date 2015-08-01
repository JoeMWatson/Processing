
float a,b,c,d,dt,x,y,dx,dy,r;
int w = 1200;
int h = 700;

void setup() {
  size(w,h);
  background(255);
  frameRate(100);
  x=w/2;
  y=h/2;
  dt=1;
  a=0.08;
  b=6;
  c=1.3;
  d=1.01;
  r=1;
  //fill(20,200);
}

void draw() {
  dx = sin(a*y)-cos(b*x);
  dy = sin(c*x)-cos(d*y);
  //if (y>=h) { y=h;dy=-dx;}
  //if (y<=0) { y=0;dy=-dx;}
  //if (x>=w) { y=w;dx=-dx;}
  //if (y<=0) { y=0;dx=-dx;}
  x=dt*dx;
  y=dt*dy;
  //x1=x1+dt*dx1;
  //y1=y1+dt*dy1;
  ellipse(100*x,100*y,r,r);
  ellipse(100*x,100*y,r,r);
  //smooth();
}
