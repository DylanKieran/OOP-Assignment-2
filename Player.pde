class Player 
{
  int BarWidth;
  int BarHeight;
  color BarColour;
  float YPosition;
  float XPosition;
  
  Player(int BarWidth,int BarHeight,color BarColour,float XPosition,float YPosition)
  {
    this.BarWidth = BarWidth;
    this.BarHeight = BarHeight;
    this.BarColour = BarColour;
    this.XPosition = XPosition;
    this.YPosition = YPosition;
  }
  
  void update()
  {
    fill(BarColour);
    rect(XPosition-BarWidth, YPosition, BarWidth, BarHeight);
  }
}