
/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 100; // Delay the next wave
float waveDelayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;

/* Declear Classes*/
Player player; // Player Object
ArrayList<MonsterWave> waveSystem ; // Arraylist for waves of monsters
ArrayList<DropItem> dropingItems = new ArrayList<DropItem>();

void setup() {
  size(600, 1000);
  smooth();
 
  // Read player data from file
  Table playerData = loadTable("playerData.csv", "header");
  for (TableRow row : playerData.rows()) {
    player = new Player(row.getInt("RedBullet"), row.getInt("GreenBullet"), row.getInt("BlueBullet"), row.getInt("PurpleBullet"), row.getInt("playerBulletSpeed"), row.getInt("playerBulletDelay"));
  }
  // Create Objects
  waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters
  
  // Making the first wave
  waveSystem.add(new MonsterWave());
  for(MonsterWave m : waveSystem) {
  	m.addMonsters(monsterDropSpeed);
  }

  // Load first bullet
  player.getWeapon().fireBullet(0);

}

void draw() {
  println(frameRate);
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
  player.getWeapon().removeOutofWindowBullet();
  

  // Update and draw bullet
  if (player.getWeapon().nextBullet()) {
    if(mousePressed){
      player.getWeapon().fireBullet(playerWeaponArmed);
    }
  }
  player.getWeapon().displayBulletsFired();
  
  // Remove out of window Items
  removeOutofWindowItem();
  
  // Update and draw Drop Items
  for(DropItem i : dropingItems) {
      i.updateItems();
      i.displayItems();
    }


  // Check for Collision
  float monsterX, monsterY, bulletX, bulletY, monsterSize, bulletSize;

  checkDeadWave();

  for(int waveIndex = waveSystem.size() - 1; waveIndex >= 0; waveIndex--) {
    MonsterWave wave = waveSystem.get(waveIndex);

    wave.checkDeadMonsters();

    
    for(int monsterIndex = wave.getWaveSize() - 1; monsterIndex >= 0; monsterIndex--) {

      for(int bulletIndex = player.getWeapon().getBulletsFiredSize() -1; bulletIndex >= 0;  bulletIndex--) {
        
        Bullet currentBullet = player.getWeapon().getBullet(bulletIndex);
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
          boolean tookDamage = currentMonster.takeDamage(currentBullet);
          player.getWeapon().removeBullet(currentBullet, tookDamage);
        }
        currentMonster = wave.getMonster(monsterIndex);
      }
    }
  }


  // Player Change bullet
  if(keyPressed) {
    if(key == '1'){
      playerWeaponArmed = 0;
    }
    else if(key == '2'){
      playerWeaponArmed = 1;
    }
    else if(key == '3'){
      playerWeaponArmed = 2;
    }
    else if(key == '4'){
      playerWeaponArmed = 3;
    }
  }

  // Update and draw Player
  player.updatePlayer();
  player.drawPlayer();
  

}


// Spawn next wave
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

// Check if there is a collision
boolean checkCollision(float mX, float mY, float bX, float bY, float mSize, float bSize){
  if( ((bX + bSize) >= mX - mSize && (bX - bSize) <= mX + mSize) && ( (bY - bSize) <= mY + mSize &&  bY >= mY) ){
    return true;
  }
  else {
    return false;
  }
}

// If there is a collision, return the monster that's been hit
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

// Check and remove waves that are out of window or has no monsters left
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

void removeOutofWindowItem() {
  if(dropingItems.size() > 1) {
      for(int i = dropingItems.size() -1; i >= 0; i--) {
        DropItem item = dropingItems.get(i);
        if(item.getY() >= 1100){
          dropingItems.remove(item);
        }
      }
  }
}