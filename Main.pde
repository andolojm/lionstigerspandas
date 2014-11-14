Scoreboard board;
int location; //1 = Main Menu, 2 = Game, 3 = Losing Screen, 4 = Instructions

void setup() {
  size(800,850);
  board = new Scoreboard();
  location = 1;
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
}
