/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 100; // Delay the next wave
float waveDelayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 3;

int[] playerWeaponDamage = new int[] {25, 25, 25, 25};

int playerBulletSpeed = 10;
int playerBulletDelay = 4;

  /* Declear Classes*/
  Player player = new Player(); // Player Object
  ArrayList<MonsterWave> waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters
  Weapon weapon = new Weapon(playerBulletSpeed, playerBulletDelay, playerWeaponDamage); // Current Weapon armed




void setup() {
  size(600, 1000);
  smooth();



  // Making the first wave
  waveSystem.add(new MonsterWave());
  for(MonsterWave m : waveSystem) {
  	m.addMonsters(monsterDropSpeed);
  }

}

void draw() {
  
  background(0);

  // Display the wave
  for(MonsterWave m : waveSystem) {
    m.display();
  }

  // Making the next wave and display Monsters
  if(nextWave()) {
  	waveSystem.add(new MonsterWave());

  	for(MonsterWave m : waveSystem) {
      m.addMonsters(monsterDropSpeed);
    }

    monsterDropSpeed = monsterDropSpeed * 1.03;
  }
  // Change bullet

  
  //Update and draw bullet
  if (weapon.nextBullet()) {
    if(mousePressed){
      weapon.fireBullet(playerWeaponArmed);
    }
  }
  weapon.displayBulletsFired();

  // Check for Collision 


  // update and draw Player
  player.updatePlayer();
  player.drawPlayer();


  // Remove MonsterWaves if they move off the window
  if (waveSystem.size() > 0) {
    if(waveSystem.get(0).wave.get(0).getY() >= 1100) {
      waveSystem.remove(0);
    }
  }

  // Remove bullet
  weapon.removeOutofWindowBullet();

}

boolean nextWave() {
	if(waveDelay <= 0) {
		waveDelay = 100;
		waveDelayCounter = waveDelayCounter + 0.03;
		return true;
	}
	else {
		waveDelay = waveDelay - waveDelayCounter;
		return false;	
	}
}