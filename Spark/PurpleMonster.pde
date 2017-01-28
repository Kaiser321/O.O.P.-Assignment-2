class PurpleMonster extends Monster {

	PurpleMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		healthPoints = 250;
	}

	void drawMonster() {
		fill(128,0,128); // Blue
		super.drawMonster();
	}
}