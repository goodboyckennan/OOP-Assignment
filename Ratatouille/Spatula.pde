class Spatula extends GameObject{
  
  
  Spatula(){
    this(width/2,height/2,random(0,TWO_PI),true);
    
  }
  
  Spatula(int x,int y,float t,boolean a){
    theta = t;
    alive = a;
    pos.x = x;
    pos.y = y;
    
    /*
    if(theta < HALF_PI){
      pos.x = -50;
      pos.y = random(0,height);
    }
    if(theta > HALF_PI && theta < PI){
      pos.x = random(0,width);
      pos.y = 0;
    }
    */
  }
  
  void update(){  
    speed = 2.0f;
    forward.x = sin(theta)*speed;
    forward.y = -cos(theta)*speed;
    pos.add(forward);
    println(theta);
    println(pos);
   if(pos.x < -50){
     pos.x = width+50;
   }
   if(pos.x > width+50){
     pos.x = -50;
   }
   if(pos.y < 100){
     pos.y = height+50;
   }
   if(pos.y > height){
     pos.y = 0;
   }
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
