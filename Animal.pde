import ddf.minim.*;
public abstract class Animal {
  float xPos;
  float yPos;
  int aHeight;
  int aWidth;
  int life;
  int damage;
  int scoreValue;
  float speed;
  Animation a;

  long timeToAttack;
  final long ATTACK_DELAY = 500;

  long timeToAnimate;
  final long ANIMATE_DELAY = 200;
  PImage temp = new PImage();

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

      if(millis() >= timeToAnimate)
        {
          temp=a.drawAnimation(aWidth,aHeight);
          timeToAnimate = millis() + ANIMATE_DELAY;
        }  
          image(temp,xPos,yPos);
      
//      rectMode(CENTER);
//      rect(xPos, yPos, aWidth, aHeight);
    }else{
      if(xPos > -1000){
        board.addScore(scoreValue);
      }
      xPos = -1000;
      yPos = -1000;
      speed = 0;  
    }
  }
  
  void reset(){
    xPos = -1000;
    yPos = -1000;
    speed = 0;
  }
  
}
