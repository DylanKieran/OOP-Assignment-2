class Player
{
  float BarSize;
  color BarColour;
  float YPosition;
  float XPosition;
  
  Player(float BarSize, color BarColour, float YPosition, float XPosition)
  {
    this.BarSize = BarSize;
    this.BarColour = BarColour;
    this.YPosition = YPosition;
    this.XPosition = XPosition;
  }
  
  void update()
  {
    strokeWeight(5);
    stroke(BarColour);
    line(XPosition-BarSize, YPosition, XPosition+BarSize, YPosition);
  }
}