class TileNormal extends Tile
{
  TileNormal(float Xpos, float Ypos)
  {
    this.TileValue = 2;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 50;
    this.TileHeight = 25;
    this.TileColour = color(0,255,0);
    this.Lives = 2;
    this.Hit = false;
  }
}