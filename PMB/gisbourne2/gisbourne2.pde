int sw = 1366;
int sh = 300;
int W = 1200;
int H = 900;
PImage chapel;
int circlesize = 6;
float motionrange = 30;
float mouserange = 100;
Node[] nodes= new Node[129];
PFont f;  

float dth1, dth2, dx1,  dy1, dx2, dy2, th1, th2, r1, r2; 

void setup() {
  size(W, H);
  //f = createFont("Arial",18,true);
  //jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  //background(150);
  background(50);
  smooth();
  //chapel = loadImage("gisbourne.jpg");
  //define nodes
  //main window
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
  nodes[29]=new Node(501,356);
  
  nodes[30]=new Node(483,327);
  nodes[31]=new Node(507,324);
  nodes[32]=new Node(457,266);
  nodes[33]=new Node(519,227);
  nodes[34]=new Node(538,281);
  
  //building
  nodes[40]=new Node(0,175);
  nodes[41]=new Node(10,175);
  nodes[42]=new Node(50,132);
  nodes[43]=new Node(96,178);
  nodes[44]=new Node(108,180);
  nodes[45]=new Node(108,194);
  nodes[46]=new Node(123,194);
  nodes[47]=new Node(123,187);
  nodes[48]=new Node(139,187);
  nodes[49]=new Node(139,194);
  nodes[50]=new Node(152,194);
  
  nodes[51]=new Node(152,180);
  nodes[52]=new Node(172,180);
  nodes[53]=new Node(172,194);
  nodes[54]=new Node(182,194);
  nodes[55]=new Node(182,187);
  nodes[56]=new Node(202,187);
  nodes[57]=new Node(202,194);
  nodes[58]=new Node(213,200);
  nodes[59]=new Node(213,188);
  nodes[60]=new Node(225,188);
  
  nodes[61]=new Node(225,106);
  nodes[62]=new Node(241,106);
  nodes[63]=new Node(241,194);
  nodes[64]=new Node(252,194);
  nodes[65]=new Node(252,200);
  nodes[66]=new Node(263,200);
  nodes[67]=new Node(263,194);
  nodes[68]=new Node(279,194);
  nodes[69]=new Node(279,200);
  nodes[70]=new Node(290,207);
  
  nodes[71]=new Node(290,193);
  nodes[72]=new Node(303,193);
  nodes[73]=new Node(303,155);
  nodes[74]=new Node(307,151);
  nodes[75]=new Node(307,164);
  nodes[76]=new Node(307,164);
  nodes[77]=new Node(312,147);
  nodes[78]=new Node(323,143);
  nodes[79]=new Node(323,157);
  nodes[80]=new Node(335,157);
  
  nodes[81]=new Node(335,140);
  nodes[82]=new Node(355,140);
  nodes[83]=new Node(355,158);
  nodes[84]=new Node(362,158);
  nodes[85]=new Node(362,148);
  nodes[86]=new Node(379,157);
  nodes[87]=new Node(384,376);
  nodes[88]=new Node(341,382);
  nodes[89]=new Node(303,377);
  nodes[90]=new Node(241,379);
  nodes[91]=new Node(224,381);
  nodes[92]=new Node(67,388);
  //big window
  nodes[93]=new Node(26,282);
  nodes[94]=new Node(26,200);
  nodes[95]=new Node(51,186);
  nodes[96]=new Node(74,200);
  nodes[97]=new Node(74,282);
  //little windows
  nodes[98]=new Node(107,282);
  nodes[99]=new Node(107,247);
  nodes[100]=new Node(126,235);
  nodes[101]=new Node(140,247);
  nodes[102]=new Node(140,282);
  
  nodes[103]=new Node(107+70,282+5);
  nodes[104]=new Node(107+70,247+5);
  nodes[105]=new Node(126+70,235+5);
  nodes[106]=new Node(140+70,247+5);
  nodes[107]=new Node(140+70,282+5);
  
  nodes[108]=new Node(107+153,282+10);
  nodes[109]=new Node(107+153,247+10);
  nodes[110]=new Node(126+153,235+10);
  nodes[111]=new Node(140+153,247+10);
  nodes[112]=new Node(140+153,282+10);
  
  nodes[113]=new Node(260,353);
  nodes[114]=new Node(260,318);
  nodes[115]=new Node(286,318);
  nodes[116]=new Node(286,353);
  
  nodes[117]=new Node(260-78,353);
  nodes[118]=new Node(260-78,318);
  nodes[119]=new Node(286-78,318);
  nodes[120]=new Node(286-78,353);
  
  nodes[121]=new Node(260-155,353);
  nodes[122]=new Node(260-155,318);
  nodes[123]=new Node(286-155,318);
  nodes[124]=new Node(286-155,353);
  
  //slit
  nodes[125]=new Node(355,216);
  nodes[126]=new Node(365,216);
  nodes[127]=new Node(365,254);
  nodes[128]=new Node(355,254);
  
  //stars
  /*
  nodes[125]=new Node(355,216);
  nodes[126]=new Node(365,216);
  nodes[127]=new Node(365,254);
  nodes[128]=new Node(355,254);
  */
 
 dth1 = 2*PI/300; //hour
 dth2 = 2*PI/108; //min
 dx1 = (nodes[20].x-nodes[19].x);
 dy1 = (nodes[20].y-nodes[19].y);
 dx2 = (nodes[21].x-nodes[19].x);
 dy2 = (nodes[21].y-nodes[19].y);
 th1 = atan(dy1/dx1);
 th2 = atan(dy2/dx2);
 r1 = sqrt(sq(dx1) + sq(dy1));
 r2 = sqrt(sq(dx2) + sq(dy2));
 
 
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
 shift = (height-hei)/2;
 xshift = shift-minx;
 yshift = shift-miny;
 for(Node node : nodes){
     node.xshift(xshift);
     node.yshift(yshift);
   }
 
 
   

}

void draw() {
  //background(255);
  background(41,42,43);
  //image(chapel,0,150);
  fill(255);
  noStroke();
  int c=0;
  String label = "error";
  //textFont(f);
  
   stroke(150);
   strokeWeight(0.9);
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
   
   for(int a =40;a<92;a++){
     lineNode(a,a+1);
   }
   lineNode(89,72);
   lineNode(90,63);
   lineNode(91,60);
   
   for(int a =93;a<97;a++){
     lineNode(a,a+1);
   }
   lineNode(93,97);
   for(int a =98;a<102;a++){
     lineNode(a,a+1);
   }
   lineNode(98,102);
   for(int a =103;a<107;a++){
     lineNode(a,a+1);
   }
   lineNode(103,107);
   for(int a =108;a<112;a++){
     lineNode(a,a+1);
   }
   lineNode(108,112);
   for(int a =113;a<116;a++){
     lineNode(a,a+1);
   }
   lineNode(113,116);
   for(int a =117;a<120;a++){
     lineNode(a,a+1);
   }
   lineNode(117,120);
   for(int a =121;a<124;a++){
     lineNode(a,a+1);
   }
   lineNode(121,124);
    
   quadNode(125,126,127,128);  
      
     for(Node node : nodes){
     node.update();
     node.draw();
     label = str(c);
     fill(255);
     //text(label,node.x,node.y);
     //fill(51,52,53);
     c++;
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
    //fill(51,52,53);
    ellipse(x, y, circlesize, circlesize);
    fill(255,255,255,50);
    //fill(51,52,53,50);
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
             float move = 17/dist;
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
             float move = 0.5;
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

void mousePressed() { 
   saveFrame("line-######.png");
   delay(1200);   
} 
