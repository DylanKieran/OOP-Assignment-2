abstract class BlockObject
{
  
  //Create the BlockObject(Maybe circle objects)
  void create(float OffsetX, float OffsetY, float CircleWidth, float CircleHeight)
  {
    fill(255);
    ellipse(OffsetX, OffsetY, CircleWidth, CircleHeight);
  }
  
  boolean Destroyed()
  {
    //return True if ball touches BlockObject
    if()
    {
      return true;
    }
  }
  
  //if Destroyed returns True then call Lives function to change lives
  void Lives(int Life)
  {
    Life = Life - 1;
  }
  
}