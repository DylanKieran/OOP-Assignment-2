/* 
------ BOUNCE -------

For screens have a game state same for Levels ????? 

Arkanoid

Power ups

Player class

Tile Super class

Tile sub classes different things they do different colours

Rounds

Score

Game Overscreen

Game start screen

Highscore loads in from a file

*/

void setup()
{
  size(600,800);
  
  StarWars = createFont("Title.otf", 64);
}

//Variables

//Game State Variables
final int WelcomeScreen = 0; //final means that this value cannot be changed
final int GameScreen = 1;
final int EndScreen = 2;
int GameState = WelcomeScreen;

//Text Fonts
PFont StarWars;

//Variables for background Circles
int Xpos;
int Ypos;

void draw()
{
  switch(GameState)
  {
    case WelcomeScreen:
      HomeScreenDisplay();
      break;
    
    case GameScreen:
      GameDisplay();
      break;
      
    case EndScreen:
      EndDisplay();
      break;
  }
}

void HomeScreenDisplay()
{
  background(1,12,18);
  fill(19, 161, 229);
  textSize(64);
  textFont(StarWars);
  text("Bounce", width/4, height/5);
  BackgroundCircles();
}

void GameDisplay()
{
  
}

void EndDisplay()
{
  
}

void BackgroundCircles()
{
  noStroke();
  fill(19, 161, 229);
  for(Xpos = 5; Xpos < width; Xpos += 40)
  {
    for(Ypos = 5; Ypos < height; Ypos += 40)
    {
      ellipse(Xpos, Ypos, 1 , 1);
    }
  }
}