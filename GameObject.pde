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
  abstract int TileRemove();
  abstract boolean TileHit();
}