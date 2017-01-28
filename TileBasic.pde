class TileBasic extends GameObject
{
   //Variables
  float Xpos;
  float Ypos;
  float BlockWidth;
  float BlockHeight;
  int Lives;
  color BlockColour;
  boolean Hit; //If the Block has been hit or not
  
  TileBasic(float Xpos, float Ypos, color BlockColour, int Lives)
  {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.BlockColour = BlockColour;
    this.Lives = Lives;
    
    this.BlockWidth = 50;
    this.BlockHeight = 10;
    
    this.Hit = false;
  }
  
  void update()
  {
    noStroke();
    fill(BlockColour);
    rect(Xpos, Ypos, BlockWidth, BlockHeight);
  }

  void TileHit()
  {
    Hit = true;
    
    Lives--;
  }
  
}