int sw = 1366;
int sh = 300;
int W = 1000;
int H = 700;
PImage chapel;
int circlesize = 6;
float motionrange = 30;
float mouserange = 100;
Node[] nodes= new Node[164];
PFont f;  

float dth1, dth2, dx1,  dy1, dx2, dy2, th1, th2, r1, r2; 

void setup() {
  size(W, H);
  f = createFont("Arial",18,true);
 // jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  background(30);
  smooth();
  //chapel = loadImage("chapel.jpg");
  //define nodes
  //main window
  nodes[0] = new Node(175, 467); 
  nodes[1] = new Node(269, 467); 
  nodes[2] = new Node(175, 335); 
  nodes[3] = new Node(269, 335); 
  nodes[4] = new Node(220, 298); 
  nodes[5] = new Node(198, 311);
  nodes[6] = new Node(242, 311);
  
  nodes[107] = new Node(208, 467);
  nodes[108] = new Node(237, 467);
  nodes[109] = new Node(175, 359);
  nodes[110] = new Node(269, 359);
  nodes[111] = new Node(208, 359);
  nodes[112] = new Node(237, 359);
  
  nodes[113] = new Node(192, 345);
  nodes[114] = new Node(221, 345);
  nodes[115] = new Node(253, 345);
  
  nodes[116] = new Node(192, 334);
  nodes[117] = new Node(208, 334);
  nodes[118] = new Node(221, 334);
  nodes[119] = new Node(237, 334);
  nodes[120] = new Node(253, 334);
  
  nodes[121] = new Node(192, 323);
  nodes[122] = new Node(208, 323);
  nodes[126] = new Node(208, 315);
  nodes[123] = new Node(221, 315);
  nodes[124] = new Node(237, 315);
  nodes[127] = new Node(237, 323);
  nodes[125] = new Node(253, 323);

  
  //door
  nodes[7] = new Node(190, 680);
  nodes[8] = new Node(257, 680);  
  nodes[42] = new Node(257, 586); 
  nodes[43] = new Node(225, 569); 
  nodes[44] = new Node(190, 586);
  
  nodes[130] = new Node(224, 680);
  nodes[131] = new Node(224, 610);
  nodes[132] = new Node(207, 680);
  nodes[133] = new Node(207, 610);
  nodes[134] = new Node(240, 680);
  nodes[135] = new Node(240, 610);
  nodes[136] = new Node(190, 610);
  nodes[137] = new Node(257, 610);
  
  //inlets
  nodes[9] = new Node(95,460);
  nodes[10] = new Node(127,460); 
  nodes[11] = new Node(127,384); 
  nodes[12] = new Node(95,384); 
  
  nodes[13] = new Node(326,457);
  nodes[14] = new Node(361,457);
  nodes[15] = new Node(361,381);
  nodes[16]= new Node(326,381);
  //clock
  nodes[17]=new Node(191,230);  
  nodes[18]=new Node(252,230);
  nodes[128]=new Node(183,230);  
  nodes[129]=new Node(260,230);
  
  nodes[19]=new Node(222,230);
  nodes[20]=new Node(235,230);
  nodes[21]=new Node(245,230);
  //top pillars
  nodes[22]=new Node(19,497);
  nodes[23]=new Node(34,497);
  nodes[24]=new Node(19,454);
  nodes[25]=new Node(34,454);
  nodes[26]=new Node(19,309);
  nodes[27]=new Node(12,288);
  nodes[28]=new Node(17,258);
  nodes[29]=new Node(34,309);
  nodes[30]=new Node(39,288);
  nodes[31]=new Node(32,258);
  
  nodes[32]=new Node(19+399,497);
  nodes[33]=new Node(34+399,497);
  nodes[34]=new Node(19+399,454);
  nodes[35]=new Node(34+399,454);
  nodes[36]=new Node(19+399,309);
  nodes[37]=new Node(12+399,288);
  nodes[38]=new Node(17+399,258);
  nodes[39]=new Node(34+399,309);
  nodes[40]=new Node(39+399,288);
  nodes[41]=new Node(32+399,258);
  //under bit
  nodes[45]=new Node(6,506);
  nodes[46]=new Node(15,514);
  nodes[47]=new Node(15,564);
  nodes[48]=new Node(31,564);
  nodes[49]=new Node(77,540);
  nodes[50]=new Node(129,564);
  nodes[85]=new Node(145,564);
  nodes[51]=new Node(221,540);
  nodes[52]=new Node(273,564);
  nodes[87]=new Node(289,564);
  nodes[88]=new Node(300,564);
  nodes[53]=new Node(316,564);
  nodes[54]=new Node(366,540);
  nodes[55]=new Node(416,564);
  nodes[56]=new Node(416,564);
  nodes[57]=new Node(442,506);
  nodes[58]=new Node(430,514);
  nodes[59]=new Node(430,564);
  nodes[84]=new Node(171,564);
  nodes[86]=new Node(155,564);
  //under pillar
  nodes[60]=new Node(15,646);
  nodes[61]=new Node(15,680);
  nodes[62]=new Node(31,646);
  nodes[63]=new Node(31,680);
  
  nodes[64]=new Node(129,646);
  nodes[65]=new Node(129,680);
  nodes[66]=new Node(145,646);
  nodes[67]=new Node(145,680);
  
  nodes[68]=new Node(155,646);
  nodes[69]=new Node(155,680);
  nodes[70]=new Node(171,646);
  nodes[71]=new Node(171,680);
  
  nodes[72]=new Node(273,646);
  nodes[73]=new Node(273,680);
  nodes[74]=new Node(289,646);
  nodes[75]=new Node(289,680);
  
  nodes[76]=new Node(300,646);
  nodes[77]=new Node(300,680);
  nodes[78]=new Node(316,646);
  nodes[79]=new Node(316,680);
  
  nodes[80]=new Node(416,646);
  nodes[81]=new Node(416,680);
  nodes[82]=new Node(432,646);
  nodes[83]=new Node(432,680);
  
  //top 
 nodes[89]=new Node(55,250);
 nodes[90]=new Node(67,232);
 nodes[91]=new Node(84,235);
 nodes[92]=new Node(86,250);
 nodes[93]=new Node(91,255);
 nodes[94]=new Node(112,238);
 nodes[95]=new Node(96,225);
 nodes[96]=new Node(154,225);
 nodes[97]=new Node(154,150);
 
 nodes[98]=new Node(438-55,250);
 nodes[99]=new Node(438-67,232);
 nodes[100]=new Node(438-84,235);
 nodes[101]=new Node(438-86,250);
 nodes[102]=new Node(438-91,255);
 nodes[103]=new Node(438-112,238);
 nodes[104]=new Node(438-96,225);
 nodes[105]=new Node(438-154,225);
 nodes[106]=new Node(438-154,150);
 
 //top top
 nodes[138]=new Node(27,218);
 nodes[139]=new Node(423,218);
 nodes[140]=new Node(148,128);
 nodes[141]=new Node(293,128);
 nodes[142]=new Node(160,128);
 nodes[143]=new Node(170,128);
 nodes[144]=new Node(270,128);
 nodes[145]=new Node(280,128);
 
 nodes[146]=new Node(165,96);
 nodes[147]=new Node(275,96);
 
 nodes[148]=new Node(205,84);
 nodes[149]=new Node(235,84);
 
 nodes[150]=new Node(221,84);
 nodes[151]=new Node(221,32);
 
 //square bits
 nodes[152]=new Node(65,570);
 nodes[153]=new Node(93,570);
 nodes[154]=new Node(93,595);
 nodes[155]=new Node(65,595);
 nodes[156]=new Node(71,583);
 nodes[157]=new Node(89,583);
 
 nodes[158]=new Node(65+287,570);
 nodes[159]=new Node(93+287,570);
 nodes[160]=new Node(93+287,595);
 nodes[161]=new Node(65+287,595);
 nodes[162]=new Node(71+287,583);
 nodes[163]=new Node(89+287,583);
 
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
  background(255);
  //image(chapel,0,0);
  fill(150);
  noStroke();
  int c=0;
  String label = "error";
  //textFont(f);
  
   stroke(150);
   strokeWeight(0.8);
   //window
   lineNode(0,107);
   lineNode(107,108);
   lineNode(108,1);
   lineNode(1,110);
   lineNode(110,3);
   lineNode(6,4);
   lineNode(6,3);
   lineNode(4,5);
   lineNode(2,5);
   lineNode(109,2);
   lineNode(0,109);
   lineNode(107,111);
   lineNode(108,112);
   quCircle(109,113);
   quCircle2(113,111);
   quCircle(111,114);
   quCircle2(114,112);
   quCircle(112,115);
   quCircle2(115,110);
   
   semiCircle(116,117);
   semiCircle(117,118);
   semiCircle(118,119);
   semiCircle(119,120);
   semiCircle(126,123);
   semiCircle(124,123);
   semiCircle(121,122);
   semiCircle(127,125);
   
   lineNode(4,123);
   lineNode(118,123);
   lineNode(113,116);
   lineNode(111,117);
   lineNode(114,118);
   lineNode(112,119);
   lineNode(115,120);
   lineNode(121,116);
   lineNode(122,126);
   lineNode(117,122);
   lineNode(124,127);
   lineNode(120,125);
   lineNode(119,127);
   
    //in bits
    lineNode(9,10);
    lineNode(10,11);
    lineNode(12,9);
    semiCircle(11,12);
    
    lineNode(13,14);
    lineNode(14,15);
    lineNode(13,16);
    semiCircle(15,16);
    
    //clock
    semiCircle(17,18);
    semiCircle2(18,17);
    semiCircle(128,129);
    semiCircle2(129,128);
    lineNode(19,20);
    lineNode(19,21);
    
    //door
    lineNode(44,136);
    lineNode(43,44);
    lineNode(43,42);
    lineNode(8,134);
    lineNode(130,134);
    lineNode(130,132);
    lineNode(7,132);
    lineNode(42,137);
    lineNode(8,137);
    lineNode(44,136);
    lineNode(136,7);
    lineNode(133,136);
    lineNode(133,131);
    lineNode(131,135);
    lineNode(135,137);
    
    lineNode(133,132);
    lineNode(134,135);
    lineNode(131,130);
    
    lineNode(7,71);
    lineNode(8,73);
    
    //pillars
    quadNode(28,27,30,31);
    quadNode(27,30,29,26);
    quadNode(25,24,26,29);
    quadNode(22,23,25,24);

    quadNode(38,41,40,37);
    quadNode(37,40,39,36);
    quadNode(36,39,35,34);
    quadNode(34,35,33,32);
    
    quadNode(47,48,62,60);
    quadNode(60,62,63,61);
    
    quadNode(50,85,66,64);
    quadNode(64,66,67,65);
    
    quadNode(86,84,70,68);
    quadNode(70,71,69,68);
    
    quadNode(52,87,74,72);
    quadNode(73,72,74,75);
    
    quadNode(88,53,78,76);
    quadNode(78,79,77,76);
    
    quadNode(56,59,82,80);
    quadNode(80,82,83,81);
    
    //top
    lineNode(31,89);
    lineNode(38,98);
    lineNode(97,106);
    for (int i=89;i<97;i++){
      lineNode(i,i+1);
    }
    for (int i=98;i<106;i++){
      lineNode(i,i+1);
    }
    
    //banner
    lineNode(46,47);
    lineNode(47,48);
    lineNode(48,49);
    lineNode(49,50);
    lineNode(49,50);
    lineNode(50,85);
    lineNode(85,86);
    lineNode(86,84);
    lineNode(84,51);
    lineNode(51,52);
    lineNode(52,87);
    lineNode(87,88);
    lineNode(88,53);
    lineNode(53,54);
    lineNode(54,55);
    lineNode(55,59);
    lineNode(59,58);
    
    lineNode(46,58);
    lineNode(45,57);
    lineNode(32,23);
    
    lineNode(33,57);
    lineNode(57,58);
    
    lineNode(22,45);
    lineNode(45,46);
        
   quadNode(62,63,65,64);   
   quadNode(66,67,69,68);
   quadNode(74,75,77,76);  
   quadNode(78,79,81,80);  
   
   //toptop
   triangleNode(28,31,138);
   triangleNode(38,41,139);
   
    triangleNode(142,143,146);
    triangleNode(144,145,147);
    lineNode(97,140);
    lineNode(106,141);
    lineNode(140,142);
    lineNode(143,144);
    lineNode(141,145);
    
    lineNode(143,148);
    lineNode(151,150);
    lineNode(150,149);
    lineNode(148,150);
    lineNode(149,150);
    lineNode(149,144);
    
    //square bottom bits
    quadNode(158,159,160,161);
    quadNode(152,153,154,155);
    semiCircle(156,157);
    semiCircle2(157,156);
    semiCircle(162,163);
    semiCircle2(163,162);
    
    //clock work
      th1 = th1+dth1;
      nodes[21].x = nodes[19].x + r2*cos(th1);
      nodes[21].y = nodes[19].y + r2*sin(th1);

      if(-2<nodes[21].x-nodes[19].x && nodes[21].x-nodes[19].x <2 && nodes[21].y<nodes[19].y){
      th2 = th2+dth2;
      nodes[20].x = nodes[19].x + r1*cos(th2);
      nodes[20].y = nodes[19].y + r1*sin(th2);
      nodes[20].xfix = nodes[20].x;
      nodes[20].yfix = nodes[20].y;
      }
      
      
     for(Node node : nodes){
     node.update();
     node.draw();
     label = str(c);
     //fill(255);
    // text(label,node.x,node.y);
     fill(255);
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
    fill(255,255,255);
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
