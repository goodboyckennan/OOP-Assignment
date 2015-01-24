class UI{
  
  UI(){
  
  }
  
  void stats(){
    //stat background
    fill(0);
    noStroke();
    rect(0,0,width,50);
  
    //timer 
    fill(255);
    textSize(25);
    textAlign(CENTER);
    timer.display();
    
    //player stats
    textSize(16);  
    textAlign(LEFT); 
    fill(players.get(0).colour);
    text("Player 1",10,20);
    text("Points: " + parseInt(players.get(0).points),10,40);
  
    textAlign(RIGHT);
    fill(players.get(1).colour);
    text("Player 2",width-10,20);
    text("Points: " + parseInt(players.get(1).points),width-10,40);   
  }

}
