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
  
  void Update()
  {
    //Draw Enemy
    stroke(#FF8D00);
    strokeWeight(0.8);
    fill(#FF8D00, 60);
    
    beginShape();
    vertex(Xpos, Ypos + 2);
    vertex(Xpos - 8, Ypos - 10);
    vertex(Xpos - 5, Ypos - 10);
    vertex(Xpos - 5, Ypos - 50);
    vertex(Xpos, Ypos - 60);
    vertex(Xpos + 5, Ypos - 50);
    vertex(Xpos + 5, Ypos - 10);
    vertex(Xpos + 8, Ypos - 10);
    endShape(CLOSE);

    Ypos += YSpeed; //Change Y position to go down
    YSpeed += Gravity; //Increase Speed Over time
  }
  
  void Respawn()
  {
    Xpos = random(10, width-10); 
    Ypos = 0;
    YSpeed = 2;

    //Draw Enemy
    stroke(#FF8D00);
    strokeWeight(0.8);
    fill(#FF8D00, 60);
    
    beginShape();
    vertex(Xpos, Ypos + 2);
    vertex(Xpos - 8, Ypos - 10);
    vertex(Xpos - 5, Ypos - 10);
    vertex(Xpos - 5, Ypos - 50);
    vertex(Xpos, Ypos - 60);
    vertex(Xpos + 5, Ypos - 50);
    vertex(Xpos + 5, Ypos - 10);
    vertex(Xpos + 8, Ypos - 10);
    endShape(CLOSE);
  }
  
}