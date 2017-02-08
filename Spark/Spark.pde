import ddf.minim.*;

/* Gobal Variables*/
int width = 600, height = 1000;
int gameState = 0;

/* Declear Classes*/
Minim minim;
Player player; // Player Object

Table playerData;
MainGame mainGame;
MainMenu mainMenu;
UpgradeMenu upgradeMenu;
HelpPage helpPage;

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
  mainGame = new MainGame();
  mainMenu = new MainMenu();
  upgradeMenu = new UpgradeMenu();
  helpPage = new HelpPage();



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
  
}

void draw() {
  println(mainGame.dropingItems.size());
  switch (gameState) {
    case 0 :
      mainMenu.displayMenu();
    break;  
    case 1 :
      mainGame.runGame();
    break;
    case 2 :
      upgradeMenu.displayUpgradeMenu();
    break;   
    case 3 :
      helpPage.displayHelp();
    break;  
  }
}