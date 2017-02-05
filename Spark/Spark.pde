import ddf.minim.*;

/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 2; // How fast the waves drops
float waveDelay = 50; // Delay the next wave
float waveDelayCounter = 0.2; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;
int moneyThisRound = 0;
int gameState = 0;
boolean roundOver = false;
boolean playExplodeSound = false;

/* Declear Classes*/
Minim minim;
Player player; // Player Object
ArrayList<MonsterWave> waveSystem ; // Arraylist for waves of monsters
ArrayList<DropItem> dropingItems;
Table playerData;

AudioSample coinSound;
AudioSample hitSound;
AudioSample fireRedBullet;
AudioSample fireGreenBullet;
AudioSample fireBlueBullet;
AudioSample firePurpleBullet;
AudioSample explodeSound;
AudioSample pExplodeSound;
AudioSample diamondSound;
AudioSample selectSound;
AudioPlayer gameMusic;
AudioPlayer menuMusic;


void setup() {
  size(600, 1000);
  frameRate(60);
  smooth();
  minim = new Minim(this);

  coinSound = minim.loadSample("sound/Coin.wav" , 256);
  hitSound = minim.loadSample("sound/Hit.wav", 256);  
  fireRedBullet = minim.loadSample("sound/FireRedBullet.wav", 256);
  fireGreenBullet = minim.loadSample("sound/FireGreenBullet.wav", 256);
  fireBlueBullet = minim.loadSample("sound/FireBlueBullet.wav", 256);
  firePurpleBullet = minim.loadSample("sound/FirePurpleBullet.mp3", 256);
  explodeSound = minim.loadSample("sound/MonsterExplode.aiff" , 256);
  pExplodeSound = minim.loadSample("sound/PlayerExplode.wav" , 256);
  diamondSound = minim.loadSample("sound/Diamond.wav" , 256);
  selectSound = minim.loadSample("sound/MenuSelect.wav" , 256);
  gameMusic = minim.loadFile("sound/GameMusic.mp3" , 256);
  menuMusic = minim.loadFile("sound/MenuMusic.wav" , 256);
  menuMusic.loop();

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
  println(waveSystem.size(), dropingItems.size(), player.getWeapon().bulletsFired.size());
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
  }
}