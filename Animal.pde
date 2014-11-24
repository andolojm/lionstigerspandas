import ddf.minim.*;
public abstract class Animal {
  int xPos;
  int yPos;
  int aHeight;
  int aWidth;
  int life;
  int damage;
  int speed;
  Animation a;

  long timeToAttack;
  final long ATTACK_DELAY = 500;

  
  AudioPlayer sound_animal;
  
  
  
  void roar(){
    sound_animal.rewind();
    sound_animal.play(500);
  }
  
  int attack(){
    if(millis() >= timeToAttack){
      this.roar();
      timeToAttack = millis() + ATTACK_DELAY;
      return damage;
    }
    return 0;
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
