int sw = 1366;
int sh = 300;
int W = 1000;
int H = 700;
int bubbles=40;
PImage chapel;
int circlesize = 6;
float motionrange = 30;
float mouserange = 100;
Node[] nodes= new Node[34];
fizNode[] fiznodes= new fizNode[bubbles];
PFont f;  
boolean image,labelz;
float dth1, dth2, dx1,  dy1, dx2, dy2, th1, th2, r1, r2; 

void setup() {
  //image = false;
  //labelz = false;
  size(W, H);
  //f = createFont("Arial",18,true);
  //jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  background(51);
  smooth();
  //chapel = loadImage("champ.jpg");
  //define nodes
  //main window
  nodes[0] = new Node(50, 37); 
  nodes[1] = new Node(37, 183);
  nodes[2] = new Node(35, 270); 
  nodes[3] = new Node(40, 324); 
  nodes[4] = new Node(75, 377); 
  nodes[5] = new Node(91, 405); 
  nodes[6] = new Node(99, 437); 
  nodes[7] = new Node(99, 592);
  nodes[8] = new Node(82, 627); 
  nodes[9] = new Node(40, 642); 
  nodes[10] = new Node(18, 645); 
  nodes[11] = new Node(18, 650);

  nodes[12] = new Node(211-50, 37); 
  nodes[13] = new Node(211-37, 183);
  nodes[14] = new Node(211-35, 270); 
  nodes[15] = new Node(211-40, 324); 
  nodes[16] = new Node(211-75, 377); 
  nodes[17] = new Node(211-91, 405); 
  nodes[18] = new Node(211-99, 437); 
  nodes[19] = new Node(211-99, 592);
  nodes[20] = new Node(211-82, 627); 
  nodes[21] = new Node(211-40, 642); 
  nodes[22] = new Node(211-18, 645); 
  nodes[23] = new Node(211-18, 650);     


  nodes[24] = new Node(27, 657);
  nodes[25] = new Node(60, 664);
  nodes[26] = new Node(103, 665);
  nodes[27] = new Node(219-60, 664);
  nodes[28] = new Node(219-27, 657);
  nodes[29] = new Node(85, 337);
  nodes[30] = new Node(211-85, 337);
  
  nodes[31] = new Node(103, 297);
  nodes[32] = new Node(103, 373);
  
  nodes[33] = new Node(103, 650);
  float x0=nodes[0].xfix;
  float x1=nodes[12].xfix;
  float dx=x1-x0;
  for (int b=0;b<bubbles;b++){
  fiznodes[b] = new fizNode(round(x0+(b*dx/bubbles)), 54);
  }

 float minx = 500000;
 float miny = 500000;
 float maxx = 0;
 float maxy = 0;
 for(Node node : nodes){
     if (node.x<minx){
       minx = node.x;
     }
     if (node.y<miny){
       miny = node.y;
     }
     if (node.x>maxx){
       maxx = node.x;
     }
     if (node.y>maxy){
       maxy = node.y;
     }
   }
   
 //println(minx);
 //println(miny);
 //println(maxx);
 //println(maxy);
 
 
 //scale
 
 float hei = maxy-miny;
 float wid = maxx - minx;
 float sf,shift,xshift,yshift;
 if (hei>height){
   sf = 0.9*height/hei;
   for(Node node : nodes){
     node.coscale(sf);
   }
   
 minx = 500000;
 miny = 500000;
 maxx = 0;
 maxy = 0;
 for(Node node : nodes){
     if (node.x<minx){
       minx = node.x;
     }
     if (node.y<miny){
       miny = node.y;
     }
     if (node.x>maxx){
       maxx = node.x;
     }
     if (node.y>maxy){
       maxy = node.y;
     }
   }
 }
 //position
 /*
 shift = (height-hei)/2;
 xshift = shift-minx;
 yshift = shift-miny;
 for(Node node : nodes){
     node.xshift(xshift);
     node.yshift(yshift);
   }
 */
}

void draw() {
  background(51);
  if(image){image(chapel,0,0);}
  fill(150);
  noStroke();
  int c=0;
  String label = "error";
  //textFont(f);
  
   stroke(150);
   strokeWeight(0.8);
     //court
   for (int a=0;a<11;a++){
   lineNode(a,a+1);
   }
   for (int a=12;a<23;a++){
   lineNode(a,a+1);
   }
   for (int a=24;a<28;a++){
   lineNode(a,a+1);
   }
   //lineNode(0,12);
   lineNode(11,24);
   lineNode(23,28);
   
   triangleNode(3,4,29);
   triangleNode(15,16,30);
   triangleNode(8,20,33);
   triangleNode(9,33,8);
   triangleNode(20,21,33);
   triangleNode(20,21,33);
   triangleNode(30,31,29);
   triangleNode(5,17,32);
   triangleNode(29,30,32);
   triangleNode(25,33,27);
 
      
     for(Node node : nodes){
     node.update();
     node.draw();
     node.coscale(0.7);
     //label = str(c);
     //if(labelz){
     //fill(255);
     //text(label,node.x,node.y);
     //}
     fill(150);
     //c++;
   }
   
   for(fizNode fiznode : fiznodes){
     fiznode.update();
     fiznode.draw();
     fiznode.coscale(0.7);
   }
   
   
    
   //mouse location
   frame.setTitle(" mouse location"
    + " | x "         + str(mouseX)
    + " | y "     + str(mouseY) 
    );
}

class Node {
  float x, y, xfix, yfix,xtemp,ytemp;
  float a=0;
  float b=0;
  PVector v,u;
  // Contructor
  Node(int xx, int yy) {
    x=xx;
    y=yy;
    xfix=xx;
    yfix=yy;
    xtemp=xx;
    ytemp=yy;
  }
  void draw() {
    noStroke();
    fill(255,255,225);
    ellipse(x, y, circlesize, circlesize);
    fill(255,255,255,50);
    ellipse(x, y, circlesize*2, circlesize*2);
  }
  
  void update() {
    if(xfix-mouserange<mouseX && mouseX<xfix+mouserange && mouseY<yfix+mouserange && mouseY>yfix-mouserange) {
     // if() {
      //  if(){
      //    if(){
             v=new PVector(xfix-mouseX,yfix-mouseY);
             float dist = v.mag();
             //float move = dist/(1.414*mouserange*5);
             float move = 12/dist;
             move=constrain(move,0.01,5);
             v.normalize();
             x+=move*v.x;
             y+=move*v.y;
             x=constrain(x,xfix-motionrange,xfix+motionrange);
             y=constrain(y,yfix-motionrange,yfix+motionrange);
    //      }
    //    }
   //   }
    } 
  //else if(xfix-mouserange>mouseX && mouseX>xfix+mouserange && mouseY>yfix+mouserange && mouseY<yfix-mouserange) {
    else if (x>1.001*xfix || x<0.999*xfix || y>1.001*yfix || y<0.999*yfix) {
             u= new PVector(xfix-x,yfix-y);
             float move = 0.1;
             u.normalize();
             x+=move*u.x;
             y+=move*u.y;
             
    }
   }
   void coscale (float sf) {
   x = x*sf; 
   y = y*sf; 
   xfix = x; 
   yfix = y; 
   }
   void xshift (float xshift) {
   x += xshift; 
   xfix = x; 
   }
   void yshift (float yshift) {
   y += yshift; 
   yfix = y; 
   }
}

class fizNode {
  float x, y, xfix, yfix,xtemp,ytemp;
  float a=0;
  float b=0;
  PVector v,u;
  boolean ffloat = false;
  float xpos;
  //float pos = xfix/(nodes[12].xfix-nodes[0].xfix);
  // Contructor
  fizNode(int xx, int yy) {
    x=xx;
    y=yy;
    xfix=xx;
    yfix=yy;
    xtemp=xx;
    ytemp=yy;
    xpos = (xfix-nodes[0].xfix)/(nodes[12].xfix-nodes[0].xfix);
  }
  void draw() {
    noStroke();
    fill(255,255,225);
    ellipse(x, y, circlesize*1.4, circlesize*1.4);
    fill(255,255,255,50);
    ellipse(x, y, circlesize*2, circlesize*2);
    if(ffloat){
      y-=0.5;
      //yfix=y;
    }
  }
  
  void update() {
    float k=0.2;
    x=nodes[0].x+xpos*(nodes[12].x-nodes[0].x);
    yfix=nodes[0].y+xpos*(nodes[12].y-nodes[0].y)+10;
    if(x-mouserange*k<mouseX && mouseX<x+mouserange*k && mouseY<y+mouserange*k && mouseY>y-mouserange*k) {
             //ffloat = true;
    } 
  //else if(xfix-mouserange>mouseX && mouseX>xfix+mouserange && mouseY>yfix+mouserange && mouseY<yfix-mouserange) {
   else if (!ffloat) {
             //println(y);
             y=y+random(-2,2);
             y=constrain(y,yfix-8,yfix+8);
    }
   }
   void coscale (float sf) {
   x = x*sf; 
   y = y*sf; 
   xfix = x; 
   yfix = y; 
   }
   void xshift (float xshift) {
   x += xshift; 
   xfix = x; 
   }
   void yshift (float yshift) {
   y += yshift; 
   yfix = y; 
   }
}

void lineNode(int a, int b){
  line(nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y);
}

void triangleNode(int a, int b,int c){
  noFill();
  triangle(nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[c].x,nodes[c].y);
}
void quadNode(int a, int b,int c,int d){
  noFill();
  quad(nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[c].x,nodes[c].y,nodes[d].x,nodes[d].y);
}
void semiCircle(int a, int b){
noFill();
float d= abs(nodes[a].x-nodes[b].x);
arc((nodes[a].x+nodes[b].x)/2,(nodes[a].y+nodes[b].y)/2,d,d, PI, 2*PI);
}
void semiCircle2(int a, int b){
noFill();
float d= abs(nodes[a].x-nodes[b].x);
arc((nodes[a].x+nodes[b].x)/2,(nodes[a].y+nodes[b].y)/2,d,d, 0, PI);
}
void quCircle(int a, int b){
noFill();
curve(nodes[a].x,nodes[a].y-100,nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[a].x+100,nodes[a].y);
}
void quCircle2(int a, int b){
noFill();
curve(nodes[a].x+100,nodes[a].y,nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[a].x,nodes[a].y+100);
}
/*
void keyPressed() {
  switch (key) {
    case 'q':
      image = true;
      break;
    case 'w':
      image = false;
      break; 
    case 'e':
      labelz = true;
      break;
   case 'r':
      labelz = false;
      break;       
    default:  
      break;
  }
}
*/
