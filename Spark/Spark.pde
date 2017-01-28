/* Gobal Variables*/
int width = 600, height = 1000;
float dropSpeed = 2; // How fast the waves drops
float delay = 100; // Delay the next wave
float delayCounter = 0.3; // Counter used to decrease the delay time as the game goes on

/* Declear Classes*/
Player player = new Player(); // Player Object
ArrayList<MonsterWave> waveSystem = new ArrayList<MonsterWave>(); // Arraylist for waves of monsters

void setup() {
  size(600, 1000);
  smooth();

  // Making the first wave
  waveSystem.add(new MonsterWave());
  for(MonsterWave m : waveSystem) {
  	m.addMonsters(dropSpeed);
  }


}

void draw() {
  
  background(0);


  // Display the wave
  for(MonsterWave m : waveSystem) {
    m.display();
  }

  // Making the next wave and display Monsters
  if(nextWave()) {
  	waveSystem.add(new MonsterWave());

  	for(MonsterWave m : waveSystem) {
      m.addMonsters(dropSpeed);
    }
    

    // m.size() = last node in arraylist
    //MonsterWave m = waveSystem.get(waveSystem.size()-1);
    //m.addMonsters(dropSpeed);

    dropSpeed = dropSpeed * 1.03;
  }

  
  //Update and draw bullet



  // Check for Collision 

  // update and draw Player
  player.updatePlayer();
  player.drawPlayer();


  // Remove MonsterWaves if they move off the window
  if (waveSystem.size() > 0) {
    if(waveSystem.get(0).wave.get(0).getY() >= 1100) {
      waveSystem.remove(0);
    }
  }

  // Remove bullet


  println(frameRate);


}

boolean nextWave() {
	if(delay <= 0) {
		delay = 100;
		delayCounter = delayCounter + 0.03;
		return true;
		
	}
	else {
		delay = delay - delayCounter;
		return false;	
	}
}