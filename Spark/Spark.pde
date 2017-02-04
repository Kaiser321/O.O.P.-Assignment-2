/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 50; // Delay the next wave
float waveDelayCounter = 0.2; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;
int moneyThisRound = 0;
int gameState = 0;
boolean roundOver = false;

/* Declear Classes*/
Player player; // Player Object
ArrayList<MonsterWave> waveSystem ; // Arraylist for waves of monsters
ArrayList<DropItem> dropingItems;
Table playerData;

void setup() {
  size(600, 1000);
  frameRate(60);
  smooth();

  // Read player data from file
  playerData = loadTable("playerData.csv", "header");
  for (TableRow row : playerData.rows()) {
    player = new Player(row.getInt("RedBullet"), 
                        row.getInt("GreenBullet"), 
                        row.getInt("BlueBullet"), 
                        row.getInt("PurpleBullet"), 
                        row.getInt("playerBulletSpeed"), 
                        row.getInt("playerBulletDelay"), 
                        row.getInt("playerMoney"));
  }
  
  // Create Objects
  waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters
  dropingItems = new ArrayList<DropItem>();
}

void draw() {
  // /println(monsterDropSpeed, waveDelay, waveDelayCounter);
  //println(player.weaponDamage[0]);
  println(playerData.getInt(0,"RedBullet"));
  switch (gameState) {
    case 0 :
      mainMenu();
    break;  
    case 1 :
      mainGame();
    break;
    case 2 :
      upgradeMenu();
    break;
    case 3 :
        
    break;    
  }
}

