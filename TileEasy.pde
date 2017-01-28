class TileEasy extends Tile
{
  TileEasy(float Xpos, float Ypos)
  {
    this.TileValue = 1;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 40;
    this.TileHeight = 8;
    this.TileColour = color(255,0,0);
    this.Lives = 1;
  }
}