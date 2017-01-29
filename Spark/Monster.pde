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

  void takeDamage(Bullet currentBullet) {
    this.currentHealth -= currentBullet.getDamage();
  }
  

  void updateMonster() {
      location.add(velocity);
  }
 
  void drawMonster() {

  }
  
  void displayHealthPoints() {
    noFill();
    stroke(255);
    rectMode(CENTER);
    rect(location.x, location.y + 60, 75, 10);
  }
  
  void removeMonster() {
    location.set(700, location.y);
  }
  
}