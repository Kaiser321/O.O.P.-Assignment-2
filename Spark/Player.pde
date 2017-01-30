class Player {
  PVector location;
  PVector playerSize;
  PImage playerShip;
  int[] weaponDamage = new int[4]; // 0 = RedBullet, 1 = GreenBullet, 2 = BlueBullet, 3 = PurpleBullet
  int bulletSpeed = 0;
  int bulletDelay = 0;
  Weapon weapon; // Current Weapon armed

  Player(int redDamage, int greenDamage, int blueDamage,int purpleDamage, int bSpeed, int bDelay) { 
    location = new PVector(0, 900);
    playerSize = new PVector(100, 100);
    playerShip = loadImage("image/PlayerShip.png");
    weaponDamage[0] = redDamage;
    weaponDamage[1] = greenDamage;
    weaponDamage[2] = blueDamage;
    weaponDamage[3] = purpleDamage;
    bulletSpeed = bSpeed;
    bulletDelay = bDelay;
    weapon = new Weapon(bulletSpeed, bulletDelay, weaponDamage); // Current Weapon armed
  }
  
  
  void updatePlayer() {
    location.x = mouseX;
    
    if(location.x <= 50) {
      location.x = 50;
    }
    else if(location.x >= 550) {
     location.x = 550; 
    }  
  }
  
  void drawPlayer() {
    imageMode(CENTER);
    image(playerShip,location.x, location.y, playerSize.x, playerSize.y);
  }

  Weapon getWeapon() {
    return weapon;
  }

}