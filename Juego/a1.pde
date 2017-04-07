class Boundary {
  float x;
  float y;
  float w;
  float h;
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));    b = box2d.createBody(bd);   
    b.createFixture(sd,1);
  }
  void display() {
    fill(255,0,0);  
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}

class BoundaryY {
  float s;
  float t;
  float q;
  float j;
  Body b;
  BoundaryY(float s_,float t_, float q_, float j_) {
    s = s_;
    t = t_;
    q = q_;
    j = j_;
    PolygonShape sd = new PolygonShape();
    float box2dDQ = box2dD.scalarPixelsToWorld(q/2);
    float box2dDT = box2dD.scalarPixelsToWorld(j/2);
    sd.setAsBox(box2dDQ, box2dDT);
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2dD.coordPixelsToWorld(s,t));
    b = box2dD.createBody(bd);
    b.createFixture(sd,1);    
    b.setUserData(this);
  }
  void display() {
   fill(255,0,0);
    noStroke();
    rect(s,t,q,j); 
  }
}