class TileHard extends Tile
{
  TileHard(float Xpos, float Ypos)
  {
    this.TileValue = 3;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 50;
    this.TileHeight = 25;
    this.Colour = color(#22FF0F);
    this.Lives = 3;
  }
  
 void Update()
  {
    if(Lives <= 0)
    {
      Tiles.remove(this);   
      Score = Score + 30;
    }
  }
}