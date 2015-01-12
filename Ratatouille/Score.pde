class Score{
  String[] name;
  int[] score;
  String[] line;
 
  
  Score(){
    
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
