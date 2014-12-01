class Dart{
  int dSize;
  boolean isHit;
  int velocityDelay = 10;
  float speed = 5;
  int damage = 1;
  
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
  boolean collisionDetection(ArrayList<Animal> animals){
    boolean hasCollided = false;
    
    for(Animal aAnimal: animals){
      float distance = dist(position.x, position.y, aAnimal.xPos, aAnimal.yPos);
      float dartRadius = dSize/2;
      float animalRadius = aAnimal.aHeight/2;
      if(distance < dartRadius + animalRadius){
        aAnimal.life -= damage;
        board.addScore(1);
        position.set(-50,-50);
        velocity.set(0,0);
      }
    }
    return hasCollided;
  }
  
}
