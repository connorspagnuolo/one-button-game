class Enemy {
  
  PImage pic;
  boolean onleft;
  PVector position, target;
  color col = color(random(127)+127, random(127)+127, random(127)+127);
  float movementSpeed = 0.007;
  float xMargin = 501;
  float yMargin = 40;
  boolean alive = true;
  PVector enemySize = new PVector(150, 40);

  Enemy() {
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin*2);
    float x1, x2;
    if (pickSide < 0.5) {
      onleft = true;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      onleft = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  
    target = new PVector(x2, y);  
   
  }
  
  void update() {
    if (position.dist(target) < 5) alive = false;
    
    for (Bullet bullet : cannon.bullets) {
      if (alive && hitDetectRect(position, bullet.position, enemySize)) {
        alive = false;
      
      }
    }
    
    if (alive) position.lerp(target, movementSpeed);
  }
  
  void draw() {
    rectMode(CENTER);
    fill(col);
    ellipse(position.x, position.y, enemySize.x, enemySize.y);
    ellipse(position.x , position.y - 20, enemySize.x - 50, enemySize.y - 25);
    rect(position.x, position.y - 30, enemySize.x - 110, enemySize.y - 11);
    if (debug) {
      fill(debugColor);
      noStroke();
      ellipse(position.x, position.y, 10, 10);
      ellipse(position.x -50, position.y, 10, 10);
      ellipse(position.x +50, position.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }
    
}
