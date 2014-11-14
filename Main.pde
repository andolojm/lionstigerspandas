Scoreboard board;
int location; //1 = Main Menu, 2 = Game, 3 = Losing Screen, 4 = Instructions
Player player;
Dart[] darts;
ArrayList<Animal> animals;
int dartCounter; //dart index to shoot next
final int DART_MAX = 100;

void setup() {
  size(800,850);
  board = new Scoreboard();
  location = 1;
  player = new Player();
  darts = new Dart[DART_MAX];
  dartCounter = 0;
}

void draw() {
  if(location == 1){ //main menu
    playMenuFrame();
  } else if(location == 2){ //game
    playGameFrame();
  } else if(location == 3){ //you lose
    playLosingFrame();
  } else if(location == 4){ //instructions
    playInstructionsFrame();
  }
}

void keyPressed(){
  if(location == 1){ //main menu
    handleMenuKeyEvents();
  } else if(location == 2){ //game
    handleGameKeyEvents();
  } else if(location == 3){ //you lose
    handleLosingKeyEvents();
  } else if(location == 4){ //instructions
    handleInstructionsKeyEvents();
  }
}


void playGameFrame(){
  background(255);
  board.showScore();
  board.showTime();
  board.showLife(player.life);
  
  player.display();
  for(Dart dart:darts){
    if(dart != null){
      dart.move();
      dart.display(); 
    }
  } 
}

void playMenuFrame(){
  board.showMenu(); 
}

void playLosingFrame(){
  
}

void playInstructionsFrame(){
  
}

void handleMenuKeyEvents(){
  board.reset();
  location = 2;
}

void handleGameKeyEvents(){
  switch (keyCode){
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
      break;
    case ESC:
      location = 3;
  }
}

void handleLosingKeyEvents(){
  location = 1;
}

void handleInstructionsKeyEvents(){
  location = 1;
}
