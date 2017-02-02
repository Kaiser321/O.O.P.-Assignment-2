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
  noStroke();

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
  } 
  else {
    return false;
  }
}



