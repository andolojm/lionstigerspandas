public class Animation{
  PImage spritesheet = loadImage("gfx/ltp_ss.png");
  int DIM = 8;

  int W = spritesheet.width/DIM;
  int H = spritesheet.height/DIM;
  PImage[] lsprites = new PImage[DIM*DIM];
  char aType;
  int toggle = 0;

  Animation(){
    imageMode(CENTER);
    createAnimation();
  }
  void createAnimation(){
    for (int i=0; i<lsprites.length; i++) {
      int x = i%DIM*W;
      int y = i/DIM*H;
      lsprites[i] = spritesheet.get(x, y, W, H);
    }
  }
  void setAnimationType(char a){
    aType=a;
  }
  PImage drawAnimation(int aWidth, int aHeight) {
    //LSPRITES 9-18 are the player (4)
    //         6-8 are the monkey (3)
    //         4-5 are the lion (1)
    //         2-3 are the tiger (2)
    //         0-1 are the panda bear (0)
    PImage temp = new PImage();
    
    switch(aType){
       default: break;
       case'l':
             if(toggle==0){
               lsprites[4].resize(aHeight,aWidth);
               temp= lsprites[4];
               toggle=1;
              } else {
                lsprites[5].resize(aHeight, aWidth);
                temp = lsprites[5];
                toggle=0;
              }
           break;  
       case't':
             if(toggle==0){
               lsprites[2].resize(aHeight,aWidth);
               temp= lsprites[2];
               toggle=1;
              }else{
                lsprites[3].resize(aHeight, aWidth);
                temp = lsprites[3];
                toggle=0;
              }
           break;  
       case'b':
             if(toggle==0){
               lsprites[0].resize(aHeight,aWidth);
               temp= lsprites[0];
               toggle=1;
              }else{
                lsprites[1].resize(aHeight, aWidth);
                temp = lsprites[1];
                toggle=0;
              }
              break;
        case 'p':
               lsprites[16].resize(aHeight,aWidth);
               temp= lsprites[16];
              break;
       case'a':
             if(toggle==0){
               lsprites[9].resize(aHeight,aWidth);
               temp= lsprites[9];
               toggle=1;
              }else{
                lsprites[10].resize(aHeight, aWidth);
                temp = lsprites[10];
                toggle=0;
              }
              break;
       case'd':
             if(toggle==0){
               lsprites[11].resize(aHeight,aWidth);
               temp= lsprites[11];
               toggle=1;
              }else{
                lsprites[12].resize(aHeight, aWidth);
                temp = lsprites[12];
                toggle=0;
              }
              break;
       case's':
             if(toggle==0){
               lsprites[17].resize(aHeight,aWidth);
               temp= lsprites[17];
               toggle=1;
              }else{
                lsprites[18].resize(aHeight, aWidth);
                temp = lsprites[18];
                toggle=0;
              }
              break;
       case'w':
             if(toggle==0){
               lsprites[14].resize(aHeight,aWidth);
               temp= lsprites[14];
               toggle=1;
              }else{
                lsprites[15].resize(aHeight, aWidth);
                temp = lsprites[15];
                toggle=0;
              }
              break;

    }
    
    return temp;
  }
} 

