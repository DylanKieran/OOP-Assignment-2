class Enemy
{
  float Xpos; 
  float Ypos; 
  float YSpeed;
  float Gravity;
  float maxDist;

  Enemy()
  {
    Xpos = random(10, width-10);
    Ypos = 100;
    YSpeed = 2;
    Gravity = 0.4;

    maxDist = 9000; //Spawn Rate When Ypos Reaches max dist the enemy respawns
  }
  
}