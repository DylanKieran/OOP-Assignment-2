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
    if(Lives > 0)
    {
      noStroke();
      fill(TileColour);
      rect(Xpos, Ypos, TileWidth, TileHeight);
    }
  }
  
  void Update(){}
  
  void CheckHit(int i)
  {
    //Check if the ball has hit the bottom of the tile
    //1. if the balls y position - the radius is less than or equal the tiles Y position + tiles height
    //2. if the balls y position - the radius is greater than or equal to the Y position of the tile
    //3. if the balls X position is greater than or equal to the Tiles X position
    //4. if the balls X position is less than or equal to the tiles X position plus its width
    if(BounceBall.Ypos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight 
        && BounceBall.Ypos - 5/2 >= Tiles.get(i).Ypos 
        && BounceBall.Xpos >= Tiles.get(i).Xpos 
        && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth  
        && Tiles.get(i).Hit == false )
    {
      BounceBall.YSpeed *= -1;
      //Tiles.get(i).Hit = true;
      Tiles.get(i).TileHit(i);
    }
    
    //Check if the ball has hit the top of the tile  
    //1. if the balls Y position plus its radius is greater than or equal to the tiles Y position
    //2. if the balls Y position is less than or equal to the tiles Y position plus the tiles height/2
    //3. if the balls X position is greater than or equal to the tiles X position
    //4. if the balls X position is less than or equal to the tiles X position plus the tiles width
    if(BounceBall.Ypos + 5/2 >= Tiles.get(i).Ypos 
        && BounceBall.Ypos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight/2 
        && BounceBall.Xpos >= Tiles.get(i).Xpos 
        && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth
        && Tiles.get(i).Hit == false)
    {
      BounceBall.YSpeed *= -1;
     //Tiles.get(i).Hit = true;
      Tiles.get(i).TileHit(i);
    }
    
   //Check if the ball has hit the right side of the tile  
   if(BounceBall.Xpos - 5/2 <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth
       && BounceBall.Xpos + 5/2 >= Tiles.get(i).Xpos + Tiles.get(i).TileWidth/ 2 
       && BounceBall.Ypos >= Tiles.get(i).Ypos
       && BounceBall.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight  
       && Tiles.get(i).Hit == false)
   {
      BounceBall.XSpeed *= 1;
      //Tiles.get(i).Hit = true;
      Tiles.get(i).TileHit(i);
   }
   
    //Check if the ball has hit the left side of the tile      
    if(BounceBall.Xpos + 5/2 >= Tiles.get(i).Xpos 
        && BounceBall.Xpos + 5/2 <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth / 2 
        && BounceBall.Ypos >= Tiles.get(i).Ypos 
        && BounceBall.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight 
        && Tiles.get(i).Hit == false)
    {
      BounceBall.XSpeed *= -1;
      //Tiles.get(i).Hit = true;
      Tiles.get(i).TileHit(i);
    }
   
  }
  
  void TileHit(int i)
  {
    Tiles.get(i).Lives = Tiles.get(i).Lives - 1;
  }
  
}