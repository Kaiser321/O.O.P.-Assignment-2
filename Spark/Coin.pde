class Coin extends DropItem {
  PImage coinImage;

	Coin(PVector startLocation) {
		super(startLocation);
		value = 1;
    	coinImage = loadImage("image/Coin.png");
	}

	void displayItems() {
    	imageMode(CENTER);
    	image(coinImage, location.x, location.y, size, size);
	}

	void playSound() {
		coinSound.trigger();
	}
}