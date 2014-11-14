class Dart{
  int dWidth;
  int dHeight;
  boolean isHit;
  int velocityDelay = 10;
  float speed = 5;
  
  PVector position;
  PVector target;
  PVector dart;
  PVector velocity;
  
  
  Dart(int xPlayer, int yPlayer, int targetX, int targetY){
   position = new PVector(xPlayer, yPlayer);
   target = new PVector(targetX, targetY);
   velocity = target;
   velocity.sub(position);
   velocity.normalize();
   velocity.mult(speed);
   dWidth = 5;
   dHeight = 3;
  } 
  
  void display(){
   rect(position.x,position.y,dWidth, dHeight); 
  }
  void move(){
    position.add(velocity);
  }
  boolean collision(){
    boolean hasCollided = false;
    
    return hasCollided;
  }
  
}
