class GameObject{
  PVector pos;
  PVector forward = new PVector(0,-1);
  float x,y;
  float theta;
  color colour;
  boolean alive;
  
  GameObject(){
    alive = true; 
    pos = new PVector(width/2,height/2);
    forward = new PVector(0,-1);
  }

  void move(){
  }

  void display(){
    println("display gelling called!");
  }
}
