class GreenMonster extends Monster {

	GreenMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 150;
	}

	void drawMonster() {
		fill(0, 100, 0); // Green
		super.drawMonster();
	}

}