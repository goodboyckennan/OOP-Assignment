class Floor{
  int w,h,gap;
  int xCycle, yCycle;
  
  Floor(){
    this(width/2,height/2,50);  
  }
  Floor(int w, int h, int g){
    this.w = w;
    this.h = h;
    this.gap = g;
  }
  
  void display(){
  fill(0);  
  xCycle = w/gap;
  yCycle = h/gap;
   
  //make blocks with grey and white colours
  stroke(128,128,128);
  for(int i = 0; i <= xCycle; i++){
    for(int j = 1; j <= yCycle; j++){
      if(i % 2 == 0){
        if(j % 2 == 1) fill(216,216,216);
        else fill(255);        
      }else{
        if(j % 2 == 0) fill(216,216,216);
        else fill(255);   
      }
       rect(i*gap,j*gap,gap,gap);
    }
  }
  //create black diamond on the floor  
  noStroke();
  fill(0);
  for(int i = 0; i <= xCycle; i++){
    for(int j = 1; j <= yCycle; j++){
      quad((gap*i)-15,(gap*j),(gap*i),(gap*j)-15,(gap*i)+15,(gap*j),(gap*i),(gap*j)+15);    
    }
  }   
}
  
}
