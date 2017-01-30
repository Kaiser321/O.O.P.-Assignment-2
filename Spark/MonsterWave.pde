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
          wave.add(new RedMonster(new PVector(startX, startY), dropSpeed));
          startX += 100;
        break;  

        case 1 :
          wave.add(new GreenMonster(new PVector(startX, startY), dropSpeed));
          startX += 100;
        break;  

        case 2 :
          wave.add(new BlueMonster(new PVector(startX, startY), dropSpeed));
          startX += 100;
        break;

        case 3 :
          wave.add(new PurpleMonster(new PVector(startX, startY), dropSpeed));
          startX += 100;
        break;
      }
  	}
  }

  int checkDeadMonsters() {
    int numDead = 0;
    for(int i = wave.size() - 1; i >= 0; i--) {
      Monster w = wave.get(i);

      if(w.isDead()){
        imageMode(CENTER);
        image(explodeImage, w.getX(), w.getY(), 120, 120);
        if(w.getX() < 600) {
          dropingItems.add(w.dropItem(w.location));
        }
        w.removeMonster();
        numDead++;
      }
    }
    return numDead;
  }

  void displayWave() {
    for(int i = wave.size() - 1; i >= 0; i--) {
      Monster w = wave.get(i);
      w.updateMonster();
      w.drawMonster();
      w.displayHealthPoints();
    }
  }

  int getWaveSize() {
    return wave.size();
  }

  Monster getMonster(int monsterIndex) {
    return wave.get(monsterIndex);
  }
}