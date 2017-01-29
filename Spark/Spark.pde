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

  // Making the first wave
  waveSystem.add(new MonsterWave());
  for(MonsterWave m : waveSystem) {
  	m.addMonsters(monsterDropSpeed);
  }

  weapon.fireBullet(0);


}

void draw() {
  
  background(0);

  // Making the next wave and increase drop speed
  if(nextWave()) {
  	waveSystem.add(new MonsterWave());

  	for(MonsterWave m : waveSystem) {
      m.addMonsters(monsterDropSpeed);
    }

    monsterDropSpeed = monsterDropSpeed * 1.01;
  }

  // Display Monster waves
  for(MonsterWave m : waveSystem) {
    m.displayWave();
  }

  // Remove out of window bullet
  weapon.removeOutofWindowBullet();

  //Update and draw bullet
  if (weapon.nextBullet()) {
    if(mousePressed){
      weapon.fireBullet(playerWeaponArmed);
    }
  }
  weapon.displayBulletsFired();


  // Check for Collision
  float monsterX, monsterY, bulletX, bulletY, monsterSize, bulletSize;

  checkDeadWave();

  for(int waveIndex = waveSystem.size() - 1; waveIndex >= 0; waveIndex--) {
    MonsterWave wave = waveSystem.get(waveIndex);

    wave.checkDeadMonsters();
    
    for(int monsterIndex = wave.getWaveSize() - 1; monsterIndex >= 0; monsterIndex--) {

      for(int bulletIndex = weapon.getBulletsFiredSize() -1; bulletIndex >= 0;  bulletIndex--) {
        
        Bullet currentBullet = weapon.getBullet(bulletIndex);
        Monster currentMonster = wave.getMonster(monsterIndex);

        monsterX = currentMonster.getX();
        monsterY = currentMonster.getY();
        monsterSize = (currentMonster.size) / 2;

        bulletX = currentBullet.getX();
        bulletY = currentBullet.getY();
        bulletSize = (currentBullet.size) / 2;



        if(checkCollision(monsterX, monsterY, bulletX, bulletY, monsterSize, bulletSize)) {
          int collisionIndex = getCollisionIndex(monsterX);
          currentMonster = wave.getMonster(collisionIndex);
          currentMonster.takeDamage(currentBullet);
          weapon.removeBullet(currentBullet);
        }
        currentMonster = wave.getMonster(monsterIndex);
      }
    }
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

  // update and draw Player
  player.updatePlayer();
  player.drawPlayer();



}

boolean nextWave() {
	if(waveDelay <= 0) {
		waveDelay = 100;
		waveDelayCounter = waveDelayCounter + 0.02;
		return true;
	}
	else {
		waveDelay = waveDelay - waveDelayCounter;
		return false;	
	}
}

boolean checkCollision(float mX, float mY, float bX, float bY, float mSize, float bSize){


  if( ((bX + bSize) >= mX - mSize && (bX - bSize) <= mX + mSize) && (bY <= mY + mSize &&  bY >= mY) ){
    return true;
  }
  else {
    return false;
  }
}

int getCollisionIndex(float mX) {
  int index = 0;
  switch ((int)mX) {
      case  50:
        index = 0;
      break;

      case 150:
        index = 1;
      break;

      case 250:
        index = 2;
      break;      

      case 350:
        index = 3;
      break; 

      case 450:
        index = 4;
      break; 

      case 550:
        index = 5;
      break; 
  }
  return index;
}


void checkDeadWave() {
  for(int waveIndex = waveSystem.size() - 1; waveIndex >= 0; waveIndex--) {
    MonsterWave wave = waveSystem.get(waveIndex);

    if(wave.checkDeadMonsters() >= 6) {
      waveSystem.remove(wave);
    }

    if(wave.getMonster(waveIndex).getY() >= 1100){
      waveSystem.remove(wave);
    }
  }
}

