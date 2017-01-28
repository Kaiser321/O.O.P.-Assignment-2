class Weapon {

	ArrayList<Bullet> bulletsFired = new ArrayList<Bullet>();
	float locationX;
	int bulletDelay;
	Weapon() {
		bulletDelay = 0;
	}

	void fireBullet() {
		locationX = mouseX;
    
    	if(locationX <= 50) {
      		locationX = 50;
   		}
    	else if(locationX >= 550) {
    		locationX = 550; 
   		} 
		bulletsFired.add(new Bullet(new PVector(locationX, 850), 10));
	}

	void displayBulletsFired() {
		for(Bullet b : bulletsFired) {
			b.updateBullet();
			b.drawBullet();
		}
	}

	boolean nextBullet() {

		if(bulletDelay >= 0) {
			bulletDelay--;
			return false;
		}
		else{
			bulletDelay = 10;
			return true;
		}
	}

	/*void removeBullet() {
	} 
	*/
}