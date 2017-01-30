class PurpleBullet extends Bullet {
	PImage purpleBulletImage;

	PurpleBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
		purpleBulletImage = loadImage("image/PurpleBullet.png");
		bulletColor = "purple";
	}

	void drawBullet() { 
		imageMode(CENTER);
    	image(purpleBulletImage, location.x, location.y, size, size + 10);
	}


}