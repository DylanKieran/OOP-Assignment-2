class Tile
{
  //Variables
  float Xpos;
  float Ypos;
  float TileWidth;
  float TileHeight;
  color TileColour;
  int Lives;
  int TileValue;
  
  void create()
  {
    noStroke();
    fill(TileColour);
    rect(Xpos, Ypos, TileWidth, TileHeight);
  }
  
}