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
  		wave.add(new Monster(new PVector(startX, startY), dropSpeed));
  		startX = startX + 100;
  	}
  }

  void display() {
    
    for(Monster w : wave) {
      if (w.isDead() == false) {
        w.updateMonster();
        w.drawMonster();
      }
      else {
        w.updateMonster();
      }
    }
  }
}