class Scoreboard {
  
  private int score;
  private PFont font;
  private int starttime;
  
  Scoreboard(){
    score = 0;
    font = loadFont("SakkalMajalla-48.vlw");
  }
  
  void addScore(int addition){
    score += addition;
  }
  
  void showScore(){
    fill(0,0,0);
    rect(0,0,800,50);
    rect(10,100,48,30);
    rect(100,60,30,48);
    rect(100,792,30,48);
    textFont(font,50);
    fill(255,255,255);
    text("Score: " + score,10,35);
  }
  
  void showTime(){
    textFont(font,50);
    fill(255,255,255);
    text(getTime(),220,35);
  }
  
  private String getTime(){
    int millis = millis();
    millis -= starttime;
    int seconds = millis / 1000;
    int minutes = 0;
    while(seconds >= 60){
      seconds -= 60;
      minutes += 1; 
    }
    String strSeconds = Integer.toString(seconds);
    if(seconds < 10){
      strSeconds = "0" + strSeconds; 
    }
    return minutes + ":" + strSeconds;
  }
  
  void showLife(int life){
    fill(255,255,255);
    text("Health: ",350,35);
    while(life > 0){
      int green = life * 4;
      int red = 200 - green;
      fill(red,green,0);
      textFont(font,50);
      rect((life * 6) + 460,5,6,35);
      life -= 1;
    }
  }
  
  void reset(){
    starttime = millis();
  }
  
  void showMenu(){
    
  }
}

