class BlueMonster extends Monster {

	BlueMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 200;
		currentHealth = healthPoints;
	}

	void drawMonster() {
		fill(0, 0, 100); // Blue
		super.drawMonster();
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}