class DropItem {

	PVector location;
	PVector velocity;
	PVector acceleration;
	int value;

	DropItem(PVector startLocation) {
		if(startLocation.x == 50) {
			velocity = new PVector(random(0, 2), random(-3, -1));
		}
		else if (startLocation.x == 550) {
			velocity = new PVector(random(-2, 0), random(-3, -1));	
		}
		else if(startLocation.x >= 150) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}
		else if(startLocation.x >= 450) {
			velocity = new PVector(random(-0.5, 0.5), random(-3, -1));
		}
		else if(startLocation.x >= 250 || startLocation.x <= 450) {
			velocity = new PVector(random(-2, 2), random(-3, -1));
		}
		else if(startLocation.x >= 350 || startLocation.x <= 450) {
			velocity = new PVector(random(-2, 2), random(-3, -1));
		}

		acceleration = new PVector(0, 0.05);

		location = startLocation.copy();
		value = 1;
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
}