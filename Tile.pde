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
  
  void CheckHit(int i)
  {
    //Check if the ball has hit the bottom of the tile
    if(BounceBall.Ypos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight 
        &&  BounceBall.Ypos - 5/2 >= Tiles.get(i).Ypos 
        && BounceBall.Xpos >= Tiles.get(i).Xpos && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth  
        && Tiles.get(i).Hit == false )
    {
      BounceBall.YSpeed *= -1;
      Tiles.get(i).Hit = true;
    }
    
    //Check if the ball has hit the top of the tile  
    if(BounceBall.Ypos + 5 / 2 >= Tiles.get(i).Ypos 
        && BounceBall.Ypos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight/2 
        && BounceBall.Xpos >= Tiles.get(i).Xpos && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth
        && Tiles.get(i).Hit == false)
    {
      BounceBall.YSpeed *= -1;
      Tiles.get(i).Hit = true;
    }
    
   //Check if the ball has hit the right side of the tile  
   if(BounceBall.Xpos - 5/2 <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth
       && BounceBall.Xpos + 5/2 >= Tiles.get(i).Xpos + Tiles.get(i).TileWidth/ 2 && BounceBall.Ypos >= Tiles.get(i).Ypos
       && BounceBall.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight  
       && Tiles.get(i).Hit == false)
   {
      BounceBall.XSpeed = 3;
      Tiles.get(i).Hit = true;
   }
   
    //Check if the ball has hit the left side of the tile  
    //Tiles.get(i).Xpos
    //Tiles.get(i).Ypos
    //BounceBall.Ypos
    //BounceBall.Xpos
    //Tiles.get(i).TileWidth
   
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