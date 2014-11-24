import ddf.minim.*;
public abstract class Animal {
  Minim minim;
  int xPos;
  int yPos;
  int aHeight;
  int aWidth;
  int life;
  int damage;
  int speed;
  Animation a;
  
  AudioPlayer animalSound;
  
  
  
  void roar(){
   //random roar function 
   if((random(50) % 2) == 0){
     animalSound.rewind();
     animalSound.play();
   }
  }
  
  void findPlayer(int playerX, int playerY){
    //move towards player position
    if(playerX > xPos){
      xPos += speed; 
    }else{
      xPos -= speed; 
    }
    if(playerY > yPos){
      yPos += speed; 
    }else{
      yPos -= speed; 
    }
  }
  
  void display(){
    
    if(life > 0){
      
      
//      rectMode(CENTER);
//      rect(xPos, yPos, aWidth, aHeight);
    }else{
      xPos = -10;
      yPos = -10;
      speed = 0;  
    }
  }
  
}
