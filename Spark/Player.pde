class Player {
  int playerSize = 100;
  float playerX;
  
  Player() { 
  }
  
  
  void updatePlayer() {
    playerX = mouseX;
    
    if(playerX <= 50) {
      playerX = 50;
    }
    else if(playerX >= 550) {
     playerX = 550; 
    }  
  }
  
  void drawPlayer() {
    fill(255);
    rectMode(CENTER);
    rect(playerX, 900, playerSize, playerSize);
  }
}