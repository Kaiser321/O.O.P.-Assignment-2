class Player {
  PVector location;
  PVector playerSize;

  Player() { 
    location = new PVector(0, 900);
    playerSize = new PVector(100, 100);
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
    imageMode(CENTER);
    image(playerShip,location.x, location.y, playerSize.x, playerSize.y);
  }

}