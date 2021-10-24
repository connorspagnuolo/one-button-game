class enemy {
  PVector positions;
  int numene = 15;
  int time;
  int waittime =3000;
  
  enemy(float x, float y){
       for (int i=0; i<numene; i++) {
    positions.add(new PVector(random(width), random(height/2)));
   }
    
  }
  
  void draw(){
    if (millis() > time + waittime) {
    positions.add(new PVector(random(width), random(height/2)));
    
    time = millis();
    }
  }
  void run() {
   // update();
    draw();

  }
}
    
