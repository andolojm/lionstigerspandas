class Player{
  int life;
  int pHeight;
  int pWidth;
  int xPos;
  int yPos;
  int speed;
  final long SHOOT_DELAY = 3000;
  long timeToShoot;
  
  Player(){
    life = 5;
    pHeight = 30;
    pWidth = 10;
    xPos = width/2;
    yPos = height/2;
    speed = 15;
    timeToShoot = System.nanoTime();
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
    if(System.nanoTime() >= timeToShoot){
      darts[dartCounter] = new Dart(player.xPos, player.yPos, targetX, targetY); 
      timeToShoot = System.nanoTime() + SHOOT_DELAY;
    }
  }
}
