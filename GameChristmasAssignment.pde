/*
Object Orientated Programming Assignment 2
Arkanoid Style game with level progression
DT228/2
Dylan Kieran
C15321906
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
Ball BounceBall = new Ball();
Enemy Bomber = new Enemy();

//Array List for Tile
ArrayList<Tile> Tiles = new ArrayList<Tile>();

//Boolean for loop
boolean SetTiles = false;

//Variables for Creating different Tiles
Tile temp;
int RandomTile;
int i = 0;

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
  
  //Font for Game
  Bounce = createFont("Title.otf", 64);
  
}//end setup()

void draw()
{
  //Switch statement to switch between GameStates
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
      Life();
      break;
      
    case EndScreen:
      GameOver();
      break;
      
  }//end switch
}//end draw()

//Function to initialise each round
void InitialiseRound()
{
  background(1,12,18);
  
  //Small background detail
  BackgroundCircles();
  
  //Design Features for HUD
  stroke(19, 161, 229);
  line(40,height-60,width-40,height-60);
  
  //Text to display Score
  textFont(Bounce,16);
  text("Score", width/2 - 16, height-40);
  textFont(Bounce,24);
  fill(#B7048D);
  text(Score, width/2- 8, height-10);
  
  //Text to display Round
  fill(19, 161, 229);
  textFont(Bounce,16);
  text("Round", width - 80, height-35);
  text(Round, width - 60, height-18);
  textAlign(RIGHT);
  
  //Text to display Lives
  textFont(Bounce,16);
  text("Lives", 80, height-35);
  text(PlayerLives, 60, height-18);
  textAlign(LEFT);
  
  //Creates a new instance of player and updates Co - ordinates
  Player BouncePlayer = new Player(80,5,mouseX,height-80);
  BouncePlayer.update();
  
  //Updates the ball and passes the Players postition for collision
  BounceBall.update(80,mouseX,height-80); //Pass Player Co-ordinates to Ball
  
  //Player collision with Enemy
  BouncePlayer.PlayerCollision();
  
  //Spawns Bomber/Enemy that falls from the sky after round 2 to progress difficulty
  if(Round > 2)
  {
    Bomber.Update();
  
    if (Bomber.Ypos > Bomber.maxDist)
    {
      Bomber.Respawn();
    }
  }
  
  //Loop through all 36 tiles
  for(i = 0; i< Tiles.size(); i++)
  {
    //Renders and checks if the tile has been hit
    Tiles.get(i).create();
    Tiles.get(i).CheckHit(i);
    Tiles.get(i).Update();
    
    //Once the size is 0 a new round is started
    if(Tiles.size() == 0)
    {
      Round = Round + 1;
      Score = Score + 100;
      NextRound = true;
      SetTiles = false;
      i = 0;
      BounceBall.Reset();
    }
  }
  
}//end InitialiseRound()


/*
TILE CREATION
Creates the arraylist of tiles,
Randomly selects which tiles are added each round,
However the chances of the easy tile decreases as the rounds go up until eventually none spawn,
and the hard and normal tile chances increase as the rounds go up
This adds level progression and randability to each round
It also progresses the difficulty of the game
*/

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
  }//end if
}//end InitialiseTiles

//Funcion that adds and EasyTile to the arraylist
void CreateEasyTile(int row, int col)
{
  temp = new TileEasy((row+1) *width/(7 + 2), (col+1) * 42);  
  Tiles.add(temp);
}

//Funcion that adds and NormalTile to the arraylist
void CreateNormalTile(int row, int col)
{
  temp = new TileNormal((row+1) *width/(7 + 2), (col+1) * 42);
  Tiles.add(temp);
}

//Funcion that adds and HardTile to the arraylist
void CreateHardTile(int row, int col)
{
  temp = new TileHard((row+1) *width/(7 + 2), (col+1) * 42);
  Tiles.add(temp);
}

//Displays GameOver screen once the user reaches 0 Lives
void Life()
{
  if(PlayerLives == 0)
  {
    GameState = EndScreen;
  }
}

/* SCREEN DISPLAYS */

  void HomeScreenDisplay()
  {
    background(1,12,18);
    
    //Bounce Title
    fill(19, 161, 229);
    textSize(64);
    textFont(Bounce);
    textAlign(CENTER);
    text("Bounce", width/2, height/5);
    
    //Start Button
    Button Start = new Button("Start", width/2, height/2 - 7,width/2 - 70,height/2 - 36,130, 34,color(1,12,18), false, WelcomeScreen, GameScreen);
            
    //Start Button Welcome Screen
    Start.update();
    Start.fillRect();
    Start.overRect(mouseX,mouseY,width/2 - 8, 34);
    Start.mouseclick();
    
    //Background Detail
    BackgroundCircles();
    
  }//end HomeScreenDisplay()
  
  void GameOver()
  {
    //Background Detail
    background(1,12,18);
    BackgroundCircles();
    
    //Game Over 
    fill(19, 161, 229);
    textFont(Bounce, 52);
    textAlign(CENTER);
    text("Game Over", width/2 /*- 45*/, height/5);
    
    //Display Score to User
    fill(19, 161, 229);
    textFont(Bounce, 32);
    textAlign(CENTER);
    text("Your Score", width/2 /*- 115*/, height/2 - 100);
    
    fill(#B7048D);
    textFont(Bounce, 32);
    textAlign(CENTER);
    text(Score, width/2 /*- 20*/, height/2 - 60);
    
    //Reset Game Function call
    ResetGame();
    
  }//End GameOver()
  
  //Game Reset Function
  void ResetGame()
  {
    //Reset Button
    Button Reset = new Button("Reset", width/2, height/2 + 70,width/2 - 70,height/2 + 44,130, 34,color(1,12,18), false, EndScreen, GameScreen);
    Reset.update();
    Reset.fillRect();
    Reset.overRect(mouseX,mouseY,width/2 - 8, 34);
    Reset.mouseclick();
    
    //Set all variables to default state
    NextRound = true;
    SetTiles = false;
    i = 0;
    Round = 1;
    if(Reset.mouseclick())
    {
      Score = 0;
    }
    PlayerLives = 3;
    
    BounceBall.Reset();
    
    for(int j = 0; j<Tiles.size(); j++)
    {
      Tiles.remove(j);
    }
    
  }
  
  //Background display graphic
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
    