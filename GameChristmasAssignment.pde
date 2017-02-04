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
Ball BounceBall = new Ball();

//Array List for Tile
ArrayList<Tile> Tiles = new ArrayList<Tile>();

boolean SetTiles = false;

int i = 0;

//Variables for Creating different Tiles
Tile temp;
int RandomTile;

//Variables for Rounds
int Round = 1;
boolean NextRound = true;

//Score and PlayerLives Variables
int Score = 0;
int PlayerLives = 3;

void setup()
{
  size(500,700);
  frameRate(60);
  
  Bounce = createFont("Title.otf", 64);
  font = createFont("batman.ttf", 32);
  
}//end setup()

void draw()
{
  switch(GameState)
  {
    case WelcomeScreen:
      HomeScreenDisplay();
      break;
    
    case GameScreen:
      InitialiseRound();
      if(NextRound == true)
      {
        InitialiseTiles();
      }
      break;
      
    case EndScreen:
      GameOver();
      break;
      
  }//end switch
}//end draw()

void InitialiseRound()
{
  background(1,12,18);
  BackgroundCircles();
  
  Player BouncePlayer = new Player(80, 5, 255, height-80, mouseX); //Player(BarSize, Color, Y, X)
  BouncePlayer.update();
  BounceBall.update(80,mouseX,height-80); //Pass Player Co-ordinates to Ball
  
  for(i = 0; i< Tiles.size(); i++)
  {
    Tiles.get(i).create();
    Tiles.get(i).CheckHit(i);
    Tiles.get(i).Update();
    
    if(Tiles.size() == 0)
    {
      Round = Round + 1;
      Score = Score + 100;
      NextRound = true;
      SetTiles = false;
      i = 0;
    }
  }
  
}//end InitialiseRound()

/*TILE CREATION*/

void InitialiseTiles()
{
  int Chance = 0;
  int IncreaseDifficulty = 0;
  NextRound = false;
  if(SetTiles == false)
  {
   for(int row=0; row < 7; row++)
   {
    //Loop through rows
    for(int col=0; col < 5; col++)
    {
      //Randomize Tile Spawn
      if(Round == 1)
      {
        Chance = 40;
      }
      if(Round == 2)
      {
        Chance = 65;
      }
      if(Round == 3)
      {
        Chance = 75;
      }
      if(Round == 3)
      {
        Chance = 80;
      }
      if(Round == 4)
      {
        Chance = 80;
        IncreaseDifficulty = 35;
      }
      if(Round == 5)
      {
        Chance = 80;
        IncreaseDifficulty = 41;
      }
      if(Round > 5)
      {
        Chance = 80;
        IncreaseDifficulty = 55;
      }
      
      RandomTile = (int)(random(IncreaseDifficulty, Chance));
      
      if(RandomTile <= 40)
      {
        CreateEasyTile(row,col); 
      }//end else if
      else if(RandomTile > 40 && RandomTile <= 70)
      {
        CreateNormalTile(row,col); 
      }//end else if
      else if(RandomTile > 70 && RandomTile <= 80)
      {
        CreateHardTile(row,col); 
      }//end else if
      
    }//end for
  }//end for
   SetTiles = true;
  }
}

void CreateEasyTile(int row, int col)
{
  temp = new TileEasy((row+1) *width/(7 + 2), (col+1) * 42);  
  Tiles.add(temp);
}

void CreateNormalTile(int row, int col)
{
  temp = new TileNormal((row+1) *width/(7 + 2), (col+1) * 42);
  Tiles.add(temp);
}

void CreateHardTile(int row, int col)
{
  temp = new TileHard((row+1) *width/(7 + 2), (col+1) * 42);
  Tiles.add(temp);
}

/* SCREEN DISPLAYS */

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
  
  void GameOver()
  {
    //Background Detail
    background(1,12,18);
    BackgroundCircles();
    
    fill(19, 161, 229);
    textFont(Bounce, 52);
    text("Game Over", width/4 - 45, height/5);
    
    ResetGame();
    
  }//End GameOver()
  
  void ResetGame()
  {
    //Reset Button
    Button Reset = new Button("Reset", width/2 - 70, height/2 - 7,width/2 - 70,height/2 - 36,130, 34,color(1,12,18), false, EndScreen, GameScreen);
    
    //Initialise Button Start Screen
    Reset.update();
    Reset.fillRect();
    Reset.overRect(mouseX,mouseY,width/2 - 8, 34);
    
    Reset.mouseclick();
    
    NextRound = true;
    SetTiles = false;
    i = 0;
    Round = 1;
    Score = 0;
    
    BounceBall.Reset();
    
    for(int j = 0; j<Tiles.size(); j++)
    {
      Tiles.remove(j);
    }
    
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
      }//end Ypos
    }//end Xpos
  }//end BackgroundCircles()
    