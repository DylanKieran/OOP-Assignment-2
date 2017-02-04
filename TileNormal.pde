class TileNormal extends Tile
{
  TileNormal(float Xpos, float Ypos)
  {
    this.TileValue = 2;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 50;
    this.TileHeight = 25;
    this.Colour = color(#03FFEC);
    this.Lives = 2;
  }
  
  void Update()
  {
    if(Lives <= 0)
    {
      Tiles.remove(this); 
      Score = Score + 20;
    }
  }
}