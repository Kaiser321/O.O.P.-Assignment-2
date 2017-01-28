class Monster {
  PVector location;
  PVector velocity;
  int healthPoints;
  int size;
  
  Monster(PVector drop, float dropSpeed) {
    velocity = new PVector(0, dropSpeed);
    location = drop.get();
    healthPoints = 100;
    size = 100;
  }

  int getY() {
    return (int)location.y;
  }

  boolean isDead() {
  	if (healthPoints <= 0) {
  		return true;
  	}
  	else {
  		return false;
  	}
  }
  
  void updateMonster() {
  	location.add(velocity);
  }
 
  void drawMonster() {
    noStroke();
    rect(location.x, location.y, size, size);
  }
  
  
  
}