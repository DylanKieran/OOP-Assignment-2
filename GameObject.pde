abstract class GameObject
{
   //Variables
  float Xpos;
  float Ypos;
  float BlockWidth;
  float BlockHeight;
  int Lives;
  color BlockColour;
  boolean Hit; //If the Block has been hit or not
  
  abstract void update();
  abstract void TileHit();
}