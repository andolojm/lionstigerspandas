
public class Lion extends Animal {
  Lion(){
    a = new Animation('l');
    xPos = (int)random(width);
    yPos = height;
    aHeight = 30;
    aWidth = 48;
    life = 10;
    damage = 1;
    speed = 1;
  }
}
