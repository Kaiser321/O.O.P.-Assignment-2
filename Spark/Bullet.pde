class Bullet {
	PVector location;
	PVector velocity;
	PImage bulletImage;
	int damage;
	int size;
	String bulletColor;

	Bullet(PVector fire, float bulletSpeed, int bulletDamage, String bColor){
		velocity = new PVector(0, bulletSpeed);
		location = fire.get();
		switch (bColor) {
			case "red" :
				bulletImage = loadImage("image/RedBullet.png");
			break;
			case "green" :
				bulletImage = loadImage("image/GreenBullet.png");
			break;
			case "blue" :
				bulletImage = loadImage("image/BlueBullet.png");
			break;
			case "purple" :
				bulletImage = loadImage("image/PurpleBullet.png");		
			break;				
		}
		damage = bulletDamage;
		size = 20;
		bulletColor = bColor;
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
		imageMode(CENTER);
    	image(bulletImage, location.x, location.y, size, size + 10);
	}

	int getDamage() {
		return damage;
	}

	String getColor() {
		return bulletColor;
	}

	void playSound() {
		hitSound.trigger();
	}
	
}