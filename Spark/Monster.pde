class Monster {
  PVector location;
  PVector velocity;
  int healthPoints;
  int currentHealth;
  int size;
  String monsterColor;

  
  Monster(PVector drop, float dropSpeed) {
    velocity = new PVector(0, dropSpeed);
    location = drop.get();
    healthPoints = 100;
    currentHealth = healthPoints;
    size = 100;
    monsterColor = "red";
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

  boolean takeDamage(Bullet currentBullet) {
    if(this.getColor() == currentBullet.getColor()) {
      this.currentHealth -= currentBullet.getDamage();
      return true;
    }
    else {
      this.currentHealth -= 0;
      return false;
    }
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

  String getColor() {
    return monsterColor;
  }

  DropItem dropItem(PVector startLocation) {
    int r = (int)random(2);

    DropItem item = new DropItem(startLocation);

    switch(r) {
      case 0 :
        item = new Coin(startLocation);
      break;  

      case 1 :
        item = new Diamond(startLocation);
      break;  
    }

    return item;
  } 
}