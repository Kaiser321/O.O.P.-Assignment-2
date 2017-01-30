class RedBullet extends Bullet {
	PImage redBulletImage;

	RedBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
		redBulletImage = loadImage("image/RedBullet.png");
		bulletColor = "red";

	}

	void drawBullet() { 
		imageMode(CENTER);
    	image(redBulletImage, location.x, location.y, size, size + 10);
	}


}