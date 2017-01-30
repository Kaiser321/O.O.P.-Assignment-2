class Coin extends DropItem {

	Coin(PVector startLocation) {
		super(startLocation);
		value = 1;
	}


	void displayItems() {
		fill(255);
		ellipse(location.x, location.y, 30, 30);
	}
}