class GreenBullet extends Bullet {

	GreenBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
	}

	void drawBullet() { 
		stroke(0,100,0);
		super.drawBullet();
	}


}