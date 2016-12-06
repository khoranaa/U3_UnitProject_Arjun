class Picture
{
  int x; 
  int y;
  float lines[] = {width, width/0.5};
  int score = 0;
  
  public void draw()
  {    
    background(0,0,51);
    
    fill(0,255,0);
    rect(0, height*0.9, width, height*0.2);
    
    fill(255,255,102);
    ellipse(width*0.9, height*0.15, width*0.15, height*0.25);
    
    strokeWeight(3);
    line(lines[0], height/5, lines[0], height);
    line(lines[1], height, lines[1], height);
    
    lines[0] = lines[0] - 1;
    lines[1] = lines[1] - 1;
    
    if(collision())
    {
      score = 0;
      delay(3000);
      
      lines[0] = width;
      lines[1] = width/0.5;
    }
    
    if(noCollision())
    {
      score = score + 1;
    }
    
    if(lineMovement())
    {
      lines[0] = width - 1;
    }
    
    if(lineMovement2())
    {
      lines[1] = width - 1;
    }
  }
    
    boolean collision()
    {
      boolean returnValue = false;
      { 
        if(x == lines[0] - 25 && y < height/4.1) 
        if(x == lines[1] - 25 && y < height/4.1)
        {
          returnValue = true;
        }
        return returnValue;
      }
    }    
    
    boolean noCollision()
    {
      boolean returnValue = false;
      {
        if(x == lines[0] && y > height/4.1) 
        if(x == lines[1] && y > height/4.1)
        {
          returnValue = true;
        }
        return returnValue;
      }
    }
    
    boolean lineMovement()
    {
      boolean returnValue = false;
      {
        if(lines[0] < 0)
        {
          returnValue = true;
        }
        return returnValue;
      }
    }
    
    boolean lineMovement2()
    {
      boolean returnValue = false;
      {
        if(lines[1] < 0)
        {
          returnValue = true;
        }
        return returnValue;
      }
    }
}