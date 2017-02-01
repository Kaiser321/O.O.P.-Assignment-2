/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 100; // Delay the next wave
float waveDelayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;
int moneyThisRound = 0;
int gameState = 1;

/* Declear Classes*/
Player player; // Player Object
ArrayList<MonsterWave> waveSystem ; // Arraylist for waves of monsters
ArrayList<DropItem> dropingItems;

void setup() {
  size(600, 1000);
  frameRate(60);
  smooth();
  noCursor();
  // Read player data from file
  Table playerData = loadTable("playerData.csv", "header");
  for (TableRow row : playerData.rows()) {
    player = new Player(row.getInt("RedBullet"), row.getInt("GreenBullet"), row.getInt("BlueBullet"), row.getInt("PurpleBullet"), row.getInt("playerBulletSpeed"), row.getInt("playerBulletDelay"), row.getInt("playerMoney"));
  }
  
  // Create Objects
  waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters
  dropingItems = new ArrayList<DropItem>();
  
  // Making the first wave
  MonsterWave w = new MonsterWave();
  w.addMonsters(monsterDropSpeed);
  waveSystem.add(w);
}

void draw() {
  //println(frameRate);
  background(0);

  // Check monsters that are dead in every wave
  for(MonsterWave wave : waveSystem) {
    wave.checkDeadMonsters();
  }
  // Check waves that are empty
  checkDeadWave();
  // Remove out of window bullet
  player.getWeapon().removeOutofWindowBullet();
  // Remove out of window Items
  removeOutofWindowItem();


  // Making the next wave and increase drop speed
  if(nextWave()) {
  	MonsterWave w = new MonsterWave();
    w.addMonsters(monsterDropSpeed);
    waveSystem.add(w);
    monsterDropSpeed = monsterDropSpeed * 1.00;
  }
  // Display Monster waves
  for(MonsterWave m : waveSystem) {
    m.displayWave();
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

  // Update and draw bullet
  if (player.getWeapon().nextBullet()) {
    if(mousePressed){
      player.getWeapon().fireBullet(playerWeaponArmed);
    }
  }
  player.getWeapon().displayBulletsFired();
  // Update and draw Drop Items
  for(DropItem i : dropingItems) {
      i.updateItems();
      i.displayItems();
    }
  // Update and draw Player
  player.updatePlayer();
  player.drawPlayer();

  // Check for Monster to Player Collision
  monsterVbulletVplayerCollision();
  // Check for Player to DropItem Collision
  itemVplayerCollision();

}

// Spawn next wave
boolean nextWave() {
	if(waveDelay <= 0) {
		waveDelay = 100;
		waveDelayCounter = waveDelayCounter + 0.00;
		return true;
	}
	else {
		waveDelay = waveDelay - waveDelayCounter;
		return false;	
	}
}

void monsterVbulletVplayerCollision() {
  for(int waveIndex = waveSystem.size() - 1; waveIndex >= 0; waveIndex--) {
    MonsterWave wave = waveSystem.get(waveIndex);

    for(int monsterIndex = wave.getWaveSize() - 1; monsterIndex >= 0; monsterIndex--) {
      Monster currentMonster = wave.getMonster(monsterIndex);

      if(monsterVplayerCollision(player, currentMonster)){
          gameState = 2;
          background(0);
          break;
        }

      for(int bulletIndex = player.getWeapon().getBulletsFiredSize() -1; bulletIndex >= 0;  bulletIndex--) {  
        Bullet currentBullet = player.getWeapon().getBullet(bulletIndex);

        if(checkCollision(currentMonster.getX(), currentMonster.getY(), currentBullet.getX(), currentBullet.getY(), (currentMonster.size) / 2, (currentBullet.size) / 2)) {
          int collisionIndex = getCollisionIndex(currentMonster.getX());
          currentMonster = wave.getMonster(collisionIndex);
          boolean tookDamage = currentMonster.takeDamage(currentBullet);
          player.getWeapon().removeBullet(currentBullet, tookDamage);
        }
      }
    }
  }
}

void itemVplayerCollision() {
  for(int itemIndex = dropingItems.size() - 1; itemIndex >= 0; itemIndex--) {
    DropItem currentItem = dropingItems.get(itemIndex); 

    if(checkCollision(currentItem.getX(), currentItem.getY(), player.getX(), player.getY(), (currentItem.size / 2), (player.size / 2))) {
      dropingItems.remove(itemIndex);
      moneyThisRound += currentItem.getItemValue();
    }
  }
}

boolean monsterVplayerCollision(Player player, Monster currentMonster) {
  if(checkCollision(currentMonster.getX(), currentMonster.getY(), player.getX(), player.getY(), (currentMonster.size / 2), (player.size / 3))) {
    return true;
  }
  else {
    return false;
  }
}

// Check if there is a collision
boolean checkCollision(float aX, float aY, float bX, float bY, float aSize, float bSize) {
    float aXStart = aX - aSize, aXEnd = aX + aSize, 
          aYStart = aY + aSize, aYEnd = aY - aSize;
    float bXStart = bX - bSize, bXEnd = bX + bSize, 
          bYStart = bY - bSize, bYEnd = bY + bSize;

    if( ((bXStart <= aXEnd) && (bXEnd >= aXStart)) && ((bYStart <= aYStart) && (bYEnd >= aYEnd)) ) {
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
  MonsterWave wave = waveSystem.get(0);
  if(wave.checkDeadMonsters() >= 6) {
    waveSystem.remove(wave);
  }
  else if(wave.getMonster(0).getY() >= 950){
    waveSystem.remove(wave);
  }
}

void removeOutofWindowItem() {
  if(dropingItems.size() > 1) {
      for(int i = dropingItems.size() -1; i >= 0; i--) {
        DropItem item = dropingItems.get(i);
        if(item.getY() >= 1000){
          dropingItems.remove(item);
        }
      }
  }
}