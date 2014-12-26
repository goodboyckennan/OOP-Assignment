class Spatula extends GameObject{
  
  Spatula(){
    this(width/2,height/2);
  }
  
  Spatula(float x, float y){
    pos.x = x;
    pos.y = y;
  }
  
  void update(){
    theta += 0.1f;
  }
  
  void display(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    
    noStroke();
    rect(-4,5,7,30);
    ellipse(0,0,15,20);
    
    popMatrix();
  }
}
