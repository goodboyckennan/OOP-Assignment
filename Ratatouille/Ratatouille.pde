ArrayList<Player> players = new ArrayList<Player>();
ArrayList<GameObject> objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];

void setup(){
  size(600, 600);
  setUpPlayerControllers();
  objects.add(new Spatula(200,200));
  
}

void draw(){
  background(255);
  gameFloor();
  
  for(Player player:players){
    if(player.life > 0){
      player.update();
      player.display();
    }
  }
  
  objects.get(0).display(); 
  objects.get(0).update(); 
}

void keyPressed(){
  keys[keyCode] = true;
}

void keyReleased(){
  keys[keyCode] = false;
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
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
    players.add(p);         
  }
}

void gameFloor(){
  fill(0);
  int gap = 50;
  
  
  stroke(128,128,128);
  for(int i = 0; i <= 12; i++){
    if(i % 2 == 1){
      fill(216,216,216);
    }else{
      fill(255);
    }
    
    for(int j = 1; j <= 12; j++){
       rect(i*gap,j*gap,gap,gap);
    }
  } 
  
  noStroke();
  fill(0);
  for(int i = 0; i <= 12; i++){
    for(int j = 1; j <= 12; j++){
      quad((gap*i)-15,(gap*j),(gap*i),(gap*j)-15,(gap*i)+15,(gap*j),(gap*i),(gap*j)+15);    
    }
  } 
  
}
