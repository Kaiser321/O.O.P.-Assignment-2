class GreenMonster extends Monster {

	GreenMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 150;
		currentHealth = healthPoints;
	}

	void drawMonster() {
		fill(0, 100, 0); // Green
		super.drawMonster();
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}

}