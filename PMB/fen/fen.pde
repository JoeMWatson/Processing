int sw = 1366;
int sh = 300;
int W = 1000;
int H = 700;
int bubbles=40;
PImage chapel;
int circlesize = 6;
float motionrange = 30;
float mouserange = 100;
Node[] nodes= new Node[103];
PFont f;  
boolean image,labelz;

void setup() {
  //image = false;
 // labelz = false;
  //size(W, H);
 // f = createFont("Arial",18,true);
  jProcessingJS(this, {fullscreen:true, mouseoverlay:true});
  //frameRate(FPS);
  background(51);
  smooth();
  //chapel = loadImage("fen.jpg");
  //define nodes
  //main window
  nodes[0] = new Node(97, 127); 
  nodes[1] = new Node(119, 134);
  nodes[2] = new Node(262, 190); 
  nodes[3] = new Node(262, 63); 
  nodes[4] = new Node(550, 220); 
  nodes[5] = new Node(550, 305); 
  nodes[6] = new Node(711, 185); 
  nodes[7] = new Node(719, 276); 
  nodes[8] = new Node(97, 461); 
  nodes[9] = new Node(223, 474); 
  nodes[10] = new Node(264, 477); 
  nodes[11] = new Node(398, 487); //
  nodes[12] = new Node(429, 489); 
  nodes[13] = new Node(550, 493); //
  nodes[14] = new Node(719, 484); 
  nodes[15] = new Node(550, 620); 
  nodes[16] = new Node(722, 636); 
  
  nodes[17] = new Node(223,668); 
  nodes[18] = new Node(264, 668); 
  
  nodes[19] = new Node(398, 642);
  nodes[20] = new Node(429, 642); 
  
  nodes[21] = new Node(487, 184); 
  nodes[22] = new Node(588, 209); 
  nodes[23] = new Node(527, 209);     
  nodes[24] = new Node(527, 173);
  
  nodes[25] = new Node(501, 179);
  nodes[26] = new Node(501, 164);
  nodes[27] = new Node(501, 53);
  nodes[28] = new Node(543, 53);
  nodes[29] = new Node(543, 164);
  nodes[30] = new Node(543, 179);
  
  nodes[31] = new Node(511, 47);
  nodes[32] = new Node(522, 45);
  nodes[33] = new Node(532, 47);
  nodes[34] = new Node(511, 47+112);
  nodes[35] = new Node(522, 45+112);
  nodes[36] = new Node(532, 47+112);
 
 //windows
  nodes[37] = new Node(91,250);
  nodes[38] = new Node(111,257);
  nodes[39] = new Node(152,266);
  nodes[40] = new Node(190,277);
  nodes[41] = new Node(206,281);
  nodes[42] = new Node(91,250+94);
  nodes[43] = new Node(111,257+92);
  nodes[44] = new Node(152,266+90);
  nodes[45] = new Node(190,277+88);
  nodes[46] = new Node(206,281+88);
  
  nodes[47] = new Node(320,308);
  nodes[48] = new Node(331,313);
  nodes[49] = new Node(357,321);
  nodes[50] = new Node(378,326);
  nodes[51] = new Node(391,330);
  nodes[52] = new Node(320,386);
  nodes[53] = new Node(331,386);
  nodes[54] = new Node(357,391);
  nodes[55] = new Node(378,394);
  nodes[56] = new Node(391,398);
  
  nodes[57] = new Node(464,351);
  nodes[58] = new Node(474,352);
  nodes[59] = new Node(488,357);
  nodes[60] = new Node(503,362);
  nodes[61] = new Node(513,364);
  nodes[62] = new Node(464,413);
  nodes[63] = new Node(474,414);
  nodes[64] = new Node(488,416);
  nodes[65] = new Node(503,417);
  nodes[66] = new Node(513,419);
  
  nodes[67] = new Node(337,152);
  nodes[68] = new Node(358,164);
  nodes[69] = new Node(382,175);
  nodes[70] = new Node(382,234-10);
  nodes[71] = new Node(358,226-10);
  nodes[72] = new Node(337,218-10);
  nodes[73] = new Node(337,176);
  nodes[74] = new Node(358,183);
  
  nodes[75] = new Node(471,215);
  nodes[76] = new Node(486,225);
  nodes[77] = new Node(501,229);
  nodes[78] = new Node(501,284-10);
  nodes[79] = new Node(486,277-10);
  nodes[80] = new Node(471,272-10);
  nodes[81] = new Node(471,237);
  nodes[82] = new Node(486,243);
  
  nodes[83] = new Node(589,244);
  nodes[84] = new Node(634,235);
  nodes[85] = new Node(634,275);
  nodes[86] = new Node(589,284);
  
  nodes[87] = new Node(589+30,244+123);
  nodes[88] = new Node(634+30,235+125);
  nodes[89] = new Node(634+30,275+128);
  nodes[90] = new Node(589+30,284+123);
  
  nodes[91] = new Node(589+35,244+254);
  nodes[92] = new Node(634+35,235+260);
  nodes[93] = new Node(634+35,275+263);
  nodes[94] = new Node(590+35,284+254);
  
  nodes[95] = new Node(590,372);
  nodes[96] = new Node(610,369);
  nodes[97] = new Node(610,407);
  nodes[98] = new Node(589,410);
  
  nodes[99] = new Node(590,369+130);
  nodes[100] = new Node(610,369+130);
  nodes[101] = new Node(610,407+130);
  nodes[102] = new Node(590,410+128);
  
  


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
  background(51);
  //if(image){image(chapel,0,0);}
  fill(150);
  noStroke();
  //int c=0;
  //String label = "error";
  //textFont(f);
  
   stroke(150);
   strokeWeight(0.8);
     //court
   lineNode(0,1);
   lineNode(4,5);
   triangleNode(1,2,3);
   lineNode(3,21);
   lineNode(21,23);
   lineNode(23,4);
   lineNode(4,22);
   lineNode(6,22);
   lineNode(5,7);
   lineNode(5,13);
   for(int a=8;a<14;a++){
     lineNode(a,a+1);
   }
   lineNode(9,17);
   lineNode(10,18);
   lineNode(11,19);
   lineNode(12,20);
   
   lineNode(13,15);
   lineNode(15,16);
   
   //tower
   lineNode(21,25);
   lineNode(26,25);
   lineNode(26,27);
   lineNode(34,31);
   lineNode(35,32);
   lineNode(36,33);
   lineNode(29,28);
   lineNode(26,34);
   lineNode(34,35);
   lineNode(35,29);
   lineNode(27,31);
   lineNode(31,32);
   lineNode(32,33);
   lineNode(33,28);
   lineNode(29,30);
   lineNode(25,24);
   lineNode(24,30);
   lineNode(22,30);
   lineNode(24,23);
   //window
   quadNode(37,38,43,42);
   quadNode(40,41,46,45);
   lineNode(38,39);
   lineNode(39,40);
   lineNode(43,44);
   lineNode(44,45);
   lineNode(44,39);
   
   quadNode(47,48,53,52);
   quadNode(50,51,56,55);
   lineNode(48,49);
   lineNode(49,50);
   lineNode(53,54);
   lineNode(54,55);
   lineNode(54,49);
   
   quadNode(57,58,63,62);
   quadNode(60,61,66,65);
   lineNode(58,59);
   lineNode(59,60);
   lineNode(63,64);
   lineNode(64,65);
   lineNode(64,59);
   
   
  quadNode(83,84,85,86);
  quadNode(87,88,89,90);
  quadNode(91,92,93,94);
  quadNode(95,96,97,98);
  quadNode(99,100,101,102);
  
  for(int a=67;a<74;a++){
     lineNode(a,a+1);
   }
   lineNode(73,67);
   lineNode(74,68);
   lineNode(74,71);
   for(int a=75;a<82;a++){
     lineNode(a,a+1);
   }
   lineNode(76,82);
   lineNode(79,82);
   lineNode(75,81);
   
   quCircle(17,18);
   quCircle(19,20);
     for(Node node : nodes){
     node.update();
     node.draw();
     //node.coscale(0.7);
     //label = str(c);
     //if(labelz){
    // fill(255);
     //text(label,node.x,node.y);
    // }
     //fill(150);
    // c++;
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
curve(nodes[a].x-50,nodes[a].y-50,nodes[a].x,nodes[a].y,nodes[b].x,nodes[b].y,nodes[a].x+50,nodes[a].y-50);
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
