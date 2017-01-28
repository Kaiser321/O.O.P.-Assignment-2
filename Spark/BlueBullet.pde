class BlueBullet extends Bullet {
	BlueBullet(PVector fire, float bulletSpeed, int bulletDamage){
		super(fire, bulletSpeed, bulletDamage);
		damage = bulletDamage;
	}

	void drawBullet() { 
		stroke(0,0,100);
		super.drawBullet();
	}
}