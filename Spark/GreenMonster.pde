class GreenMonster extends Monster {

	PImage greenMonsterImage;

	GreenMonster(PVector drop, float dropSpeed) {
		super(drop, dropSpeed);
		currentHealth = healthPoints;
		greenMonsterImage = loadImage("image/GreenMonster.png");
		monsterColor = "green";
	}

	void drawMonster() {
		imageMode(CENTER);
    	image(greenMonsterImage,location.x, location.y, size, size);
	}

	void displayHealthPoints() {
		float m = map(currentHealth, 0, healthPoints, 0 ,75);
		super.displayHealthPoints();
		fill(255);
		rect(location.x, location.y + 60, m, 10);
	}

}