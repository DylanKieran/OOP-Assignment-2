class Ball
{
  float Xpos;
  float Ypos;
  float XSpeed;
  float YSpeed;
  
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
  
  void update()
  {
    Xpos = Xpos + XSpeed;
    Ypos = Ypos + YSpeed;
    
    if(Xpos > width || Xpos<0)
    {
      XSpeed = -XSpeed;
    }
    
    if(Ypos<0)
    {
      YSpeed = -YSpeed;
    }
  }
}