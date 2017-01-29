class RedMonster extends Monster {

	RedMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 100;
		currentHealth = healthPoints;
	}

	void drawMonster() {
		fill(100, 0, 0); // Red 
		super.drawMonster();
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}
}