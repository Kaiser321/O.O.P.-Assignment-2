class Player {
  PVector location;
  PVector playerSize;
  
  Player() { 
    location = new PVector(0, 900);
    playerSize = new PVector(75, 100);
  }
  
  
  void updatePlayer() {
    location.x = mouseX;
    
    if(location.x <= 50) {
      location.x = 50;
    }
    else if(location.x >= 550) {
     location.x = 550; 
    }  
  }
  
  void drawPlayer() {
    fill(255);
    rectMode(CENTER);
    rect(location.x, location.y, playerSize.x, playerSize.y);
  }

  void fireWeapon() {


  }
}