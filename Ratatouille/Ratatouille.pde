import ddf.minim.*;

ArrayList<Player> players = new ArrayList<Player>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];
PFont font;
PImage design1;
int gameState = 0;
Player p;

Minim minim = new Minim(this);
AudioPlayer foodHit;

Score tagScore;
Score survivalScore;
 Timer timer;
void setup(){
  size(600, 600);
  font = loadFont("copperplate.vlw");
  design1 = loadImage("");
  setUpPlayerControllers();
 
  //objects.add(new Food(200,200,50,50));
  //objects.add(new Spatula(400,200,random(TWO_PI),true));
 //objects.add(new Spatula(200,200,random(TWO_PI),true));
  
  tagScore = new Score(50,150);
  tagScore.line = loadStrings("tag.csv");
  survivalScore = new Score(350,150);
  survivalScore.line = loadStrings("survival.csv");
  
  foodHit = minim.loadFile("move.wav");
  timer = new Timer(width/2,35,millis());
}

void draw(){
  background(0);
  
  switch(gameState){
    case 0:
      gameMenu();
      break;
    case 1:
      Tutorial();
      break;
    case 3:
      highScore();
      break;
  }

 
}

void gameMenu(){
  fill(16,136,240);
  ellipse(width/2,150,550,150);
  
  for(Player player:players){
    player.update();
    player.display();
  }
    
  fill(255);
  textFont(font);
  textSize(60);
  textAlign(CENTER,CENTER);
  text("Ratatouille",width/2,150);
  textSize(16);
  text("(By: Kennan Lyle Seno)",width/2,200);
  
  textSize(24); 
  text("Play Tag",width/2,300);
  text("Play Survival",width/2,350);
  text("Highscore",width/2,400);
  text("Exit",width/2,450);
  
  if(mousePressed){
    if((mouseX > 240 && mouseX < 360) && (mouseY > 280 && mouseY < 320)){
      gameState = 1;
    }else if((mouseX > 230 && mouseX < 380) && (mouseY > 390 && mouseY < 410)){
      gameState = 3;
    }else if((mouseX > 275 && mouseX < 325) && (mouseY > 440 && mouseY < 460)){
      exit();
    }
  }
}

void tutorial(){

}

void playTagGame(){
  gameFloor();
  spawnFood();
  
  for(int i = 0; i < objects.size(); i++){
    objects.get(i).display();
    objects.get(i).update();
  }
  
  for(Player player:players){
    if(player.life > 0){
      player.update();
      player.display();
    }  
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
  
  

  statInterface();
}

void highScore(){
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

void gameFloor(){
  fill(0);
  int gap = 50;
   
  //make blocks with grey and white colours
  stroke(128,128,128);
  for(int i = 0; i <= 12; i++){
    for(int j = 1; j <= 12; j++){
      if(i % 2 == 0){
        if(j % 2 == 1) fill(216,216,216);
        else fill(255);        
      }else{
        if(j % 2 == 0) fill(216,216,216);
        else fill(255);   
      }
       rect(i*gap,j*gap,gap,gap);
    }
  }
  //create black diamond on the floor  
  noStroke();
  fill(0);
  for(int i = 0; i <= 12; i++){
    for(int j = 1; j <= 12; j++){
      quad((gap*i)-15,(gap*j),(gap*i),(gap*j)-15,(gap*i)+15,(gap*j),(gap*i),(gap*j)+15);    
    }
  } 
  
}

void statInterface(){
  fill(0);
  stroke(255);
  rect(0,0,width,50);
  
  fill(255);
  textSize(25);
  textAlign(CENTER);
  timer.display();
  
  textSize(16);
  
  textAlign(LEFT); 
  fill(players.get(0).colour);
  text("Life: " + parseInt(players.get(0).life),10,20);
  text("Points: " + parseInt(players.get(0).points),10,40);
  
  textAlign(RIGHT);
  fill(players.get(1).colour);
  text("Life: " + parseInt(players.get(1).life),width-10,20);
  text("Points: " + parseInt(players.get(1).points),width-10,40);  
  
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



