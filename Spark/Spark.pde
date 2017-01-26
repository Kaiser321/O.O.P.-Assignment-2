 /* Gobal Variables*/
int width = 600, height = 1000;

/* Declear Classes*/
Player player = new Player();
ArrayList<MonsterWave> waveSystem = new ArrayList<MonsterWave>();;

MonsterWave m = new MonsterWave();

void setup() {
  size(600, 1000);

  m.addMonsters();
  
}

void draw() {
  background(0);

  player.updatePlayer();
  player.drawPlayer();

  m.display();

}