class MonsterWave {
  ArrayList<Monster> wave;
  int startX, startY;
  PImage explodeImage;

  MonsterWave() {
  	wave = new ArrayList <Monster>();
  	startX = 50;
  	startY = 0;
    explodeImage = loadImage("image/MonsterExplode.png");
  }

  void addMonsters(float dropSpeed) {
  	while (wave.size() < 6) {
      int r = (int)random(4);
      switch (r) {
        case 0 :
          wave.add(new Monster(new PVector(startX, startY), dropSpeed, "red"));
          startX += 100;
        break;  

        case 1 :
          wave.add(new Monster(new PVector(startX, startY), dropSpeed, "green"));
          startX += 100;
        break;  

        case 2 :
          wave.add(new Monster(new PVector(startX, startY), dropSpeed, "blue"));
          startX += 100;
        break;

        case 3 :
          wave.add(new Monster(new PVector(startX, startY), dropSpeed, "purple"));
          startX += 100;
        break;
      }
  	}
  }

  void displayWave() {
    for(int i = wave.size() - 1; i >= 0; i--) {
      Monster m = wave.get(i);
      m.updateMonster();
      m.drawMonster();
      m.displayHealthPoints();
      checkDeadMonsters(m);
    }
  }

  void checkDeadMonsters(Monster m) {
    if(m.isDead()){
      imageMode(CENTER);
      image(explodeImage, m.getX(), m.getY(), 120, 120);
      if(m.getX() < 600) {
        mainGame.dropingItems.add(m.dropItem(m.location));
      }
      m.removeMonster();
    }
  }

  int getWaveSize() {
    return wave.size();
  }

  Monster getMonster(int monsterIndex) {
    return wave.get(monsterIndex);
  }
}