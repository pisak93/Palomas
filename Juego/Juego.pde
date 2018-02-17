int enemigosStart[];
float enemigosX[];
float enemigosY[];
float enemigosEstado[];
float enemigosVelocidad[];
int puntaje=0;

float posX=400;
float posY=600;

float startX=0;
float startY=0;

float destinoX=0;
float destinoY=0;

boolean disparando = false;

PFont font;

PImage fondo;
PImage paloma;
PImage palomaReves;
PImage canon;
PImage red;

void setup(){
  size(1000,800);
  fondo = loadImage("fondo.png");
  paloma = loadImage("paloma.png");
  palomaReves = loadImage("paloma-reves.png");
  canon= loadImage("canon.png");
  red= loadImage("red.png");
  enemigosStart= new int[100];
  enemigosX= new float[100];
  enemigosY= new float[100];
  enemigosEstado= new float[100];
  enemigosVelocidad= new float[100];
  
 font = loadFont("Blanch-Condensed-48.vlw");
  
  for(int i =0;i<100;i++){
    enemigosStart[i]=int(random(0,2));
    if(enemigosStart[i]==0){
      enemigosX[i]=random(-5000,0);
    }
    else{
      enemigosX[i]=random(1000,6000);
    }
    enemigosY[i]=random(50,150);
    enemigosEstado[i]=1;
    enemigosVelocidad[i]=random(3,5);
  }
  startX=posX;
  startY=posY;
}

void draw(){
  puntaje=0;
  for(int i =0;i<100;i++){
    
    if(enemigosEstado[i]==0){
      puntaje++;
    }
  }
  
  
  image(fondo,0,0,1000,800);
  fill(0,0,0);
  textFont(font);
  textSize(72);
  text("Score: ",40,700);
  text(puntaje,180,700);
  fill(255,0,0);
  image(canon,mouseX-60,posY,120,120);
  
  
  if(mousePressed && !disparando){
   
    fill(255,255,0);
    disparando=true;
    destinoX=mouseX;
    destinoY=mouseY;
    
  }
  if(disparando){
    startY-=10;
    image(red,destinoX,startY,57,20);
  for(int i =0;i<100;i++){
    if(enemigosX[i]>=destinoX && enemigosX[i]<=destinoX+57 && enemigosY[i]>=startY && enemigosY[i]>=startY+20){
      enemigosEstado[i]=0;
    }
    
  }
    if(startX>=1000 || startY<=0){
    startX=posX;
    startY=posY;
    disparando=false;}
  }
  
  for(int i =0;i<100;i++){
    if(enemigosEstado[i]==1){
      
    if(enemigosStart[i]==0){
      enemigosX[i]+=enemigosVelocidad[i];
      image(palomaReves,enemigosX[i],enemigosY[i],55,45);
      
    }
    else{
      enemigosX[i]-=enemigosVelocidad[i];
      image(paloma,enemigosX[i],enemigosY[i],55,45);
    }
    }
    
    
  }
  
  

}