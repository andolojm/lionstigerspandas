import ddf.minim.*;
class Player {
  int life;
  int pHeight;
  int pWidth;
  int xPos;
  int yPos;
  int speed;
  final long SHOOT_DELAY = 200;
  long timeToShoot;
  int dartCounter; //dart index to shoot next
  Animation a = new Animation();
  char aniDirection;
  long timeToAnimate;
  final long ANIMATE_DELAY = 200;
  PImage temp = new PImage();


  Player() {
    life = 55;
    pHeight = 50;
    pWidth = 50;
    xPos = width/2;
    yPos = height/2;
    speed = 2;
    timeToShoot = millis();
    dartCounter = 0;
    a.setAnimationType('p');
  }
//To know when to call AllState
  void collisionDetection(ArrayList<Animal> animals) {
    for (Animal aAnimal : animals) {
      float distance = dist(xPos, yPos, aAnimal.xPos, aAnimal.yPos);
      float playerRadius = pWidth/2;
      float animalRadius = aAnimal.aHeight/2;
      if (distance < playerRadius + animalRadius) {
        life -= aAnimal.attack();
      }
    }
  }

  void display() {
    if (life > 0) {

      if (millis() >= timeToAnimate)
      {
        temp=a.drawAnimation(pWidth, pHeight);
        timeToAnimate = millis() + ANIMATE_DELAY;
      }  
      image(temp, xPos, yPos);

    }
  }

  void up() {
    if(yPos > 25){
      yPos -= speed;
      a.setAnimationType('w');
    }
  }

  void down() {
    if(yPos < height){
      yPos += speed;
      a.setAnimationType('s');
    }
  }

  void right() {
    if(xPos < width){
      xPos += speed;
      a.setAnimationType('a');
    }
  }

  void left() {
    if(xPos > 0){
      xPos -= speed;
      a.setAnimationType('d');     
    }
  }

  void shoot(AudioPlayer sound_gun) {

    int targetX = mouseX;
    int targetY = mouseY;

    if (millis() >= timeToShoot) {
      sound_gun.rewind();
      sound_gun.play();

      darts[dartCounter] = new Dart(player.xPos, player.yPos, targetX, targetY); 
      timeToShoot = millis() + SHOOT_DELAY;
      dartCounter++;

      if (dartCounter > DART_MAX -1) {
        dartCounter = 0;
      }
    }
  }
  
  void reset(){
    life = 55;
    xPos = width/2;
    yPos = height/2;
    speed = 2;
  }
  
  int getLife(){
    return life;
  }
}

