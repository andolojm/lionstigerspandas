Scoreboard board;

void setup() {
  size(900,600);
  board = new Scoreboard();
}

void draw() {
  background(255);
  board.showScore();
}


Class Scoreboard {
  
  private int score;
  
  Scoreboard(){
    score = 0;
  }
  
  void addScore(int addition){
    score += addition;
  }
  
  void showScore(){
    fill(50,50,50
    rect(0,0,250,0);
    
  }
  
}

