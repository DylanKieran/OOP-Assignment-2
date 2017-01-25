class TileBasic extends GameObject
{
  //Variables
  float Xpos;
  float Ypos;
  float BlockWidth;
  float BlockHeight;
  
  TileBasic(float Xpos, float Ypos, float BlockWidth, float BlockHeight)
  {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.BlockWidth = BlockWidth;
    this.BlockHeight = BlockHeight;
  }
  
  //Functions
  void update()
  {
    fill(255);
    rect(Xpos, Ypos, BlockWidth, BlockHeight);
    
  }
  
}