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

//Variables

//Game State Variables
final int WelcomeScreen = 0; //final means that this value cannot be changed
final int GameScreen = 1;
final int EndScreen = 2;
int GameState = WelcomeScreen;

//Text Fonts
PFont Bounce;
PFont font;

//Variables for background Circles
int Xpos;
int Ypos;

//Declare Ball Class
Ball BounceBall = new Ball(250, 350, 3, -3);

//Array List for Tile
ArrayList<Tile> Tiles = new ArrayList<Tile>();

//Level Variables
final int Level1 = 1;
final int Level2 = 2;
final int Level3 = 3;
final int Level4 = 4;
final int Level5 = 5;
int LevelState = Level1;

void setup()
{
  size(500,700);
  
  Bounce = createFont("Title.otf", 64);
  font = createFont("batman.ttf", 32);
  
  //Variables for Creating different Tiles
  Tile temp;
  
  //Loop through columns
  for(int i=0; i<8; i++)
  {
    //Loop through rows
    for(int j=0; j<8; j++)
    {
      //Create a different tile (every iteration of the loop) if the RandomTile variable is between a certain number
      int RandomTile = (int)(random(0, 80));
      
      if(RandomTile <= 45)
      {
        temp = new TileEasy((i+1) *width/(10), (j+1) * 45);
        Tiles.add(temp);
        
      }//end else if
      else if(RandomTile > 45 && RandomTile <= 70)
      {
        temp = new TileNormal((i+1) *width/(10), (j+1) * 45);
        Tiles.add(temp);
        
      }//end else if
      else if(RandomTile > 70 && RandomTile <= 80)
      {
        temp = new TileHard((i+1) *width/(10), (j+1) * 45);
        Tiles.add(temp);
        
      }//end else if
    }//end for
  }//end for
  
}//end setup()

void draw()
{
  switch(GameState)
  {
    case WelcomeScreen:
      HomeScreenDisplay();
      break;
    
    case GameScreen:
      StartGame();
      switchLevels();
      break;
      
    case EndScreen:
      GameOver();
      break;
      
  }//end switch
}//end draw()

void HomeScreenDisplay()
{
  background(1,12,18);
  
  //Bounce Title
  fill(19, 161, 229);
  textSize(64);
  textFont(Bounce);
  text("Bounce", width/4 - 20, height/5);
  
  //Start Button
  //Initialise Button Call
  Button initialise = new Button("Start", width/2 - 70, height/2 - 7,width/2 - 70,height/2 - 36,130, 34,color(1,12,18), false, WelcomeScreen, GameScreen);
          
  //Initialise Button Start Screen
  initialise.update();
  initialise.fillRect();
  initialise.overRect(mouseX,mouseY,width/2 - 8, 34);
  initialise.mouseclick();
  
  //Background Detail
  BackgroundCircles();
  
}//end HomeScreenDisplay()

void StartGame()
{
  
  background(1,12,18);
  BackgroundCircles();
  
  Player BouncePlayer = new Player(40, 255, height-80, mouseX); //Player(BarSize, Color, Y, X)
  BouncePlayer.update();
  
  BounceBall.drawBall();
  BounceBall.update(45,mouseX,height-80); //Pass Player Co-ordinates to Ball
  
  for(int i = 0; i< Tiles.size(); i++)
  {
    Tiles.get(i).create();
    Tiles.get(i).CheckHit(i);
    Tiles.get(i).TileHit(i);
  }
  
}//end StartGame()

void GameOver()
{
  //Background Detail
  background(1,12,18);
  BackgroundCircles();
  
  fill(19, 161, 229);
  textFont(Bounce, 52);
  text("Game Over", width/4 - 45, height/5);
  
}//end GameOver()

void BackgroundCircles()
{
  noStroke();
  fill(19, 161, 229);
  for(Xpos = 5; Xpos < width; Xpos += 40)
  {
    for(Ypos = 5; Ypos < height; Ypos += 40)
    {
      ellipse(Xpos, Ypos, 1 , 1);
      
    }//end Ypos
    
  }//end Xpos
  
}//end BackgroundCircles()

void switchLevels()
{
  switch(LevelState)
  {
    case Level1:
      Level1();
      break;
      
    case Level2:
      Level2();
      break;
    
    case Level3:
      Level3();
      break;
      
    case Level4:
      Level4();
      break;
      
    case Level5:
      Level5();
      break;
  }
}

void Level1(){}
void Level2(){}
void Level3(){}
void Level4(){}
void Level5(){}