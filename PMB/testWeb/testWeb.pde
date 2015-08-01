int sw = 1366;
int sh = 300;
int circlesize = 8;
float motionrange = 10;
float mouserange = 1000;
Node[] nodes;


void setup() {
  //size(300, 400);
  jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  background(51);
  smooth();
  //define nodes
  nodes = new Node[10];
  nodes[0] = new Node(50, 200); 
  nodes[1] = new Node(70, 200); 
  nodes[2] = new Node(70, 100); 
  nodes[3] = new Node(100, 50); 
  nodes[4] = new Node(200, 50); 
  nodes[5] = new Node(150, 120); 
  nodes[6] = new Node(150, 220); 
  nodes[7] = new Node(250, 100); 
  nodes[8] = new Node(250, 200); 
  nodes[9] = new Node(280,200); 
}

void draw() {
  background(51);
   fill(255);
   noStroke();
   for(Node node : nodes){
     node.update();
     node.draw();
   }
   stroke(255);
   strokeWeight(2);
   line(nodes[0].x,nodes[0].y,nodes[1].x,nodes[1].y);
   line(nodes[1].x,nodes[1].y,nodes[2].x,nodes[2].y);
   line(nodes[1].x,nodes[1].y,nodes[6].x,nodes[6].y);
   line(nodes[2].x,nodes[2].y,nodes[5].x,nodes[5].y);
   line(nodes[2].x,nodes[2].y,nodes[3].x,nodes[3].y);
   line(nodes[3].x,nodes[3].y,nodes[5].x,nodes[5].y);
   line(nodes[3].x,nodes[3].y,nodes[2].x,nodes[2].y);
   line(nodes[4].x,nodes[4].y,nodes[3].x,nodes[3].y);
   line(nodes[4].x,nodes[4].y,nodes[7].x,nodes[7].y);
   line(nodes[5].x,nodes[5].y,nodes[6].x,nodes[6].y);
   line(nodes[5].x,nodes[5].y,nodes[7].x,nodes[7].y);
   line(nodes[6].x,nodes[6].y,nodes[8].x,nodes[8].y);
   line(nodes[7].x,nodes[7].y,nodes[8].x,nodes[8].y);
   line(nodes[8].x,nodes[8].y,nodes[9].x,nodes[9].y);
}

class Node {
  float x, y, xfix, yfix,xtemp,ytemp;
  float a=0;
  float b=0;
  PVector v;
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
    ellipse(x, y, circlesize, circlesize);
  }
  
  void update() {
    if(xfix-mouserange<mouseX) {
      if(mouseX<xfix+mouserange) {
        if(mouseY<yfix+mouserange){
          if(mouseY>yfix-mouserange){
             v=new PVector(xfix-mouseX,yfix-mouseY);
             float dist = v.mag();
             //float move = dist/(1.414*mouserange*5);
             float move = 10/dist;
             move=constrain(move,0.01,100);
             v.normalize();
             x+=move*v.x;
             y+=move*v.y;
             x=constrain(x,xfix-motionrange,xfix+motionrange);
             y=constrain(y,yfix-motionrange,yfix+motionrange);
          }
        }
      }
    } 
  }
}
