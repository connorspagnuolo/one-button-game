class Bullet {
  
  PVector position;
  float rot;
  int timestamp;
  float velocity = 10;
  boolean alive = true;
  int lifetime = 1000;

  Bullet(float x, float y, float _rot) {
    position = new PVector(x, y);
    rot = _rot;
    timestamp = millis();
  }
   
  void update() {
    position.x += velocity * sin(radians(rot));
    position.y -= velocity * cos(radians(rot));
    
   
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
  
  void draw() {
    stroke(255);
    if (random(1) < 0.5) {
      fill(25, 200, 0);
    } else {
      fill(67    , 0, 0);
    }
    ellipse(position.x, position.y, 10, 20);
  }
  
  void run() {
    update();
    draw();  
  }
  

}
