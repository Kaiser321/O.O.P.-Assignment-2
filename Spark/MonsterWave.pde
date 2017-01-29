class MonsterWave {
  ArrayList<Monster> wave;
  int startX, startY;

  MonsterWave() {
  	wave = new ArrayList <Monster>();
  	startX = 50;
  	startY = 0;
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

  void display() {
    
    for(int i = wave.size() - 1; i >= 0; i--) {
      Monster w = wave.get(i);
      if (w.isDead() == false) {
        w.updateMonster();
        w.drawMonster();
        w.displayHealthPoints();
      }
      else {
        wave.remove(w);
      }
    }
  }

  int getWaveSize() {
    return wave.size();
  }

  Monster getMonster(int index) {
    return wave.get(index);
  }
}