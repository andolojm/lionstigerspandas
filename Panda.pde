public class Panda extends Animal {
  Panda(AudioPlayer a_sound_animal){
    a = new Animation();

    a.setAnimationType('b');

    xPos = 0;
    yPos = (int)random(height);
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
