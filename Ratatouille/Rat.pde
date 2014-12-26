class Rat extends GameObject{
  float w;
  float h;
  
  
  Rat(){
    pos.x = 250;
    pos.y = 250;
    w = 20;
    h = 20;
    colour = color(255);
  }
  
  Rat(float x, float y){
    pos.x = x;
    pos.y = y;
    w = 20;
    h = 20;
    colour = color(255);
  }
  
  Rat(float x, float y, float w, float h){
   pos.x = x;
   pos.y = y;
   this.w = w;
   this.h = h;
   colour = color(255);  
 } 
 
 void display(){
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(theta);
   
   stroke(colour);  
   float halfWidth = w / 2;
   float halfHeight = h / 2;
   
   line(-halfWidth, halfHeight,0, - halfHeight);
   line(0,  - halfHeight, halfWidth,  halfHeight);
   line(halfWidth,  halfHeight, 0, 0);
   line(0,0,  - halfWidth,  halfHeight); 
   
   popMatrix();
 
 }
 
  void move(){
   
    forward.x = sin(theta);
    forward.y = -cos(theta);
    if (keyPressed)
    {
      switch (key)
      {
        case 'w':
          pos.add(forward);
          break;
        case 's':
          pos.sub(forward);
          break;
        case 'a':
          theta -= 0.1f;
          break;
        case 'd':
          theta += 0.1f;
      }
    }
  }
 
}
