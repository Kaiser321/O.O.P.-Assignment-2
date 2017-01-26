class MonsterWave {
  ArrayList<Monster> wave;
  int startX, startY;

  MonsterWave() {
  	wave = new ArrayList <Monster>();
  	startX = 50;
  	startY = 0;
  }



  void addMonsters() {
  	while (wave.size() < 6) {
  		wave.add(new Monster(new PVector(startX, startY)));
  		startX = startX + 100;
  	}
  }
  void display() {
    
    for(Monster w : wave) {
    	w.updateMonster();
    	w.drawMonster();
    }
  }
}