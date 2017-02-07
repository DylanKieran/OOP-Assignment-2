# OOP-Assignment-2
This is a github repository for my Object Orientated Programming assignment 2 for Year 2. We are required to create a classical game using the program processing. It should use the features that we have learnt so far.

For my project I wanted to create modern take on the classic game block breaker. I started my project by looking online for inspiration in terms of design aspects of my project. I found various images that inspired my game but ultimately it was my own design because I wanted it to feel unique.

## Key Features
- Different Types of tiles that inherit properties from a super class
- Rounds that progress endlessly and randomly with increasing difficulty
- Collision of the ball and Tiles
- Collision of the ball and paddle 
- Collision of the missile/enemy with the paddle and tiles
- Tiles that change depending on number of lives they have
- General Asthetic

How To Play
------
* Control the Paddle with your mouse
* Hit the ball with your paddle to bounce it in that direction
* If the ball hits the left side of the paddle it bounces left if it hits the right side it bounces right, if it hits the middle it bounces a little more vertically
* Your score is kept on the bottom bar along with your Lives and which Round your on
* You lose a life if you miss the ball
* You lose a life if you hit a missile 
* As the rounds progress the tiles get more difficult
* Easy Tile = 1 hit
* Normal Tile = 2 hit
* Hard Tile = 3 hit
* Dodge the missiles
* The missiles help by destroying tiles for you

### Start Screen
The Start screen I wanted to keep simple. I started by getting a font online that I thought would suit the asthetic. For the button I made a class that could be used over for other buttons throughout the game. When you hover over the start button it highlights and when pressed it changes the screen over to the game screen. The background carries on throughout the game its a series of small circles that are created in a double for loop, this just adds a nice detail to the game.

![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/StartScreen.png "Start Screen")

### Rounds
You start the game with 3 lives at Round 1 with 0 score. There are three types of tiles you encounter
- Easy Tile ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/EasyTile.png "Easy Tile")
- Normal Tile ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/NormalTileFull.png "Normal Tile Full Health") ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/NormalTile1.png "Normal Tile - 1 Health")
- Hard Tile ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/HardTileFull.png "Hard Tile Full Health") ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/HardTile2.png "Hard Tile - 1 Health") ![Alt text](https://github.com/Superdizzy17/OOP-Assignment-2/blob/master/HardTile3.png "Hard Tile 1 Health")
