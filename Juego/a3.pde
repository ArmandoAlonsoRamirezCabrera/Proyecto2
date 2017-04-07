int l = 680;
int k = 560;
int posx=26;
int direccion = 3;
PFont font; 

int[][] blocks = {

   { 0, k, l+700, 10, 0 }, 
   { 40,height+70,1,800,1 }, 
   { 720,0, 100, 1350,1 }, 
   { 80,180,100-5,10, 1 } , 
   { 290+30,300,30,10, 1 }, 
   { 310+30,280,30-5,10, 1 }, 
   {350+30,260,30-5,10, 1 },
   { 410+20,240,60,10, 1 },
   { 460+40,330-55,20-5,120, 1 },
   { 50+30,310,40-5,5, 1 },
   { 35+45,290-10,15-5,30, 1 },
   { 80+11,400,70-5,5, 1 },
   { 300+30,100,50-12,5, 1 },
   { 140+36,380-19,25-5,25, 1 },
   { 455, 150, 40, 5, 1 },  
   { 465, 100, 15, 5, 1 },  
   { 205, 88, 15, 15, 1 },  
   { 480, 200, 30, 10, 1 },
   { 120, 240, 15, 5, 1 },
   { 200, 248, 15, 5, 1 }, 
   { 202, 150, 173, 10, 0 },
};

float psize=20;
float px=120-psize;    // LUGAR DONDE INICIARÁ EL CUADRITO    A LO ANCHO HORIZONTAL    px=120-psize;  px=430+psize;
float py=268+psize;     // LUGAR DONDE INICIARÁ EL CUADRITO    A LO LARGO VERTICAL     py=268+psize;  108+psize;
float rx=px;
float ry=py;
float pxv=0;
float pyv=0;
float pspeed=5;
float gravity=0;
boolean dead = false;

boolean falling = true;
void blockBoo() {
  for (int i = 0; i<blocks.length; i++) {
    fill(255);
    //fill(#932266);   //UVA

    if (blocks[i][4]==0) {
      fill(#1BCBB2,5);
    }
    if (px+pxv+psize>blocks[i][0] && px+pxv<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        dead=true;
      }
      pxv=0;
    }

    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+pyv+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        dead=true;
      }
      pyv=0;
      gravity=0;
      falling = false;
    }    
    if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py+pyv<blocks[i][1]+blocks[i][3]) {
      if (blocks[i][4]==0) {
        dead=true;
      }
      pyv=0;
      gravity=0;
    }  
    rect(blocks[i][0], blocks[i][1], blocks[i][2], blocks[i][3]);
  }
}
boolean[] keys = new boolean[256];
void keyPressed() {
  keys[keyCode]=true;
};
void keyReleased() {
  keys[keyCode]=false;
};
void playerDeath() {
  pxv=0;
  pyv=0;
  if (dead==false) {
    if (keys[UP] && falling==false) {
      gravity-=7;
    }
    if (keys[LEFT]) {
      pxv=-pspeed;
    }
    if (keys[RIGHT]) {
      pxv=pspeed;
    }
  }  
  if(keys[82]){
    dead=false;
    px=rx;
    py=ry;
  }
posx += direccion; 
  if (posx>= 475)
  {
    direccion *= -1;
  }  
  if (posx <= 25){
    direccion *=-1;
  }
  rect(posx,210,50,10);
  rect(posx+500,250,50,20,0);
  pyv+=gravity;
  gravity+=0.5;
  falling = true;
}
void Dead(){
if(dead){
font = loadFont("Consolas-48.vlw");
  textFont(font);
  fill(#275003);
  text("¡¡¡PERDISTE!!!",160,50); }
} 

void playerBoo() {
  px+=pxv;
  py+=pyv;  
  fill(0);
  if(dead==true){
    fill(#932266); 
  }   
  ellipse(px-37, py+5, psize, psize);
  {
    fill(#4DDDF5);
    ellipse(px-33, py, 7, 7);
    ellipse(px-40, py, 7, 7);
  }
    {
    fill(#502E02);
    ellipse(px-32, py-1, 4, 4);
    ellipse(px-38, py-1, 4, 4);
  }
     {
    fill(#FA72C4);
    ellipse(px-30, py+13, 8, 5);
    ellipse(px-45, py+13, 8, 5);  
  }
}