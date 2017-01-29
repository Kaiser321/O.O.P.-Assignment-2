class BlueMonster extends Monster {

	PImage blueMonsterImage;

	BlueMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 200;
		currentHealth = healthPoints;
		blueMonsterImage = loadImage("image/BlueMonster.png");
	}

	void drawMonster() {
		imageMode(CENTER);
    	image(blueMonsterImage,location.x, location.y, size, size);
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}