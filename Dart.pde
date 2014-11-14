class Dart{
  int dSize;
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
   dSize = 3;
  } 
  
  void display(){
   ellipse(position.x,position.y,dSize, dSize); 
  }
  void move(){
    position.add(velocity);
  }
  boolean collision(){
    boolean hasCollided = false;
    
    return hasCollided;
  }
  
}
