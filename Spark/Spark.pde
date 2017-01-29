/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 100; // Delay the next wave
float waveDelayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;

int[] playerWeaponDamage = new int[] {25, 25, 25, 25};

int playerBulletSpeed = 10;
int playerBulletDelay = 4;

/* Declear Classes*/
Player player = new Player(); // Player Object
ArrayList<MonsterWave> waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters
Weapon weapon = new Weapon(playerBulletSpeed, playerBulletDelay, playerWeaponDamage); // Current Weapon armed




void setup() {
  size(600, 1000);
  //smooth();



  // Making the first wave
  waveSystem.add(new MonsterWave());
  for(MonsterWave m : waveSystem) {
  	m.addMonsters(monsterDropSpeed);
  }

  weapon.fireBullet(0);

}

void draw() {
  
  background(0);
  //println(frameRate);


// Remove out of window bullet
  weapon.removeOutofWindowBullet();

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
  // Player Change bullet
  if(keyPressed) {
    if(key == 'q' || key == 'Q'){
      playerWeaponArmed = 0;
    }
    else if(key == 'w' || key == 'W'){
      playerWeaponArmed = 1;
    }
    else if(key == 'e' || key == 'E'){
      playerWeaponArmed = 2;
    }
    else if(key == 'r' || key == 'R'){
      playerWeaponArmed = 3;
    }
  }

  
  //Update and draw bullet
  if (weapon.nextBullet()) {
    if(mousePressed){
      weapon.fireBullet(playerWeaponArmed);
    }
  }
  weapon.displayBulletsFired();


  // Check for Collision 
  float monsterX, monsterY, bulletX, bulletY, monsterSize;
  for(int i = waveSystem.size() -1; i >= 0; i--){
    MonsterWave m = waveSystem.get(i);
    for(int j = m.getWaveSize() -1; j >= 0; j--){

      monsterX = m.wave.get(j).getX();
      monsterY = m.wave.get(j).getY();
      monsterSize = (m.wave.get(j).size) / 2;
      println(monsterX, monsterY);

      for(int k = weapon.bulletsFired.size() -1; k >=0; k--){
        bulletX = weapon.bulletsFired.get(k).getX();
        bulletY = weapon.bulletsFired.get(k).getY();
        if( (bulletX >= monsterX - monsterSize || bulletX <= monsterX + monsterSize) && (bulletY <= monsterY + monsterSize) ){
          if(m.wave.get(j).isDead() == false) {
            weapon.removeBullet(k);
            m.wave.get(j).takeDamage(weapon, k);
          }
        }
      }


      

    }
  }






  // update and draw Player
  player.updatePlayer();
  player.drawPlayer();


  // Remove MonsterWaves if they move off the window
  if (waveSystem.size() > 0) {
    if(waveSystem.get(0).wave.get(0).getY() >= 1100) {
      waveSystem.remove(0);
    }
  }



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