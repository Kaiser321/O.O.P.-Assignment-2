class Player {
  int playerSize = 100;
  
  Player() { 
  }
  
  void drawPlayer() {
    stroke(255);
    rectMode(CENTER);
    if(mouseX <= 50) {
      mouseX = 50;
    }
    else if(mouseX >= 550) {
     mouseX = 550; 
    }
    rect(mouseX, 900, playerSize, playerSize);
  }
}