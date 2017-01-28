class BlueMonster extends Monster {

	BlueMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 200;
	}

	void drawMonster() {
		fill(0, 0, 100); // Blue
		super.drawMonster();
	}
}