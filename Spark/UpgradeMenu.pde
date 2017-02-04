void upgradeMenu() {
  PImage shipModel = loadImage("image/PlayerShip.png");
  PImage redBulletIcon = loadImage("image/RedBullet.png");
  PImage greenBulletIcon = loadImage("image/GreenBullet.png");
  PImage blueBulletIcon = loadImage("image/BlueBullet.png");
  PImage purpleBulletIcon = loadImage("image/PurpleBullet.png");

  int modelSize = 150;
  int iconSize = 50;
  int btnSizeX = 100;
  int btnSizeY = 60;
  int cost = 10;

  background(0);
  stroke(150);
  strokeWeight(3);
  noFill();
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(15);

  rect(width / 2, (height/10) * 6, width - 100, height- 250);
  rect(width / 2, (height/10) * 4.5, width - 150, height- 600);

  imageMode(CENTER);
  image(shipModel, width/2, (height/10) * 1.1, modelSize, modelSize);

  // Section for Red Bullet upgrades 
  image(redBulletIcon, (width/6) * 2, (height/10) * 3, iconSize, iconSize + 25);
  text("Damage: " + player.weaponDamage[0], (width/6) * 2, (height/10) * 3.5);
  if(player.weaponDamage[0] != 100){
    text("Upgrade\nCost: " + (cost*player.weaponDamage[0]), (width/6) * 2, (height/10) * 4);
    if(hoverButton((width/6) * 2, (height/10) * 4, btnSizeY, btnSizeY) && player.money >= cost*player.weaponDamage[0]){
      fill(255);
      rect((width/6) * 2, (height/10) * 4, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= cost*player.weaponDamage[0];
        player.weaponDamage[0] += 25;
      }
    }
    else{
      noFill();
      rect((width/6) * 2, (height/10) * 4, btnSizeX, btnSizeY);
    }
  }
  else {
    text("Max Level!", (width/6) * 2, (height/10) * 4);
    noFill();
    rect((width/6) * 2, (height/10) * 4, btnSizeX, btnSizeY);
  }

  // Section for Green Bullet upgrades 
  image(greenBulletIcon,(width/6) * 4, (height/10) * 3, iconSize, iconSize + 25);
  text("Damage: " + player.weaponDamage[1], (width/6) * 4, (height/10) * 3.5);
  if(player.weaponDamage[1] != 100){
    text("Upgrade\nCost: " + (cost*player.weaponDamage[1]), (width/6) * 4, (height/10) * 4);
    if(hoverButton((width/6) * 4, (height/10) * 4, btnSizeX - 25, btnSizeY - 25) && player.money >= cost*player.weaponDamage[1]){
      fill(255);
      rect((width/6) * 4, (height/10) * 4, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= cost*player.weaponDamage[1];
        player.weaponDamage[1] += 25;
      }
    }
    else{
      noFill();
      rect((width/6) * 4, (height/10) * 4, btnSizeX, btnSizeY);
    }
  }
  else {
    text("Max Level!", (width/6) * 4, (height/10) * 4);
    noFill();
    rect((width/6) * 4, (height/10) * 4, btnSizeX, btnSizeY);
  }

  // Section for Blue Bullet upgrades 
  image(blueBulletIcon,(width/6) * 2, (height/10) * 5, iconSize, iconSize + 25);
  text("Damage: " + player.weaponDamage[2], (width/6) * 2, (height/10) * 5.5);
  if(player.weaponDamage[2] != 100){
    text("Upgrade\nCost: " + (cost*player.weaponDamage[2]), (width/6) * 2, (height/10) * 6);
    if(hoverButton((width/6) * 2, (height/10) * 6, btnSizeX- 25, btnSizeY- 25) && player.money >= cost*player.weaponDamage[2]){
      fill(255);
      rect((width/6) * 2, (height/10) * 6, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= cost*player.weaponDamage[2];
        player.weaponDamage[2] += 25;
      }
    }
    else{
      noFill();
      rect((width/6) * 2, (height/10) * 6, btnSizeX, btnSizeY);    }
  }
  else {
    text("Max Level!", (width/6) * 2, (height/10) * 6);
    noFill();
    rect((width/6) * 2, (height/10) * 6, btnSizeX, btnSizeY);
  }

  // Section for Purple Bullet upgrades 
  image(purpleBulletIcon, (width/6) * 4, (height/10) * 5, iconSize, iconSize + 25);
  text("Damage: " + player.weaponDamage[3], (width/6) * 4, (height/10) * 5.5);
  if(player.weaponDamage[3] != 100){
    text("Upgrade\nCost: " + (cost*player.weaponDamage[3]), (width/6) * 4, (height/10) * 6);
    if(hoverButton((width/6) * 4, (height/10) * 6, btnSizeX- 25, btnSizeY- 25) && player.money >= cost*player.weaponDamage[3]){
      fill(255);
      rect((width/6) * 4, (height/10) * 6, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= cost*player.weaponDamage[3];
        player.weaponDamage[3] += 25;
      }
    }
    else{
      noFill();
      rect((width/6) * 4, (height/10) * 6, btnSizeX, btnSizeY);
    }
  }
  else {
    text("Max Level!", (width/6) * 4, (height/10) * 6);
    noFill();
    rect((width/6) * 4, (height/10) * 6, btnSizeX, btnSizeY);
  }

  // Section for Save button 
  rect((width/6) * 3, (height/10) * 9, btnSizeX, btnSizeY);
  text("Save", (width/6) * 3, (height/10) * 9);
  if(hoverButton((width/6) * 3, (height/10) * 9, btnSizeX- 25, btnSizeY- 25)){
      fill(255);
      rect((width/6) * 3, (height/10) * 9, btnSizeX, btnSizeY);
      if (mousePressed) {
        saveData();
        gameState = 0;
      }
    else{
      noFill();
      rect((width/6) * 3, (height/10) * 9, btnSizeX, btnSizeY);
    }
  }
  else {
    noFill();
    rect((width/6) * 3, (height/10) * 9, btnSizeX, btnSizeY);
  }


  // Section for Bullet Speed upgrades
  rect((width/6) * 2, (height/10) * 8, btnSizeX, btnSizeY);
  text("Bullet Speed: " + (player.bulletSpeed), (width/6) * 2, (height/10) * 7.5);
  if(player.bulletSpeed != 35){
    text("Upgrade\nCost: " + (cost * player.bulletSpeed * 10), (width/6) * 2, (height/10) * 8);
    if(hoverButton((width/6) * 2, (height/10) * 8, btnSizeX- 25, btnSizeY- 25) && player.money >= ((cost*cost) * player.bulletSpeed)) {
      fill(255);
      rect((width/6) * 2, (height/10) * 8, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= ((cost*cost) * player.bulletSpeed);
        player.bulletSpeed += 5;
      }
    }
    else{
      noFill();
      rect((width/6) * 2, (height/10) * 8, btnSizeX, btnSizeY);
    }
  }
  else {
    text("Max Level!", (width/6) * 2, (height/10) * 8);
    noFill();
    rect((width/6) * 2, (height/10) * 8, btnSizeX, btnSizeY);
  }

  // Section for Rate of Fire upgrades
  rect((width/6) * 4, (height/10) * 8, btnSizeX, btnSizeY);
  text("Rate of Fire: " + (player.bulletDelay), (width/6) * 4, (height/10) * 7.5);
  if(player.bulletDelay != 1){
    text("Upgrade\nCost: " + (cost * player.bulletDelay * 10), (width/6) * 4, (height/10) * 8);
    if(hoverButton((width/6) * 4, (height/10) * 8, btnSizeX- 25, btnSizeY- 25) && player.money >= ((cost*cost) * player.bulletDelay)) {
      fill(255);
      rect((width/6) * 4, (height/10) * 8, btnSizeX, btnSizeY);
      if (mousePressed) {
        player.money -= ((cost*cost) * player.bulletDelay);
        player.bulletDelay -= 1;
      }
    }
    else{
      noFill();
      rect((width/6) * 4, (height/10) * 8, btnSizeX, btnSizeY);
    }
  }
  else {
    text("Max Level!", (width/6) * 4, (height/10) * 8);
    noFill();
    rect((width/6) * 4, (height/10) * 8, btnSizeX, btnSizeY);
  }


  // Display player Money
  textSize(30);
  text("Money: " + player.money, (width/6) * 5, (height/10) * 2);

}

void saveData() {

  for (TableRow row : playerData.rows()) {
    row.setInt("RedBullet", player.weaponDamage[0]);
    row.setInt("GreenBullet", player.weaponDamage[1]);
    row.setInt("BlueBullet", player.weaponDamage[2]);
    row.setInt("PurpleBullet", player.weaponDamage[3]);
    row.setInt("playerBulletSpeed", player.bulletSpeed);
    row.setInt("playerBulletDelay", player.bulletDelay);
    row.setInt("playerMoney", player.money);
  }
  saveTable(playerData, "data/playerData.csv");
}