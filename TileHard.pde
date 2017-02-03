class TileHard extends Tile
{
  TileHard(float Xpos, float Ypos)
  {
    this.TileValue = 3;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 50;
    this.TileHeight = 25;
    this.TileColour = color(0,0,255);
    this.Lives = 3;
    this.Hit = false;
  }
  
 void Update()
  {
    if(Lives <= 0)
    {
      Tiles.remove(this);   
    }
  }
}