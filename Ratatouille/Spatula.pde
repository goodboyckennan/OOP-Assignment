class Spatula extends GameObject{
  
  
  Spatula(){
    this(width/2,height/2,random(0,PI),true);
  }
  
  Spatula(float x, float y,float t,boolean a){
    pos.x = x;
    pos.y = y;
    theta = t;
    alive = a;
  }
  
  void update(){  
    speed = 2.0f;
    forward.x = sin(theta)*speed;
    forward.y = -cos(theta)*speed;
    pos.add(forward);
    
  }
  
  void display(){
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    
    fill(255,0,0);
    noStroke();
    rect(-4,5,7,30);
    ellipse(0,0,15,20);
    
    popMatrix();
  }
}
