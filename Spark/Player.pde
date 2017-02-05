class Player {
  PVector location;
  int size;
  PImage playerShip;


  int[] weaponDamage = new int[4]; // 0 = RedBullet, 1 = GreenBullet, 2 = BlueBullet, 3 = PurpleBullet
  int bulletSpeed = 0;
  int bulletDelay = 0;
  int money;
  Weapon weapon; // Current Weapon armed


  Player(int redDamage, int greenDamage, int blueDamage,int purpleDamage, int bSpeed, int bDelay, int pMoney) { 
    location = new PVector(0, 900);
    size = 100;
    playerShip = loadImage("image/PlayerShip.png");

    weaponDamage[0] = redDamage;
    weaponDamage[1] = greenDamage;
    weaponDamage[2] = blueDamage;
    weaponDamage[3] = purpleDamage;
    bulletSpeed = bSpeed;
    bulletDelay = bDelay;
    money = pMoney;
    weapon = new Weapon(bulletSpeed, bulletDelay, weaponDamage); // Current Weapon armed

  }
  
  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
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
    image(playerShip,location.x, location.y, size, size);
  }

  Weapon getWeapon() {
    return weapon;
  }

  void playSound() {
    pExplodeSound.trigger();
  }

}