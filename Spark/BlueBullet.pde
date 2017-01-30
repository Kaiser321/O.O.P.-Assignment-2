class BlueBullet extends Bullet {
	PImage blueBulletImage;

	BlueBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
		blueBulletImage = loadImage("image/BlueBullet.png");
		bulletColor = "blue";
	}

	void drawBullet() { 
		imageMode(CENTER);
    	image(blueBulletImage, location.x, location.y, size, size + 10);
	}

}