class GameObject{
  PVector pos;
  PVector forward = new PVector(0,-1);
  float x,y,w,h;
  float theta;
  color colour;
  boolean alive;
  float speed = 2.0;
  
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
  
  boolean collide(GameObject e){
    float cRad = (w/2.0f) + (e.w/2.0f);
    return PVector.dist(pos,e.pos) < cRad;
  }
}
