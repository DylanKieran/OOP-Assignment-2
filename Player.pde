class Player
{
  float BarSize;
  color BarColour;
  int YPosition;
  float XPosition;
  
  Player(float BarSize, color BarColour, int YPosition, float XPosition)
  {
    this.BarSize = BarSize;
    this.BarColour = BarColour;
    this.YPosition = YPosition;
    this.XPosition = XPosition;
  }
  
  void drawPlayer()
  {
    strokeWeight(5);
    stroke(BarColour);
    line(XPosition-BarSize, YPosition, XPosition+BarSize, YPosition);
  }
}