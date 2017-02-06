class MainGame {
  ArrayList<MonsterWave> waveSystem; 
  ArrayList<DropItem> dropingItems;
  float monsterDropSpeed;
  float waveDelay; 
  float waveDelayCounter;
  int moneyThisRound;
  boolean roundOver;
  boolean playExplodeSound;

  MainGame() {
    waveSystem = new ArrayList<MonsterWave>(); 
    dropingItems = new ArrayList<DropItem>();
    monsterDropSpeed = 2; // How fast the waves drops
    waveDelay = 50; // Delay the next wave
    waveDelayCounter = 0.2; // Counter used to decrease the delay time as the game goes on
    moneyThisRound = 0;
    roundOver = false;
    playExplodeSound = false;
  }

  void runGame() {
    background(0);

    this.checkDeadWave();

    player.getWeapon().removeOutofWindowBullet();

    if(nextWave()) {
      this.spawnWave();
    }
    this.drawWave();

    player.getWeapon().displayBulletsFired();

    this.displayItems();

    this.playerInput();

    this.drawPlayer();

    this.monsterVbulletVplayerCollision();

    this.itemVplayerCollision();
    
    this.displayMoneyIcon();
  }

  void checkDeadWave() {
    if(waveSystem.size() > 1){
      MonsterWave wave = waveSystem.get(0);
      if(wave.getMonster(0).getY() >= 1050){
        waveSystem.remove(wave);
      }
    }
  }

  boolean nextWave() {
    if(waveDelay <= 0) {
      waveDelay = 100;
      waveDelayCounter = waveDelayCounter + 0.01;
      return true;
    }
    else {
      waveDelay = waveDelay - waveDelayCounter;
      return false;
    }
  }

  void spawnWave() {
    MonsterWave w = new MonsterWave();
    w.addMonsters(monsterDropSpeed);
    waveSystem.add(w);
    monsterDropSpeed = monsterDropSpeed + 0.05;
  }

  void drawWave() {
    for(MonsterWave wave : waveSystem) {
      wave.displayWave();
    }
  }

  void displayItems() {
    for(DropItem i : dropingItems) {
      i.updateItems();
      i.displayItems();
      if(dropingItems.size() > 1) {
        removeOutofWindowItem(i);
      } 
    }
  }

  void removeOutofWindowItem(DropItem i) {
    if(i.getY() >= 1000){
      dropingItems.remove(i);
    }
  }

  void playerInput() {
    if(keyPressed) {
      if(key == '1'){
        player.getWeapon().changeWeapon(0);
      }
      else if(key == '2'){
        player.getWeapon().changeWeapon(1);
      }
      else if(key == '3'){
        player.getWeapon().changeWeapon(2);
      }
      else if(key == '4'){
        player.getWeapon().changeWeapon(3);
      }
    }
  }

  void drawPlayer() {
        // Update and draw Player
    if(roundOver) {
      this.displayGameOver();
      if(!playExplodeSound) {
        player.playSound();
        playExplodeSound = true;
      }
      if (keyPressed) {
        if (key == ' ') {
          gameState = 0;
          this.clearStats();
        }
      }
    }
    else {
      player.updatePlayer();
      player.drawPlayer();

      // Update and draw bullet
      if (player.getWeapon().nextBullet()) {
        if(mousePressed){
          player.getWeapon().fireBullet();
        }
      }
    }
  }

  void monsterVbulletVplayerCollision() {
    for(int waveIndex = waveSystem.size() - 1; waveIndex >= 0; waveIndex--) {
      MonsterWave wave = waveSystem.get(waveIndex);

      for(int monsterIndex = wave.getWaveSize() - 1; monsterIndex >= 0; monsterIndex--) {
        Monster currentMonster = wave.getMonster(monsterIndex);

        if(this.monsterVplayerCollision(player, currentMonster)){
            roundOver = true;
            break;
          }

        for(int bulletIndex = player.getWeapon().getBulletsFiredSize() -1; bulletIndex >= 0;  bulletIndex--) {  
          Bullet currentBullet = player.getWeapon().getBullet(bulletIndex);

          if(this.checkCollision(currentMonster.getX(), currentMonster.getY(), currentBullet.getX(), currentBullet.getY(), (currentMonster.size) / 2, (currentBullet.size) / 2)) {
            int collisionIndex = getCollisionIndex(currentMonster.getX());
            currentMonster = wave.getMonster(collisionIndex);
            boolean tookDamage = currentMonster.takeDamage(currentBullet);
            player.getWeapon().removeBullet(currentBullet, tookDamage);
          }
        }
      }
    }
  }

  boolean monsterVplayerCollision(Player player, Monster currentMonster) {
    if(this.checkCollision(currentMonster.getX(), currentMonster.getY(), player.getX(), player.getY(), (currentMonster.size / 2), (player.size / 3))) {
      return true;
    }
    else {
      return false;
    }
  }

  void itemVplayerCollision() {
    for(int itemIndex = dropingItems.size() - 1; itemIndex >= 0; itemIndex--) {
      DropItem currentItem = dropingItems.get(itemIndex); 

      if(this.checkCollision(currentItem.getX(), currentItem.getY(), player.getX(), player.getY(), (currentItem.size / 2), (player.size / 2))) {
        currentItem.playSound();
        dropingItems.remove(itemIndex);
        moneyThisRound += currentItem.getItemValue();
      }
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

  void displayGameOver() {
    fill(255);
    textAlign(CENTER);
    textSize(80);
    text("Game"+ "\n" + "Over", width / 2, height / 3);
    textSize(30);
    text("Coins Collected This Round: " + moneyThisRound, width / 2, (height / 10) * 6);
    text("Total Coin: " + (moneyThisRound + player.money), width / 2, (height / 10) * 7);
    text("Press Space to return to Main Menu", width / 2, (height / 10) * 9);
  }

  void displayMoneyIcon() {
    PImage coin = loadImage("image/Coin.png");
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(moneyThisRound, (width/10) * 9, height / 15);
    imageMode(CENTER);
    image(coin, (width/10) * 9.75, height / 18.5, 30, 30);
  }

  void clearStats() {
    monsterDropSpeed = 2;
    waveDelayCounter = 0.2;
    player.money += moneyThisRound;
    moneyThisRound = 0;
    roundOver = false;
    playExplodeSound = false;
    waveDelay = 50;
    gameMusic.rewind();
    gameMusic.pause();
    menuMusic.loop();
    player.getWeapon().bulletsFired.clear();
    dropingItems.clear();
    waveSystem.clear();
  }
}

