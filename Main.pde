import ddf.minim.*;

Scoreboard board;
int location; //1 = Main Menu, 2 = Game, 3 = Losing Screen, 4 = Instructions
Player player;
Dart[] darts; 
boolean[] playerControls;
ArrayList<Animal> animals;
final int DART_MAX = 100;

//sound
Minim minim;
AudioPlayer sound_theme;
AudioPlayer sound_gun;
AudioPlayer sound_animal;

void setup() {
  size(800,850);
  board = new Scoreboard();
  location = 1;
  player = new Player();
  darts = new Dart[DART_MAX];
  animals = new ArrayList<Animal>();
  
  //load in our sounds
  minim = new Minim(this);
  sound_theme= minim.loadFile("sound/Undaunted.mp3", 2048);
  sound_gun = minim.loadFile("sound/Gun_Fire.mp3", 2048);
  sound_animal = minim.loadFile("sound/lion_roar.mp3", 2048);
  
  animals.add(new Lion(sound_animal));

  
  playerControls = new boolean[5];
  for(int i = 0; i < playerControls.length; i++){
    playerControls[i] = false; 
  }
}

void draw() {
  if(location == 1){ //main menu
    playMenuFrame();
  } else if(location == 2){ //game
    playGameFrame();
    handlePlayerControls();
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
      dart.collisionDetection(animals);
    }
  } 
  for(Animal animal:animals){
    animal.findPlayer(player.xPos, player.yPos);
    animal.display();
  }
  player.collisionDetection(animals);
  
  if(!sound_theme.isPlaying()){
      sound_theme.rewind();
      sound_theme.play();
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
      playerControls[0] = true;    
      break;
    case 65:
    case LEFT:       
      playerControls[1] = true; 
      break;
    case 87:
    case UP:         
      playerControls[2] = true; 
      break;
    case 83:
    case DOWN:       
      playerControls[3] = true; 
      break;
    case 32:
      playerControls[4] = true; 
      break;
    case ESC:
      location = 3;
  }
}
void keyReleased()
{
  switch (keyCode){
    case 68:
    case RIGHT:   
      playerControls[0] = false;    
      break;
    case 65:
    case LEFT:       
      playerControls[1] = false; 
      break;
    case 87:
    case UP:         
      playerControls[2] = false; 
      break;
    case 83:
    case DOWN:       
      playerControls[3] = false; 
      break;
    case 32:
      playerControls[4] = false; 
      break;
  }
}

void handleLosingKeyEvents(){
  location = 1;
}

void handleInstructionsKeyEvents(){
  location = 1;
}

void handlePlayerControls(){
  if(playerControls[0]){
    player.right();
  }
  if(playerControls[1]){
    player.left();
  }
  if(playerControls[2]){
    player.up();
  }
  if(playerControls[3]){
    player.down();
  }
  if(playerControls[4]){
    player.shoot(sound_gun);
  }
}
