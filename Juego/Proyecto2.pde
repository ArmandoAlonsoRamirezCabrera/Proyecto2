import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Box2DProcessing box2dD;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;
ArrayList<Particle> particles;
BoundaryY wall; 

void setup() {
  size(680,560);
  smooth();
    noStroke();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  
  box2dD = new Box2DProcessing(this);
  box2dD.createWorld();
  box2dD.setGravity(0, -10);
  box2dD = new Box2DProcessing(this);
  box2dD.createWorld();
  box2dD.listenForCollisions();
  
  particles = new ArrayList<Particle>(); 
  wall = new BoundaryY(width/2, height+1, width, 0);
   wall = new BoundaryY(719,0, 100, 1350);  
 wall = new BoundaryY(1,height,20,height);
 
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(80,180,100,10));
  boundaries.add(new Boundary(290,300,30,10));
  boundaries.add(new Boundary(310,280,30,10));
  boundaries.add(new Boundary(350,260,30,10));
  boundaries.add(new Boundary(410,240,70,10));
  boundaries.add(new Boundary(460,330,20,120));
  boundaries.add(new Boundary(50,100,70,10));
  boundaries.add(new Boundary(50,310,40,10));
  boundaries.add(new Boundary(35,290,15,30));
  boundaries.add(new Boundary(80,400,70,10));
  boundaries.add(new Boundary(300,100,50,10));               
  boundaries.add(new Boundary(140,370,25,25));
  boundaries.add(new Boundary(80, 238, 20, 5)); 
  boundaries.add(new Boundary(160, 245, 20, 5)); 
  boundaries.add(new Boundary(450, 200, 30, 10)); 
  boundaries.add(new Boundary(240, 150, 200, 10)); 
  boundaries.add(new Boundary(425, 150, 40, 10));
  boundaries.add(new Boundary(425, 100, 15, 10));
  boundaries.add(new Boundary(165, 90, 15, 15));  
  boundaries.add(new Boundary(0,height+70,20,800));
  boundaries.add(new Boundary(680,height/2,20,800));  
}

void draw() {
  background(255);
  playerWinss();
  playerW();
  Dead();
  playerDeath();
  blokBooo();
  blockBoo();
  playerBoo();
  instrucciones();
  Premio();
  box2d.step();
  
  if (random(4) < 0.01) {
     Box p = new Box(100,-1);
    boxes.add(p);
     Box q = new Box(400,-100);
    boxes.add(q);    
  }
  for (Boundary wall: boundaries) {
    wall.display();
  }
  for (Box b: boxes) {
    b.display();
  } 
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  if (random(1) < 0.1) {
    float sz = random(4, 8);
    particles.add(new Particle(random(width), 460, sz));
  }
  box2dD.step();
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    if (p.done()) {
      particles.remove(i); 
    }
  }
    wall.display();
   }  
  void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;
    p1.change();
    Particle p2 = (Particle) o2;
    p2.change();
  }
}
void endContact(Contact cp) {
}