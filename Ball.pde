class Ball 
{
  float Xpos;
  float Ypos;
  float XSpeed;
  float YSpeed;
  float PlayerHalf;
  float PlayerXPos;
  float PlayerYPos;
  
  Ball(float Xpos, float Ypos, float XSpeed, float YSpeed)
  {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.XSpeed = XSpeed;
    this.YSpeed = YSpeed;
  }
  
  void drawBall()
  {
    fill(255);
    ellipse(Xpos, Ypos, 5, 5);
  }
  
  void update(float PlayerHalf, float PlayerXPos, float PlayerYPos)
  {
    
    Xpos = Xpos + XSpeed;
    Ypos = Ypos + YSpeed;
    
    if(Xpos > width || Xpos < 0)
    {
      XSpeed = -XSpeed;
    }
    
    if(Ypos < 0)
    {
      YSpeed = -YSpeed;
    }
    
    //Ball and Player interaction
    if((PlayerXPos - PlayerHalf) < Xpos && (PlayerXPos + PlayerHalf) > Xpos && (PlayerYPos - 5) < Ypos && (PlayerYPos) > Ypos)
    {
      YSpeed = - YSpeed;
    }
    
    if(Ypos > height)
    {
      GameState = EndScreen;
    }
    
  }
  
  //Ball and Tiles interaction
  void BallHit()
  {
    
  }
}