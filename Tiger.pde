public class Tiger extends Animal {
  Tiger(AudioPlayer a_sound_animal){
    a = new Animation();

    a.setAnimationType('t');

    xPos = width;
    yPos = (int)random(height);
    aHeight = 30;
    aWidth = 48;
    scoreValue = 15;
    life = 10;
    damage = 1;
    speed = 1;
    
    timeToAttack = millis();
    
    //sound
    this.sound_animal = a_sound_animal;
    
  }
}
