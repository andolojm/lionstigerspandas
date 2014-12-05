class Spawner{
  //animal sounds
  AudioPlayer sound_lion;
  AudioPlayer sound_tiger;
  AudioPlayer sound_panda;
  
  //animal spawn number
  int spawn_lion;
  int spawn_tiger;
  int spawn_panda;
  
  //spawn time
  int last_spawn;
  int spawn_delay = 5;
  int reduce_delay = 10;
  
  Spawner(AudioPlayer sound_lion, AudioPlayer sound_tiger, AudioPlayer sound_panda){
   this.sound_panda = sound_panda;
   this.sound_tiger = sound_tiger;
   this.sound_lion = sound_lion;
   last_spawn = 0;
  } 
  
  void spawn(int time){
    if(last_spawn + spawn_delay < time){
      last_spawn = time;
      if(reduce_delay < time){
        if(spawn_delay != 0){
          spawn_delay -= 1;
        }
        reduce_delay += reduce_delay; 
      }
      
      spawnRandom();
    }
  }
  
  void spawnRandom(){
     int animal = (int)random(1,4);
     
     switch(animal){
       case 1: animals.add(new Lion(sound_lion));
               break;
       case 2: animals.add(new Tiger(sound_tiger));
               break;
       case 3: animals.add(new Panda(sound_panda));
               break;
     }
  }
  void reset(){
    spawn_delay = 5;
    reduce_delay = 10;
    last_spawn = 0;
  }
}
