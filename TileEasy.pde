class TileEasy extends Tile
{
  TileEasy(float Xpos, float Ypos)
  {
    this.TileValue = 1;
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.TileWidth = 50;
    this.TileHeight = 25;
    this.Colour = color(#FF03AB);
    this.Lives = 1;
  }
  
  void Update()
  {
    if(Lives <= 0)
    {
      Tiles.remove(this);   
    }
  }
 
}