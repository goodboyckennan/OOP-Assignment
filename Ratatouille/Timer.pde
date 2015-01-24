class Timer{
  int second = 0;
  int minute = 0;
  int x,y,start;
  
  Timer(int x,int y,int start){
    this.x = x;
    this.y = y;
    this.start = start;
  }
  
  void display(){
    if((millis() - start)  >= 1000){
      second+=1;
      start =  millis();
    }  
    if(second == 60){
      minute++;
      second = 0;
    }
    text("0" + minute +":"+second,x,y);
  }
}
