class Bullet {
	PVector location;
	PVector velocity;
	int damage;
	int size;

	Bullet(PVector fire, float bulletSpeed, int bulletDamage){
		velocity = new PVector(0, bulletSpeed);
		location = fire.get();
		damage = bulletDamage;
		size = 20;
	}

 	float getX() {
    	return location.x;
  	}

  	float getY() {
    	return location.y;
  	}


	void updateBullet() {
		location.sub(velocity);
	}

	void drawBullet() { 
		noFill();
		rectMode(CENTER);
		rect(location.x, location.y, size, size + 10);
	}

	int getDamage() {
		return damage;
	}
	
}