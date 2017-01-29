class PurpleMonster extends Monster {

	PImage purpleMonsterImage;

	PurpleMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 250;
		currentHealth = healthPoints;
		purpleMonsterImage = loadImage("image/PurpleMonster.png");
	}

	void drawMonster() {
		imageMode(CENTER);
    	image(purpleMonsterImage,location.x, location.y, size, size);
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}