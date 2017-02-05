class DropItem {

	PVector location;
	PVector velocity;
	PVector acceleration;
	int value;
  	int size;

	DropItem(PVector startLocation) {
		if(startLocation.x == 50) {
			velocity = new PVector(random(0, 0.5), random(-3, -1));
		}
		else if (startLocation.x == 550) {
			velocity = new PVector(random(-0.5, 0), random(-3, -1));	
		}
		else if(startLocation.x >= 150) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}
		else if(startLocation.x >= 450) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}
		else if(startLocation.x >= 250 || startLocation.x <= 450) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}
		else if(startLocation.x >= 350 || startLocation.x <= 450) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}

		acceleration = new PVector(0, 0.3);

		location = startLocation.copy();
		value = 1;
    	size = 40;
	}

	void updateItems() {
		velocity.add(acceleration);
    	location.add(velocity);
	}

	void displayItems() {

	}

	float getX() {
		return location.x;
	}

	float getY() {
		return location.y;
	}

	int getItemValue() {
		return value;
	}

	void playSound() {

	}
}