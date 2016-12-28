/* 
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
}

//Variables

//Game State Variables
final int WelcomeScreen = 0; //final means that this value cannot be changed
final int GameScreen = 1;
final int EndScreen = 2;
int GameState = WelcomeScreen;

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
  
}

void GameDisplay()
{
  
}

void EndDisplay()
{
  
}