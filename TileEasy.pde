class TileEasy extends Tile
{
  TileEasy(float Xpos, float Ypos)
  {
    this.TileValue = 1;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 12;
    this.TileHeight = 5;
    this.TileColour = color(255,0,0);
    this.Lives = 1;
  }
}