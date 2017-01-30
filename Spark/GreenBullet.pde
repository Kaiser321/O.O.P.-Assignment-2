class GreenBullet extends Bullet {
	PImage greenBulletImage;

	GreenBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
		greenBulletImage = loadImage("image/GreenBullet.png");
		bulletColor = "green";
	}

	void drawBullet() { 
		imageMode(CENTER);
    	image(greenBulletImage, location.x, location.y, size, size + 10);
	}


}