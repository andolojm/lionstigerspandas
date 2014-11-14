Scoreboard board;
int location; //1 = Main Menu, 2 = Game, 3 = Losing Screen, 4 = Instructions
Player player;
Dart[] darts;
int dartCounter; //dart index to shoot next
final int DART_MAX = 10;

void setup() {
  size(800,850);
  board = new Scoreboard();
  location = 2;
  
  player = new Player();
  darts = new Dart[DART_MAX];
  dartCounter = 0;
}

void draw() {
  if(location == 1){
        
  } else if(location == 2){ //game
    
  } else if(location == 3){ //you lose
    
  } else if(location == 4){ //instructions
    
  }
  
  fill(0,0,0);
  rect(0,0,300,300);
  
  background(255);
  board.showScore();
  board.showTime();
  board.showLife(55);
  
  player.display();
  for(Dart dart:darts){
    if(dart != null){
      dart.move();
      dart.display(); 
    }
  }
}
void keyPressed()
{
  switch (keyCode)
  {
  case 68:
  case RIGHT:      
    player.right();
    break;
  case 65:
  case LEFT:       
    player.left();
    break;
  case 87:
  case UP:         
    player.up();
    break;
  case 83:
  case DOWN:       
    player.down();
    break;
  case 32:
    player.shoot(dartCounter);
    dartCounter++;
    if(dartCounter > DART_MAX -1){
     dartCounter = 0; 
    }
    
  }
  
}
