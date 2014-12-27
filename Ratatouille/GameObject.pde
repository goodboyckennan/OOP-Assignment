class GameObject{
  PVector pos;
  PVector forward = new PVector(0,-1);
  float x,y;
  float theta;
  color colour;
  boolean alive;
  float speed;
  
  GameObject(){
    alive = true; 
    pos = new PVector(width/2,height/2);
    //forward = new PVector(0,-1);
  }

  void update(){
  }

  void display(){
    println("display gelling called!");
  }
}
