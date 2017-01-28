class Bullet {

	PVector location;
	PVector velocity;
	int damage;
	int size;

	Bullet(PVector fire, float bulletSpeed){
		velocity = new PVector(0, bulletSpeed);
		location = fire.get();
		damage = 50;
		size = 20;
	}

	void updateBullet() {
		location.sub(velocity);
	}

	void drawBullet() {
		noFill();
		stroke(255);
		rect(location.x, location.y, size, size);
	}
}