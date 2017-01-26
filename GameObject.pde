abstract class GameObject
{
   //Variables
  float Xpos;
  float Ypos;
  float BlockWidth;
  float BlockHeight;
  int Lives;
  color BlockColour;
  boolean Hit;
  
  abstract void update();
  abstract void TileRemove();
  abstract boolean TileHit();
}