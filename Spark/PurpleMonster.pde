class PurpleMonster extends Monster {

	PurpleMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 250;
		currentHealth = healthPoints;
	}

	void drawMonster() {
		fill(128,0,128); // Blue
		super.drawMonster();
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}