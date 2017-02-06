class Button
{
  //Fields
  String buttonText;
  float textX;
  float textY;
  float rectX;
  float rectY;
  float rectWidth;
  float rectHeight;
  color rectColour;
  boolean rectOver;
  int CurrentScreen;
  int NextScreen;
  
  //Constructor
  Button(String buttonText,float textX, float textY, float rectX, float rectY, float rectWidth, float rectHeight, color rectColour, boolean rectOver, int CurrentScreen ,int NextScreen)
  {
    this.buttonText = buttonText;
    this.textX = textX;
    this.textY = textY;
    this.rectX = rectX;
    this.rectY = rectY;
    this.rectWidth = rectWidth;
    this.rectHeight = rectHeight;
    this.rectColour = rectColour;
    this.rectOver = rectOver;
    this.CurrentScreen = CurrentScreen;
    this.NextScreen = NextScreen;
  }
  
  void fillRect()
  {
    //color rectHighlight  = color(#1B2EF0);
    color textColour = color(19, 161, 229, 50);
    color textHighlight = color(19, 161, 229);
    
    //Needed if wanting to change a buttons colour
    /*if (rectOver) 
    {
      fill(rectHighlight);
    } else 
    {
      fill(rectColour);
    }*/
    
    fill(rectColour);
    noStroke();
    rect(rectX, rectY, rectWidth, rectHeight);
    
    if (rectOver) 
    {
      fill(textHighlight);
    } else 
    {
      fill(textColour);
    }
    
    textFont(font);
    textSize(32);
    textAlign(CENTER);
    text(buttonText,textX,textY);
  }
  
 void update() 
  {
    if ( overRect(rectX, rectY, rectWidth, rectHeight) )
    {
      rectOver = true;
    }
    else
    {
      rectOver = false;
    }
  }
  
  boolean mouseclick()
  {
    if (mouseX >= rectX && mouseX <= rectX+rectWidth && 
        mouseY >= rectY && mouseY <= rectY+rectHeight
        && mousePressed) 
      {
        GameState = NextScreen;
        return true;
      } 
      else 
      {
        GameState = CurrentScreen;
        return false;
      }
  }
  
  boolean overRect(float x, float y, float rectWidth, float rectHeight) 
  {
    if (mouseX >= x && mouseX <= x+rectWidth && 
        mouseY >= y && mouseY <= y+rectHeight) 
      {
        return true;
      } 
      else 
      {
        return false;
      }
  }
}