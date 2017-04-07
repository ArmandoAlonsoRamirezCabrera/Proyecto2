class Box {
  Body body;
  float w;
  float h;
  Box(float x, float y) {
    w = random(4, 16);
    h = random(4, 16);
    makeBody(new Vec2(x, y), w, h);
  }

  void killBody() {
    box2d.destroyBody(body);
  }
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(#81550E);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }
  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}

class Particle {
  Body bodyD;
  float r;
  color col;
  Particle(float s, float t, float r_) {
    r = r_;
    makeBody(s, t, r);
    bodyD.setUserData(this);    
  }

  void killBody() {
   box2dD.destroyBody(bodyD);
  }
  void change() {    
    col = color(#1BCBB2);
  }
  boolean done() {
    Vec2 pos = box2dD.getBodyPixelCoord(bodyD);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2dD.getBodyPixelCoord(bodyD);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(#1BCBB2);
    noStroke();
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }

  void makeBody(float s, float t, float r) {
    BodyDef bd = new BodyDef();
    bd.position = box2dD.coordPixelsToWorld(s, t);
    bd.type = BodyType.DYNAMIC;
    bodyD = box2dD.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2dD.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 10;
    fd.friction = 0;
    fd.restitution = 0.1;
    bodyD.createFixture(fd);
    bodyD.setAngularVelocity(random(-10*10,10*20));
  }
}