class Monster {
  PVector location;
  PVector velocity;
  int healthPoints;
  int currentHealth;
  int size;
  
  Monster(PVector drop, float dropSpeed) {
    velocity = new PVector(0, dropSpeed);
    location = drop.get();
    healthPoints = 100;
    currentHealth = healthPoints;
    size = 100;
  }

  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
  }

  boolean isDead() {
  	if (currentHealth <= 0) {
  		return true;
  	}
  	else {
  		return false;
  	}
  }

  void takeDamage(Weapon w, int bulletIndex) {
    currentHealth = currentHealth - w.doDamage(bulletIndex);
  }
  
  void updateMonster() {
      location.add(velocity);
  }
 
  void drawMonster() {
    noStroke();
    rect(location.x, location.y, size, size);
  }
  
  void displayHealthPoints() {
    noFill();
    stroke(255);
    rect(location.x, location.y + 60, 75, 10);
  }
  

  
}