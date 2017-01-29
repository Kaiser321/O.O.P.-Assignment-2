class RedMonster extends Monster {

	PImage redMonsterImage;

	RedMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 100;
		currentHealth = healthPoints;
		redMonsterImage = loadImage("image/RedMonster.png");
	}

	void drawMonster() {
		imageMode(CENTER);
    	image(redMonsterImage,location.x, location.y, size, size);
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}