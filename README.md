# O.O.P.-Assignment-2


# Video 
[![YouTube](https://i.ytimg.com/vi/D7d1gAzW0QU/hqdefault.jpg?custom=true&w=196&h=110&stc=true&jpg444=true&jpgq=90&sp=68&sigh=TPqjP-Ae1bI5Ubio-4xUn4a_qfk)](https://www.youtube.com/watch?v=D7d1gAzW0QU&t)

# Idea 
- The main game concept is inspired by a popular Facebook game called Everwing created by Blackstorm Labs in 2016.
-I wanted to take the main game mechanic from Everwing and add a retro arcade game feel to it.

# Plan / Prototype 
- I took the main concepts from Everwing such as dropping monsters, collecting coin, upgrading and level progressing.
- I made this game in a Sci-Fi/Space theme
- I wanted to implement a arcade game style mechanism that involves the player to input.

# Development
- I start by making the monster dropping system. Each monster is contained in a arraylist called waves that contains 6 monsters. Every wave is contain in a array list called wave system
- I then made the player class and weapon system
- The weapon system works like this: when player input detected for fire bullet, a bullet object will be made and be added to a arraylist of bullets.
- When a monster is destroyed a item will be dropped
- Each frame out of window bullets, items and monsters will be removed and the rest will be drawn
- Then I implemented the collision system which detects Monster to bullet, Item to player and monster to player collision.
- I came up with a mechanism where they are 4 different types of enemy and 4 different types of bullet the plater can fire. The player must shoot the enemy with the right bullet in order to do damage

# How to Play
- Move mouse cursor left and right to move the spaceship
- Use mouse click to shoot and hold it down to go full automatic 
- Use keys 1, 2, 3, and 4 to change the bullet types and each bullet type is color coded 
- 1 fires Red bullets, 2 is Green bullet, 3 arms Blue bullets and 4 is for Purple bullets
- There are 4 different types of enemies each color coded the same as the bullets
- To do damage to the enemies you must shoot them with the bullet that matches it's color, or else they take no damage 
- Make sure to try to collect the coins the enemy drops after they explode. Save up to buy upgrades later for the ship to make it more powerful
- Gold coins is worth 1 and blue diamond is worth 10
- As a game round goes on the monsters will drop faster and more frequent
- All money earned and upgrades bought will be saved so you can continue where you left off the next time you play the game
- Bullets starts with 25 damage. Each upgrade increases it by 25 and max out on 100 (if you max it out its 1 shot kill)
- Upgrading bullet speed makes your bullet travel fast and Rate of fire makes your weapon shoot faster. There are 4 levels to upgrade for both of them 

# Key Features 
- Everything in this game is a class
- There's an array list called WaveSystem that contains all the waves objects that spawned. Each waves contains an array list of 6 monsters objects that were created and added upon spawning the wave
- The player object contains a weapon object that contains an arraylist of bullets. Each time a bullet is fired a new bullet is made and added to the array list.
- There's an array list for drop items the stored all drop items
- Money gained and upgrades made by the player will be saved to a file that loads every time the game starts
- Polymorphism is used for the items as Coin and Diamond class are child class of DropItem and all those objects are stored in the same arraylist

# Assets 
- All images used are made by me, and imported and resized by processing 
- All sound are downloaded from freesound.org

