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
		rect(location.x, location.y, size, size + 10);
	}

	
}