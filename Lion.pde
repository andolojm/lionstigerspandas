public class Lion extends Animal {
  Lion(AudioPlayer a_sound_animal){
    a = new Animation();

    a.setAnimationType('l');

    xPos = (int)random(width);
    yPos = height;
    aHeight = 45;
    aWidth = 55;
    life = 8;
    scoreValue = 10;
    damage = 1;
    speed = 1.5;
    
    timeToAttack = millis();
    
    //sound
    this.sound_animal = a_sound_animal;
    
  }
}
