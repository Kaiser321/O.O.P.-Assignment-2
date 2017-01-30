class Diamond extends DropItem {

	Diamond(PVector startLocation) {
		super(startLocation);
		value = 10;
	}


	void displayItems() {
		fill(128, 0, 128);
		ellipse(location.x, location.y, 30, 30);
	}
}