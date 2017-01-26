class Monster {
  PVector location;
  PVector velocity;
  int healthPoints;
  int size;
  
  Monster(PVector a) {
    velocity = new PVector(0, 4);
    location = a.get();
    healthPoints = 100;
    size = 100;
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
  	noFill();
    rect(location.x, location.y, size, size);
  }
  
  
  
}