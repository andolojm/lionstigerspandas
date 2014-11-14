Scoreboard board;
int location; //1 = Main Menu, 2 = Game, 3 = Losing Screen, 4 = Instructions

void setup() {
  size(800,850);
  board = new Scoreboard();
  location = 1;
}

void draw() {
  if(location == 1){ //main menu
    background(255);
    board.showMenu();
  } else if(location == 2){ //game
    background(255);
    board.showScore();
    board.showTime();
    board.showLife(55);
  } else if(location == 3){ //you lose
    
  } else if(location == 4){ //instructions
    
  }
}

void keyPressed() {
  if(location == 1){ //main menu
    board.reset();
    location = 2;
  } else if(location == 2){ //game
    //big ol switch of game key-down events
    switch(key){
      case 'r':
        location = 3;
        break; 
    }
  } else if(location == 3){ //you lose
    location = 1;
  } else if(location == 4){ //instructions
    location = 1;
  }
}
