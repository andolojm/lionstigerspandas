import ddf.minim.*;

public class Lion extends Animal {
  Lion(AudioPlayer a_sound_animal){
    a = new Animation();

    a.setAnimationType('l');

    xPos = (int)random(width);
    yPos = height;
    aHeight = 30;
    aWidth = 48;
    life = 10;
    damage = 1;
    speed = 1;
    
    timeToAttack = millis();
    
    //sound
    
    this.sound_animal = a_sound_animal;
    
  }
}
