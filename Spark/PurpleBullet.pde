class PurpleBullet extends Bullet {

	PurpleBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
	}

	void drawBullet() { 
		stroke(128,0,128);
		super.drawBullet();
	}


}