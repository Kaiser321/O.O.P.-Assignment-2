class HelpPage {
	HelpPage() {

	}

	void displayHelp() {
		background(0);
		textAlign(CENTER);

		textSize(30);
		text("HOW TO PLAY", width / 2, (height /10 ) * 1);

    	textSize(15);
    	
    	text("-Move mouse cursor left and right to move the spaceship\n-Use mouse click to shoot and hold it down to go full automatic\n-Use keys 1, 2, 3, and 4 to change the bullet types and each \nbullet type is color coded\n-1 fires Red bullets, 2 is Green bullet, \n3 arms Blue bullets and 4 is for Purple bullets\n-There are 4 different types of enemies \neach color coded the same as the bullets\n-To do damage to the enemies you must shoot them with \nthe bullet that matches it's color, or else they take no damage\n-Make sure to try to collect the coins the enemy drops after they explode.\n-Save up to buy upgrades later for the ship to make it more powerful\n-Gold coins is worth 1 and blue diamond is worth 10\n-As a game round goes on the monsters will drop faster and more frequent\n-All money earned and upgrades bought will be saved so you can \ncontinue where you left off the next time you play the game\n-Bullets starts with 25 damage.\n-Each upgrade increases it by 25 and max out on 100 \n(if you max it out its 1 shot kill)\n-Upgrading bullet speed makes your bullet travel fast\n-Rate of fire makes your weapon shoot faster.\n-There are 4 levels to upgrade for both of them\n", width / 2, (height / 10) * 3);
		text("Press space to return to Main Menu",width / 2, (height/10)* 9);

		if(keyPressed) {
			if(key == ' ')
			{
				gameState = 0;
			}
		}
	}
}