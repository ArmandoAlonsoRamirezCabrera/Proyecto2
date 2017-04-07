
void instrucciones(){
   fill(100);
  rect(600,100,50,20,7);
  rect(510,100,50,20,7);
  rect(552,86,20,30,7);
  fill(250);
  triangle(500,100, 508, 105, 508, 95);
  triangle(617,100, 608, 105, 608, 95);
  triangle(552,75, 545, 85, 559, 85);
  stroke(250);
  line(500, 100, 525, 100);
  line(583, 100, 608, 100);
  line(552, 95, 552, 85);
}

int num =55;
float sclo, sZ, offSet, theta, angle;
void Premio() {
  sclo = 12;
  translate(63, 82);
  for (int j=0; j<num; j++) { 
    stroke(random(255,0),random(19,140),random(89,255));
   noFill();
    sZ = j+sclo;
    float offSet = TWO_PI/num*j;
    float arcEnd = map(sin(theta+offSet),-60,-27, PI, TWO_PI);
    arc(-10,-20,sZ,sZ,PI,arcEnd);  }
  resetMatrix();
  theta += .08;  
}