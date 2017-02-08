class MainMenu {
  PImage shipIcon;
  PImage coinIcon;
  PImage diamondIcon;
  PImage impactIcon;

  MainMenu() {
    shipIcon = loadImage("image/PlayerShip.png");
    coinIcon = loadImage("image/Coin.png");
    diamondIcon = loadImage("image/Diamond.png");
    impactIcon = loadImage("image/BulletImpact.png");
  }
  
  void displayTitle(){
    background(0);
    textAlign(CENTER);
    textSize(100);
    text("Spark", width / 2, height / 4);
  }

  void displayStart() {
    noFill();
    textSize(40);
    rectMode(CENTER);
    noStroke();

    rect(width / 2, 490, 220, 50);
    text("Start Game", width / 2, 500);
    if(hoverButton(width / 2, 490, 220, 50)) {
      imageMode(CENTER);
      image(shipIcon, 160, 490, 50, 50);
      image(shipIcon, 440, 490, 50, 50);
      if (mousePressed) {
        menuMusic.rewind();
        menuMusic.pause();
        gameMusic.loop();
        selectSound.trigger();
        gameState = 1;
      }
    }
  }

  void displayUpgrade() {
    rect(width / 2, 590, 170, 50);
    text("Upgrade", width / 2, 600);
    if(hoverButton(width / 2, 590, 170, 50)) {
      imageMode(CENTER);
      image(coinIcon, 180, 590, 50, 50);
      image(coinIcon, 420, 590, 50, 50);
      if (mousePressed) {
        gameState = 2;
        selectSound.trigger();
      }
    }
  }

  void displayHelp() {
    rect(width / 2, 690, 245, 50);
    text("Help", width / 2, 700);
    if(hoverButton(width / 2, 690, 245, 50)) {
      imageMode(CENTER);
      image(diamondIcon, 200, 690, 50, 50);
      image(diamondIcon, 400, 690, 50, 50);
      if (mousePressed) {
        gameState = 3;
      }
    }
  }
  
  void displayQuit() {
    rect(width / 2, 790, 90, 50);
    text("Quit", width / 2, 800);
    if(hoverButton(width / 2, 790, 90, 50)) {
      imageMode(CENTER);
      image(impactIcon, 220, 790, 50, 50);
      image(impactIcon, 380, 790, 50, 50);
      if (mousePressed) {
        saveData();
        exit();
      }
    }
  }

  void displayMenu() {
    this.displayTitle();
    this.displayStart();
    this.displayUpgrade();
    this.displayHelp();
    this.displayQuit();
  }
}

boolean hoverButton(int x, int y, int width, int height)  {
  if (mouseX >= x- width && mouseX <= x+width && 
      mouseY >= y- height && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}