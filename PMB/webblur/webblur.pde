PImage logo;
int c = 10;
void setup() {
  size(1000,700);
  logo=loadImage("logo.jpg");
}

void draw() {
  //background(255);
  image(logo,0,0);
  filter(BLUR, c);
  c-=0.05;
}

