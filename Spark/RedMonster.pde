class RedMonster extends Monster {

	RedMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 100;
	}

	void drawMonster() {
		fill(100, 0, 0); // Red 
		super.drawMonster();
	}
}