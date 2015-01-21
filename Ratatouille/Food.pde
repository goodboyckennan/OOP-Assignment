class Food extends GameObject{ 
  
  Food(){
  
  } 
  Food(float x, float y,float w,float h){
    pos.x = x;
    pos.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update(){
  
  }
  
  void display(){
    //inner circle
    noStroke();
    fill(255,255,102);
    ellipse(pos.x,pos.y,w,h);
    
    //outer circle
    fill(255,255,0);
    ellipse(pos.x,pos.y,w-10,h-10);
    
    //small spots
    fill(204,204,0);
    ellipse(pos.x+10,pos.y+10,w/5,h/5);
    ellipse(pos.x-10,pos.y-15,w/5,h/5);
    ellipse(pos.x-5,pos.y+10,w/7,h/7);
    ellipse(pos.x+10,pos.y-15,w/7,h/7);
  }
}
