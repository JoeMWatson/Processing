int sw = 1366;
int sh = 300;
int W = 1000;
int H = 700;
//PImage chapel;
int circlesize = 0;
float motionrange = 10;
float mouserange = 200;
Node[] nodes= new Node[40];

PFont f;  

void setup() {
  size(W, H);
  f = createFont("Arial",25,true);
  //jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  background(51);
  smooth();
  //chapel = loadImage("gisbourne.jpg");
  //define nodes
  //nodes = new Node[15];
  //court
  nodes[0] = new Node(16, 426); 
  nodes[1] = new Node(195, 396); 
  nodes[2] = new Node(405, 381); 
  nodes[3] = new Node(655, 388); 
  nodes[4] = new Node(842, 393); 
  nodes[5] = new Node(978, 412);
  nodes[6] = new Node(962, 523); 
  nodes[7] = new Node(500, 655);
  nodes[8] = new Node(31, 550);  
  
  nodes[35] = new Node(962, 543); 
  nodes[36] = new Node(500, 675); 
  nodes[37] = new Node(31, 570);  
 //bush 
  nodes[9] = new Node(472,389);
  nodes[10] = new Node(530,395); 
  nodes[11] = new Node(542,413); 
  nodes[12] = new Node(516,430); 
  nodes[13] = new Node(470,425);
  nodes[14] = new Node(461,403);
  nodes[15] = new Node(508,416);
  
  nodes[38] = new Node(495,430);
  nodes[39] = new Node(540,425);
  //tree interact
  nodes[16]=new Node(489,391);
  nodes[17]=new Node(502,395);  
  //trunk
  nodes[18]=new Node(490,382);
  nodes[19]=new Node(500,384);
  nodes[20]=new Node(491,355);
  nodes[21]=new Node(501,356);
  //tree
  nodes[22]=new Node(392,298);
  nodes[23]=new Node(418,200);
  nodes[24]=new Node(466,174);
  nodes[25]=new Node(546,206);
  nodes[26]=new Node(548,243);
  nodes[27]=new Node(588,251);
  nodes[28]=new Node(580,313);
  nodes[29]=new Node(537,340);
  
  nodes[30]=new Node(483,327);
  nodes[31]=new Node(507,324);
  nodes[32]=new Node(457,266);
  nodes[33]=new Node(519,227);
  nodes[34]=new Node(538,281);
  
  /*
  boolean move=false;
  int shift=0;
  for(Node node : nodes){
     if (node.x > height){
       move=true;
       shift = ;
       break;
     }
   }
   if(move){
     for(Node node : nodes){
       node.x=+shift;
     }
   }
 */ 

}

void draw() {
  background(51);
  //image(chapel,0,150);
  fill(150);
  noStroke();
  int c=0;
  String label = "error";
  textFont(f);
  for(Node node : nodes){
     node.update();
     node.draw();
     label = str(c);
     //fill(100, 2, 53);
    // text(label,node.x,node.y);
     fill(150);
     c++;
   }
   //stroke(150);
   //strokeWeight(2);
   /*
   stroke(150);
   strokeWeight(2);
   //court
   lineNode(0,1);
   lineNode(1,2);
   lineNode(2,18);
   lineNode(19,3);
   lineNode(3,4);
   lineNode(4,5);
   lineNode(5,6);
   lineNode(6,7);
   lineNode(7,8);
   lineNode(8,0);
   
   lineNode(0,37);
   lineNode(8,37);
   lineNode(7,36);
   lineNode(6,35);
   lineNode(36,37);
   lineNode(36,35);
   lineNode(35,5);
   
   //bush
   lineNode(10,11);
   lineNode(11,39);
   lineNode(39,12);
   lineNode(12,38);
   lineNode(38,13);
   lineNode(13,14);
   lineNode(14,9);
   for (int a=10;a<15;a++){
       //lineNode(a,a+1);
       lineNode(a,15);
   }
   lineNode(14,9);
   lineNode(9,15);
   lineNode(9,16);
   lineNode(17,10);
   lineNode(16,17);
   //trunk
   lineNode(16,18);
   lineNode(17,19);
   lineNode(18,20);
   lineNode(19,21);
   //tree
   lineNode(20,22);
   for (int a=22;a<30;a++){
     for (int b=a+1;b<30;b++){
       lineNode(a,a+1);
     }
   }
   lineNode(30,20);
   lineNode(30,22);
   lineNode(32,22);
   lineNode(32,23);
   lineNode(32,24);
   lineNode(33,24);
   lineNode(33,25);
   lineNode(33,26);
   lineNode(34,26);
   lineNode(34,27);
   lineNode(31,27);
   lineNode(31,28);
   lineNode(31,21);
   
   lineNode(30,32);
   lineNode(32,33);
   lineNode(33,34);
   lineNode(34,31);
   lineNode(30,31);
   //court to brush 38 39
   lineNode(0,13);
   lineNode(1,14);
   lineNode(2,14);
   lineNode(3,10);
   lineNode(4,11);
   lineNode(5,39);
   lineNode(6,12);
   lineNode(7,38);
   lineNode(8,13);
   */
   triangleNode(150,22,23,32);
   triangleNode(110,23,24,32);
   triangleNode(190,24,32,33);
   triangleNode(70,24,33,25);
   triangleNode(170,25,33,26);
   triangleNode(130,25,26,27);
   triangleNode(130,25,26,27);
   triangleNode(160,33,26,34);
   triangleNode(90,28,34,27);
   triangleNode(60,33,26,34);
   triangleNode(130,33,32,34);
   triangleNode(130,33,32,34);
   triangleNode(155,30,20,31);
   triangleNode(135,28,29,34);
   triangleNode(121,31,32,34);
   triangleNode(145,20,22,30);
   triangleNode(111,29,31,21);
   triangleNode(167,20,21,31);
   
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
             float move = 4/dist;
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

void lineNode(int a, int b){
  line(nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y);
}
void triangleNode(int x, int a, int b,int c){
  fill(x);
  //noFill();
  triangle(nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[c].x,nodes[c].y);
}
