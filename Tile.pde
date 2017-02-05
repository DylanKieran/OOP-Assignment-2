class Tile
{
  //Variables
  float Xpos;
  float Ypos;
  float TileWidth;
  float TileHeight;
  color Colour;
  int Lives;
  int TileValue;
  
  void create()
  {
    stroke(Colour);
    strokeWeight(0.8);
    if(Lives == 1)
    {
      fill(Colour, 20);
    }
    else if(Lives == 2)
    {
      fill(Colour, 60);
    }
    else if(Lives == 3)
    {
      fill(Colour, 120);
    }
    rect(Xpos, Ypos, TileWidth, TileHeight);
  }
  
  void Update(){}
  
  void CheckHit(int i)
  {
    //Check if the ball has hit the bottom of the tile
    //1. if the balls y position - the radius is less than or equal the tiles Y position + tiles height
    //2. if the balls y position - the radius is greater than or equal to the Y position of the tile
    //3. if the balls X position is greater than or equal to the Tiles X position
    //4. if the balls X position is less than or equal to the tiles X position plus its width
    if(BounceBall.Ypos - 10/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight 
        && BounceBall.Ypos - 5/2 >= Tiles.get(i).Ypos 
        && BounceBall.Xpos >= Tiles.get(i).Xpos 
        && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth)
    {
      BounceBall.YSpeed *= -1;
      Tiles.get(i).TileHit(i);
    }
    
    //Check if the ball has hit the top of the tile  
    //1. if the balls Y position plus its radius is greater than or equal to the tiles Y position
    //2. if the balls Y position is less than or equal to the tiles Y position plus the tiles height/2
    //3. if the balls X position is greater than or equal to the tiles X position
    //4. if the balls X position is less than or equal to the tiles X position plus the tiles width
    if(BounceBall.Ypos + 10/2 >= Tiles.get(i).Ypos 
        && BounceBall.Ypos - 5/2 <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight/2 
        && BounceBall.Xpos >= Tiles.get(i).Xpos 
        && BounceBall.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth)
    {
      BounceBall.YSpeed *= -1;
      Tiles.get(i).TileHit(i);
    }
    
   //Check if the ball has hit the right side of the tile  
   if(BounceBall.Xpos - 10/2 <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth
       && BounceBall.Xpos + 5/2 >= Tiles.get(i).Xpos + Tiles.get(i).TileWidth/ 2 - 10
       && BounceBall.Ypos >= Tiles.get(i).Ypos
       && BounceBall.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight)
   {
      BounceBall.XSpeed *= -1;
      Tiles.get(i).TileHit(i);
   }
   
    //Check if the ball has hit the left side of the tile      
    if(BounceBall.Xpos + 10/2 >= Tiles.get(i).Xpos 
        && BounceBall.Xpos + 5/2 <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth / 2 - 10
        && BounceBall.Ypos >= Tiles.get(i).Ypos 
        && BounceBall.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight)
    {
      BounceBall.XSpeed *= -1;
      Tiles.get(i).TileHit(i);
    }
    
    //Check if the enemy hits the top of the tile
    if(Bomber.Ypos >= Tiles.get(i).Ypos 
        && Bomber.Ypos <= Tiles.get(i).Ypos + Tiles.get(i).TileHeight/2 
        && Bomber.Xpos >= Tiles.get(i).Xpos  
        && Bomber.Xpos <= Tiles.get(i).Xpos + Tiles.get(i).TileWidth)
    {
      Tiles.get(i).TileHit(i);
      Bomber.Ypos = 7000;
      
      if (Bomber.Ypos > Bomber.maxDist)
      {
        Bomber.Respawn();
      }//end if 
    }//end if
    
  }//End CheckHit()
  
  void TileHit(int i)
  {
    Tiles.get(i).Lives = Tiles.get(i).Lives - 1; 
  }
  
}