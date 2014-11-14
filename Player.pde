class Player{
  int life;
  int pHeight;
  int pWidth;
  int xPos;
  int yPos;
  int speed;
  final long SHOOT_DELAY = 200;
  long timeToShoot;
  
  Player(){
    life = 55;
    pHeight = 30;
    pWidth = 10;
    xPos = width/2;
    yPos = height/2;
    speed = 15;
    timeToShoot = millis();
  }
  
  void collisionDetection(ArrayList<Animal> animals){
    for(Animal aAnimal: animals){
      float distance = dist(xPos, yPos, aAnimal.xPos, aAnimal.yPos);
      float playerRadius = pWidth/2;
      float animalRadius = aAnimal.aHeight/2;
      if(distance < playerRadius + animalRadius){
        life -= aAnimal.damage;
      }
    }
    
  }
  
  void display(){
    rect(xPos, yPos, pWidth, pHeight);
  }
  
  void up(){
    yPos -= speed;
  }
  
  void down(){
    yPos += speed;
  }
  
  void right(){
    xPos += speed;
  }
  
  void left(){
    xPos -= speed;
  }
  
  void shoot(int dartCounter){
    int targetX = mouseX;
    int targetY = mouseY;
    if(millis() >= timeToShoot){
      darts[dartCounter] = new Dart(player.xPos, player.yPos, targetX, targetY); 
      timeToShoot = millis() + SHOOT_DELAY;
    }
  }
}
