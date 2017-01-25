abstract class GameObject
{
   //Variables
  float Xpos;
  float Ypos;
  float BlockWidth;
  float BlockHeight;
  int Lives;
  color BlockColour;
  
  abstract void update();
}