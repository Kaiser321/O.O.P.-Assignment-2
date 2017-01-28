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

	void updateBullet() {
		location.sub(velocity);
	}

	void drawBullet() { // Use switch to fire different types of bullets depends on weapon armed
		noFill();
		rect(location.x, location.y, size, size);
	}
}