class Weapon {

	ArrayList<Bullet> bulletsFired = new ArrayList<Bullet>();
	float locationX;
	int[] weaponDamage = new int[4];
	int bulletSpeed;
	int bulletDelay;
	int bulletDelayCounter;

	Weapon(int bSpeed, int bDelay, int[] wDamage) {
		weaponDamage = wDamage;
		bulletSpeed = bSpeed;
		bulletDelay = bDelay;
		bulletDelayCounter = 0;
	}

	void fireBullet(int weaponCode) {
		locationX = mouseX;
    
    	if(locationX <= 50) {
      		locationX = 50;
   		}
    	else if(locationX >= 550) {
    		locationX = 550; 
   		} 
   		//Use switch here to add different type of bullets
		switch (weaponCode) {
			case 0 :
				bulletsFired.add(new RedBullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[0]));
			break;	

			case 1 :
				bulletsFired.add(new GreenBullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[1]));
			break;

			case 2 :
				bulletsFired.add(new BlueBullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[2]));	
			
			break;		

			case 3 :
				bulletsFired.add(new PurpleBullet(new PVector(locationX, 850), bulletSpeed, weaponDamage[3]));
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
			for(int i = bulletsFired.size() - 1; i >= 0; i--) {
				Bullet b = bulletsFired.get(i);
				if (b.getY() < 0){
					bulletsFired.remove(b);
				}
			}
		}
	} 

	Bullet getBullet(int bulletIndex) {
		return bulletsFired.get(bulletIndex);
	}

	void removeBullet(Bullet currentBullet) {
		bulletsFired.remove(currentBullet);
	}

	int getBulletsFiredSize() {
		return bulletsFired.size();
	}

}