import ddf.minim.*;
class Player{
  int life;
  int pHeight;
  int pWidth;
  int xPos;
  int yPos;
  int speed;
  final long SHOOT_DELAY = 200;
  long timeToShoot;
  int dartCounter; //dart index to shoot next
  
  Player(){
    life = 55;
    pHeight = 30;
    pWidth = 10;
    xPos = width/2;
    yPos = height/2;
    speed = 2;
    timeToShoot = millis();
    dartCounter = 0;
  }
  
  void collisionDetection(ArrayList<Animal> animals){
    for(Animal aAnimal: animals){
      float distance = dist(xPos, yPos, aAnimal.xPos, aAnimal.yPos);
      float playerRadius = pWidth/2;
      float animalRadius = aAnimal.aHeight/2;
      if(distance < playerRadius + animalRadius){
        life -= aAnimal.attack();
      }
    }
    
  }
  
  void display(){
    rectMode(CENTER);
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
  
  void shoot(AudioPlayer sound_gun){
    
    int targetX = mouseX;
    int targetY = mouseY;
    
    if(millis() >= timeToShoot){
      sound_gun.rewind();
      sound_gun.play();
      
      darts[dartCounter] = new Dart(player.xPos, player.yPos, targetX, targetY); 
      timeToShoot = millis() + SHOOT_DELAY;
      dartCounter++;
      
      if(dartCounter > DART_MAX -1){
        dartCounter = 0; 
      }
    }
  }
}
