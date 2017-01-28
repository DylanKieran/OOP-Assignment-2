class Tile
{
  //Variables
  float Xpos;
  float Ypos;
  float TileWidth;
  float TileHeight;
  color TileColour;
  int Lives;
  int TileValue;
  boolean Hit;
  
  void create()
  {
    noStroke();
    fill(TileColour);
    rect(Xpos, Ypos, TileWidth, TileHeight);
  }
  
  void CheckHit(int i,float BallXpos, float BallYpos, float BallXSpeed, float BallYSpeed)
  {
    //Check if the ball has hit the bottom of the tile
    //Tiles.get(i).Xpos
    //Tiles.get(i).Ypos
    //BallYpos
    //BallXpos
    //Tiles.get(i).TileWidth
    
    if(BallYpos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight &&  BallYpos - 5/2 >= Tiles.get(i).Ypos 
        && BallXpos >= Tiles.get(i).Xpos && BallXpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth  
        && Tiles.get(i).Hit == false )
    {
      BallYSpeed = -BallYSpeed;
      Tiles.get(i).Hit = true;
    }
  }
  
    void TileHit(int i)
  {
    if(Tiles.get(i).Hit == true)
    {
      Lives --;
    }
    
    if(Tiles.get(i).Lives == 0)
    {
      Tiles.remove(i);
    }
  }
  
}