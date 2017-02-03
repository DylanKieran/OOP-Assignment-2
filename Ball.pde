class Ball 
{
  float Xpos;
  float Ypos;
  float XSpeed;
  float YSpeed;
  float PlayerWidth;
  float PlayerXPos;
  float PlayerYPos;
  
  Ball()
  {
    this.Xpos = 250;
    this.Ypos = 350;
    this.XSpeed = 4;
    this.YSpeed = -4;
  }
  
  void update(float PlayerWidth, float PlayerXPos, float PlayerYPos)
  {
    fill(255);
    ellipse(Xpos, Ypos, 5, 5);
    
    Xpos += XSpeed;
    Ypos += YSpeed;
    
    if(Xpos > width || Xpos < 0)
    {
      XSpeed = -XSpeed;
    }
    
    if(Ypos < 0)
    {
      YSpeed = -YSpeed;
    }
    
    if(Ypos > height)
    {
      GameState = EndScreen;
    }
    
    //Change direction of the ball when it hits the paddle depending on which direction the ball comes from
    
    //Hits left side of paddle
    if(Ypos >= PlayerYPos && Ypos < PlayerYPos + 5)
    {
      
      //Hits the far left hand side of the Paddle
      if(Xpos > (PlayerXPos - PlayerWidth) && Xpos < (PlayerXPos-(1./3)*PlayerWidth) && XSpeed > 0 && YSpeed > 0)
      {
        XSpeed = 4;
        YSpeed *= -1;
      }
      
      //Hits the left but more center
      else if(Xpos > (PlayerXPos - PlayerWidth) && Xpos < (PlayerXPos-(1./3)*PlayerWidth) && XSpeed < 0 && YSpeed > 0)
      {
        XSpeed = -4;
        YSpeed *= -1;
      }
      
      //Hits the right hand side of the paddle
      else if(Xpos >(PlayerXPos + PlayerWidth) && Xpos< (PlayerXPos + PlayerWidth) && XSpeed > 0 && YSpeed > 0)
      {
        XSpeed = 4;
        YSpeed *= -1;
      }
      
      //Hit the right side but more center
      else if (Xpos > (PlayerXPos + PlayerWidth) && Xpos < (PlayerXPos + PlayerWidth) && XSpeed < 0 && YSpeed > 0) 
      {
        XSpeed = -4;
        YSpeed *= -1;
      }
      
      //Hit the middle of the paddle
      else if (Xpos > (PlayerXPos - (1./3) * PlayerWidth) && Xpos < (PlayerXPos + (1./3) * PlayerWidth) && YSpeed > 0) 
      {
        XSpeed = 4;
        YSpeed *= -1;
      }
    }
  }
}