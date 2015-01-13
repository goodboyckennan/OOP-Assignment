class Score{
  String[] name;
  int[] score;
  String[] line;
  int x, y;
  
  Score(){
    
  }
  
  Score(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    stroke(255);
    noFill();
    rect(x-30,y-20,250,270);

     textAlign(LEFT,TOP);
     for(int i = 0; i < 10; i++){
       if(i == 0){
         textSize(25);
         fill(255,215,0);
       }else if(i == 1){
         textSize(20);
         fill(192,192,192);
       }else{
         textSize(15);
         fill(205,127,50);
       }
      text((i+1) +"  "+name[i],x,y+(i*25));
      text(score[i],x+150,y+(i*25));
    }
  }
  
  void loadHighScore(){    
  name = new String[line.length];
  score = new int[line.length];    
  
  for(int i = 0; i < line.length; i++){
    String[] data = split(line[i],",");
    name[i] = data[0];
    score[i] = parseInt(data[1]);
  }
  //sort data
  for(int i = 0; i < (score.length - 1); i++){
    for(int j = 0; j < (score.length - i - 1); j++  ){
      if(score[j] < score[j+1]){  
        int scoreTemp = score[j];
        score[j] = score[j+1];
        score[j+1] = scoreTemp;
        
        String nameTemp = name[j];
        name[j] = name[j+1];
        name[j+1] = nameTemp;
      }
    }
  }
 }
 

}
