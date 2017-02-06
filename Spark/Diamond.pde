class Diamond extends DropItem {
	PImage diamondImage;

	Diamond(PVector startLocation) {
		super(startLocation);
		value = 10;
		diamondImage = loadImage("image/Diamond.png");
	}


	void displayItems() {
   		imageMode(CENTER);
    	image(diamondImage, location.x, location.y, size, size);
	}

	void playSound() {
		diamondSound.trigger();
	}
}