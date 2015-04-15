/*
  Controls: 
      Player 1: WASD and E to eat food
      Player 2: IJKL and P to eat food 
*/

import ddf.minim.*;

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];
PFont font;
PImage design1;
int gameState = 0;
Player p;

int currentLetter;
int currentSlot;
char letter[];
char name[]; 
String highScore = ""; 
Minim minim = new Minim(this);
AudioPlayer foodHit;
AudioPlayer bgm;
AudioPlayer menuMusic;

Score tagScore;
Score survivalScore;
Menu menu;
Floor floor;
UI ui;
Timer timer;

void setup(){
  size(600, 600);
  tagScore = new Score(50,150);
  floor = new Floor(width,height,50);
  menu = new Menu();
  ui = new UI();
  font = loadFont("copperplate.vlw");
  setUpPlayerControllers();
  
  letter = new char[] {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
  name = new char[] {'A','A','A'};
  currentSlot = 0;
  currentLetter = 0;
  survivalScore = new Score(350,150);
  
  bgm = minim.loadFile("bgm.mp3");
  foodHit = minim.loadFile("move.wav");
  menuMusic = minim.loadFile("main_menu_music.mp3");
  timer = new Timer(width/2,35,millis());
}

void draw(){
  background(0);
  
  switch(gameState){
    case 0:
      menu.gameMenu();
      if(!menuMusic.isPlaying()){
        menuMusic.rewind(); 
        menuMusic.play();  
      }        
      break;
    case 1:
      menu.tutorial();
      break;
    case 2:
      playTagGame();
      break;   
    case 3:
      highScore();
      break;
  } 
}

//gameplay
void playTagGame(){
  floor.display();
  
  //change to 2min when done testing
  if(timer.minute < 2){
    //backround music
    if(!bgm.isPlaying()){
      bgm.rewind(); 
      bgm.play(); 
      menuMusic.pause(); 
    }
    
    //display food
    spawnFood();
    for(int i = 0; i < objects.size(); i++){
      objects.get(i).display();
      objects.get(i).update();
    }
     //display players
    for(Player player:players){
      if(player.life > 0){
        player.update();
        player.display();
      }
      //collision code  
      for(int i = 0; i < objects.size(); i++){
        if(player.collide(objects.get(i))){
          if(keyPressed){
            if(key == player.button1){
              player.points += 500;
              objects.remove(i);
              foodHit.rewind();
              foodHit.play();
            }
          }
        }
      }
    }
    ui.stats();
  }else{
    menu.gameResult();
    bgm.pause();
  }
}

//reset stats
void resetStats(){
  int gap = width / (players.size() + 1);
  
  for(int i = 0; i < players.size(); i++){
    Player p = players.get(i);
    p.pos.x =  (i + 1) * gap;
    p.pos.y = 300;
    p.theta = 0;
    p.points = 0;   
  }
  timer.minute = 0;
  timer.second = 0;
  currentSlot = 0;
  currentLetter = 0;
  name[currentSlot] = letter[currentLetter];
}

//high score page
void highScore(){
   //load file
   tagScore.line = loadStrings("tag.csv");
   survivalScore.line = loadStrings("survival.csv");
  
   tagScore.loadHighScore();
   survivalScore.loadHighScore();
   
   tagScore.display();
   survivalScore.display();
  
  fill(16,136,240);
  ellipse(150,95,80,30);
  ellipse(450,95,80,30);
  
  fill(255);
  textAlign(CENTER);
  text("Tag",150,100);
  text("Survival",450,100);
  textSize(40);
  text("High Score",width/2,50); 
  textSize(24);
  text("Main Menu",width/2,500);  
  
  if(mousePressed){
    if((mouseX > 230 && mouseX < 370) && (mouseY > 480 && mouseY < 500)){
      gameState = 0;
    }
  }  
}

//food spawn alg
void spawnFood(){
   if(timer.second % 5 == 0){
     if(frameCount % 60 == 0){  
        objects.add(new Food(random(width),random(50,height),50,50));
     } 
    } 
    if(timer.second % 10 == 0){
      if(frameCount % 60 == 0){
        objects.clear();
      }
    }  
}


boolean checkKey(char theKey){
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName){
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value)) {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value)) {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value)) {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value)) {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers(){
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  {
    XML playerXML = children[i];
           p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML
            );
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
    players.add(p);         
  }
}

void keyPressed(){
  keys[keyCode] = true;
}

void keyReleased(){
  keys[keyCode] = false;
}


