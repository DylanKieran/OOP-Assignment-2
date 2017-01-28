class TileHard extends Tile
{
  TileHard(float Xpos, float Ypos)
  {
    this.TileValue = 3;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 12;
    this.TileHeight = 5;
    this.TileColour = color(0,0,255);
    this.Lives = 3;
  }
}