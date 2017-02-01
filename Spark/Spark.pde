/* Gobal Variables*/
int width = 600, height = 1000;
float monsterDropSpeed = 3; // How fast the waves drops
float waveDelay = 100; // Delay the next wave
float waveDelayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

int playerWeaponArmed = 0;
int moneyThisRound = 0;
int gameState = 0;
boolean roundOver = false;

/* Declear Classes*/
Player player; // Player Object
ArrayList<MonsterWave> waveSystem ; // Arraylist for waves of monsters
ArrayList<DropItem> dropingItems;


void setup() {
  size(600, 1000);
  frameRate(60);
  smooth();

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
  switch (gameState) {
    case 0 :
      mainMenu();
    break;  
    case 1 :
      mainGame();
    break;
    case 2 :
      
    break;
    case 3 :
        
    break;    
  }
}

void mainMenu() {
  PImage shipIcon = loadImage("image/PlayerShip.png");
  PImage coinIcon = loadImage("image/Coin.png");
  PImage diamondIcon = loadImage("image/Diamond.png");
  PImage impactIcon = loadImage("image/BulletImpact.png");
  
  background(0);
  textAlign(CENTER);
  textSize(100);
  text("Spark", width / 2, height / 4);

  noFill();
  textSize(40);
  rectMode(CENTER);


  rect(width / 2, 490, 220, 50);
  text("Start Game", width / 2, 500);
  if(hoverButton(width / 2, 490, 220, 50)) {
    imageMode(CENTER);
    image(shipIcon, 160, 490, 50, 50);
    image(shipIcon, 440, 490, 50, 50);
    if (mousePressed) {
      gameState = 1;
    }
  }

  rect(width / 2, 590, 170, 50);
  text("Upgrade", width / 2, 600);
  if(hoverButton(width / 2, 590, 170, 50)) {
    imageMode(CENTER);
    image(coinIcon, 180, 590, 50, 50);
    image(coinIcon, 420, 590, 50, 50);
    if (mousePressed) {
      gameState = 2;
    }
  }


  rect(width / 2, 690, 245, 50);
  text("Leaderboard", width / 2, 700);
  if(hoverButton(width / 2, 690, 245, 50)) {
    imageMode(CENTER);
    image(diamondIcon, 150, 690, 50, 50);
    image(diamondIcon, 450, 690, 50, 50);
    if (mousePressed) {
      gameState = 3;
    }
  }


  rect(width / 2, 790, 90, 50);
  text("Quit", width / 2, 800);
  if(hoverButton(width / 2, 790, 90, 50)) {
    imageMode(CENTER);
    image(impactIcon, 220, 790, 50, 50);
    image(impactIcon, 380, 790, 50, 50);
    if (mousePressed) {
      exit();
    }
  }
}

boolean hoverButton(int x, int y, int width, int height)  {
  if (mouseX >= x- width && mouseX <= x+width && 
      mouseY >= y- height && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}