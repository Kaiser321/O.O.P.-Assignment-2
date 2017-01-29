class RedBullet extends Bullet {

	RedBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
	}

	void drawBullet() { 
		stroke(100,0,0);
		super.drawBullet();
	}


}