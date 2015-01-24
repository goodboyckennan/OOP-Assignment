class Menu{
  
  Menu(){
   
  }
  
  void gameMenu(){
    fill(16,136,240);
    ellipse(width/2,150,550,150);
    
    fill(255);
    textFont(font);
    textSize(60);
   
    //logo
    textAlign(CENTER,CENTER);
    text("Ratatouille",width/2,150);
    textSize(16);
    text("(By: Kennan Lyle Seno)",width/2,200);
  
    //menu
    textSize(24); 
    text("Play Tag",width/2,300);
    text("Play Survival",width/2,350);
    text("Highscore",width/2,400);
    text("Exit",width/2,450);
  
    if(mousePressed){
      if((mouseX > 240 && mouseX < 360) && (mouseY > 280 && mouseY < 320)){
        gameState = 1;
      }else if((mouseX > 230 && mouseX < 380) && (mouseY > 390 && mouseY < 410)){
        gameState = 3;
      }else if((mouseX > 275 && mouseX < 325) && (mouseY > 440 && mouseY < 460)){
        exit();
      }
    }
  }

//Tutorial page
  void tutorial(){
    floor.display();
  
    fill(16,136,240);
    ellipse(width/2,height/2,500,300);
  
    textSize(16);
    textAlign(CENTER);
    fill(0);
    text("Goal: Eat as much food within 3 minutes!",width/2,220);
  
    //player 1 controls
    text("Player 1:",200,260);
    text("Up - " + "'"+players.get(0).up+"'",200,280);
    text("Down - " + "'"+players.get(0).down+"'",200,300);
    text("Left - " + "'"+players.get(0).left+"'",200,320);
    text("Right - " + "'"+players.get(0).right+"'",200,340);
    text("Eat Food - " + "'"+players.get(0).button1+"'",200,360);
         
    //player 2 controls
    text("Player 2:",400,260);
    text("Up - " + "'"+players.get(1).up+"'",400,280);
    text("Down - " + "'"+players.get(1).down+"'",400,300);
    text("Left - " + "'"+players.get(1).left+"'",400,320);
    text("Right - " + "'"+players.get(1).right+"'",400,340);
    text("Eat Food - " + "'"+players.get(1).button1+"'",400,360);
  
    fill(255);
    textSize(20);
    text("Play",width/2,425);
    if(mousePressed){
      if(mouseX > 270 && mouseX < 330 && mouseY > 415 && mouseY < 435){      
        gameState = 2;
      }
    }
  }
  
  void gameResult(){
   floor.display();
   int winner = 0;
    //set winner 
   if(players.get(0).points > players.get(1).points) winner = 1;
   else if(players.get(0).points < players.get(1).points) winner = 2;
   else if(players.get(0).points == players.get(1).points) winner = 0;
  
  fill(16,136,240);
  ellipse(width/2,height/2,500,300);
  
  //display result
  textSize(24);
  textAlign(CENTER);
  fill(0);
  if(winner != 0){
    text("Player " + winner + " wins!",width/2,200);
    text("Points: " + (int)(players.get(winner-1).points),width/2,230);
    text("Enter Name",width/2,290);
    int gap = 20;
    for(int i = 0; i < name.length; i++){
      int tempFill = currentSlot;
      if(tempFill == i){
        fill(255);
      }else{
        fill(0);
      }
      
      text(name[i],(width/2 - gap) + (i*gap),320);
    }
  }else{
    text("Draw!",width/2,200);
  }
  
  //check when writing name
  if(keyPressed){
    if(frameCount % 10 == 0){   
      if(key == players.get(winner-1).left && currentLetter > 0){
       currentLetter -= 1;  
      }
      if(key == players.get(winner-1).right  && currentLetter < 25){
       currentLetter += 1;  
      }
      if(key == players.get(winner-1).button1 && currentSlot < 3){
        currentSlot += 1;
        currentLetter = 0;
      }
    
    //save to csv file
      if(key == players.get(winner-1).button1 && currentSlot == 3){
        highScore = String.valueOf(name[0]) + String.valueOf(name[1]) + String.valueOf(name[2]) + "," + (int)(players.get(winner-1).points);     
        String[] list = split(highScore, ' ');
        String[] allScores = new String[tagScore.line.length + 1];
        
        for(int i = 0 ; i < tagScore.line.length ; i ++){
          allScores[i] = tagScore.line[i];
        } 
        allScores[allScores.length -1] = list[0];
        saveStrings("data/tag.csv",allScores);      
        }
      }
  }
   if(currentSlot < 3){
      name[currentSlot] = letter[currentLetter];
   }

  //navigate back to main menu/play again 
  fill(255);
  textSize(20);
  text("Play Again",width/2,400);
  text("Main Menu",width/2,420);
  if(mousePressed){
    if(mouseX > 245 && mouseX < 355 && mouseY > 390 && mouseY < 410){      
      gameState = 1;
    }else if(mouseX > 245 && mouseX < 355 && mouseY > 410 && mouseY < 430){
      gameState = 0;
    }
    if(gameState == 0 || gameState == 1){
      resetStats();
    }
  }   
}
    
}
