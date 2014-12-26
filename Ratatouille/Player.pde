class Player extends GameObject{
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
    
  Player(){
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml){
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
   void display(){    
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(theta);
   
   stroke(128,128,128);
   fill(128,128,128);
   ellipse(0,10,20,35);
   
   fill(colour);
   triangle(0,-15,-10,0,+10,0);
   
   fill(255);
   line(0,28,-5,35);
    
   popMatrix();
  }  
  
  void update(){
    forward.x = sin(theta);
    forward.y = -cos(theta);
    if (checkKey(up)){
      pos.add(forward);
    }
    if (checkKey(down)){
      pos.sub(forward);
    }
    if (checkKey(left)){
  
      theta -= 0.1f;
    }    
    if (checkKey(right)){
 
      theta += 0.1f;
    }
    if (checkKey(start)){
      println("Player " + index + " start");
    }
    if (checkKey(button1))  {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))  {
      println("Player " + index + " butt2");
    }
    if(pos.x < -35){
      pos.x = width + 30;
    }
    if(pos.x > width + 35){
      pos.x = -30;
    }      
  }
  
 
}
