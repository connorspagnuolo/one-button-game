float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float floor;

Cannon cannon;
ArrayList<Enemy> planes;

int carInterval = 1000;
int markTime = 0;
boolean debug = true;
color debugColor = color(255, 127, 0);

PImage explosionImg;

void setup() {
  size(800, 600, P2D);
  floor = height;
  
  cannon = new Cannon(width/2, height - 100);
  planes = new ArrayList<Enemy>();
 
}

void draw() {
  background(40);
  
  int t = millis();
  
  if (t > markTime + carInterval) {
    planes.add(new Enemy());
    markTime = t;
  }
    
  cannon.run();
    
  for (int i=planes.size()-1; i>=0; i--) {
    Enemy plane = planes.get(i);
    
    if (plane.alive) {
      plane.run();
    } else {
      planes.remove(i);
    }
  }
  
 
  
  println("Number of bullets: " + cannon.bullets.size());
  
  surface.setTitle("" + frameRate);
}

boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
}
