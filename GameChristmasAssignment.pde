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
  size(500,700);
  
  Bounce = createFont("Title.otf", 64);
  font = createFont("batman.ttf", 32);
}

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
}

void GameDisplay()
{
  background(1,12,18);
  BackgroundCircles();
  
  Player BouncePlayer = new Player(40, 255, height-80, mouseX); //Player(BarSize, Color, Y, X)
  BouncePlayer.update();
  
  BounceBall.drawBall();
  BounceBall.update(45,mouseX,height-80); //Pass Player Co-ordinates to Ball
  
}

void EndDisplay()
{
  //Background Detail
  background(1,12,18);
  BackgroundCircles();
  
  fill(19, 161, 229);
  textFont(Bounce, 52);
  text("Game Over", width/4 - 45, height/5);
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