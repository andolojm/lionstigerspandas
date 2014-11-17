import ddf.minim.*;
import java.lang.*;
public abstract class Animal {
  Minim minim;
  int xPos;
  int yPos;
  int aHeight;
  int aWidth;
  int life;
  int damage;
  int speed;
  
  AudioPlayer animalSound;
  
  
  
  void roar(){
   //random roar function 
   if((random(50) % 2) == 0){
     animalSound.rewind();
     animalSound.play();
   }
  }
  
  void findplayer(int playerX, int playerY){
    //move towards player position
    if(playerX > xPos){
      xPos++; 
    }else{
      xPos--; 
    }
    if(playerY > yPos){
      yPos++; 
    }else{
      yPos--; 
    }
  }
  
}
