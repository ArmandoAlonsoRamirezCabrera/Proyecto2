
int[][] bloks = {

  { 50+18,100,57,10, 2 } };

boolean win = false;

void blokBooo() {
  for (int i = 0; i<bloks.length; i++) {
    if (bloks[i][4]==2) {
      fill(#1BCBB2,4);
    }
    if (px+pxv+psize>bloks[i][0] && px+pxv<bloks[i][0]+bloks[i][2] && py+psize>bloks[i][1] && py<bloks[i][1]+bloks[i][3]) {
      if (bloks[i][4]==2) {
        win=true;
      }
      pxv=0;
    }
    if (px+psize>bloks[i][0] && px<bloks[i][0]+bloks[i][2] && py+pyv+psize>bloks[i][1] && py<bloks[i][1]+bloks[i][3]) {
      if (bloks[i][4]==2) {
        win=true;
      }
      pyv=0;
      gravity=0;
      falling = false;
    }

    if (px+psize>bloks[i][0] && px<bloks[i][0]+bloks[i][2] && py+psize>bloks[i][1] && py+pyv<bloks[i][1]+bloks[i][3]) {
      if (bloks[i][4]==2) {
        win=true;
      }
      pyv=0;
      gravity=0;
    }
    rect(bloks[i][0], bloks[i][1], bloks[i][2], bloks[i][3]);
  }
}

void playerWinss() {
  if(win){
font = loadFont("Consolas-48.vlw");
  textFont(font);
  fill(#E8AA23);
  text("¡¡¡GANASTE!!!",160,50);} 
 }

void playerW() {
 if(win==true){
    fill(#FAD82D);            //fill(255,150,150);
  }
}