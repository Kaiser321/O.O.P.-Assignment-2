class Weapon {

	PImage bulletImpactImage;

	ArrayList<Bullet> bulletsFired = new ArrayList<Bullet>();
	int[] weaponDamage = new int[4];
	int bulletSpeed;
	int bulletDelay;
	int bulletDelayCounter;

	Weapon(int bSpeed, int bDelay, int[] wDamage) {
		weaponDamage = wDamage;
		bulletSpeed = bSpeed;
		bulletDelay = bDelay;
		bulletDelayCounter = 0;
		bulletImpactImage = loadImage("image/BulletImpact.png");

	}

	void fireBullet(int weaponCode) {
		float locationX = mouseX;
    	if(locationX <= 50) {
      		locationX = 50;
   		}
    	else if(locationX >= 550) {
    		locationX = 550; 
   		} 
   		//Use switch here to add different type of bullets
		switch (weaponCode) {
			case 0 :
				fireRedBullet.trigger();
				bulletsFired.add(new Bullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[0], "red"));
			break;	

			case 1 :
				fireGreenBullet.trigger();
				bulletsFired.add(new Bullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[1], "green"));
			break;

			case 2 :
				fireBlueBullet.trigger();
				bulletsFired.add(new Bullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[2], "blue"));	
			
			break;		

			case 3 :
				firePurpleBullet.trigger();
				bulletsFired.add(new Bullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[3], "purple"));
			break;	
		}
	}

	void displayBulletsFired() {
		for(Bullet b : bulletsFired) {
			b.updateBullet();
			b.drawBullet();
		}
	}

	boolean nextBullet() {
		if(bulletDelayCounter >= 0) {
			bulletDelayCounter--;
			return false;
		}
		else{
			bulletDelayCounter = bulletDelay;
			return true;
		}
	}

	void removeOutofWindowBullet() {
		if(bulletsFired.size() > 1) {
			Bullet b = bulletsFired.get(0);
			if (b.getY() < 0){
				bulletsFired.remove(b);
			}
		}
	} 

	Bullet getBullet(int bulletIndex) {
		return bulletsFired.get(bulletIndex);
	}

	void removeBullet(Bullet currentBullet, boolean damage) {
		bulletsFired.remove(currentBullet);
		if(damage)
		{
			imageMode(CENTER);
    		image(bulletImpactImage, currentBullet.getX(), currentBullet.getY(), 47, 57);
    	}
	}

	int getBulletsFiredSize() {
		return bulletsFired.size();
	}
}