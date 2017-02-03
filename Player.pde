class Player 
{
  int BarWidth;
  int BarHeight;
  color BarColour;
  float YPosition;
  float XPosition;
  
  Player(int BarWidth, int BarHeight, color BarColour, float YPosition, float XPosition)
  {
    this.BarWidth = BarWidth;
    this.BarHeight = BarHeight;
    this.BarColour = BarColour;
    this.YPosition = YPosition;
    this.XPosition = XPosition;
  }
  
  void update()
  {
    strokeWeight(2);
    stroke(BarColour);
    rect(XPosition-BarWidth, YPosition, BarWidth, BarHeight);
  }
}