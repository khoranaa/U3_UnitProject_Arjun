class Picture
{
  int x; 
  int y;
  public void draw()
  {    
    background(0,0,51);
    
    fill(0,255,0);
    rect(0, height*0.9, width, height*0.2);
    
    fill(255,255,102);
    ellipse(width*0.9, height*0.15, width*0.15, height*0.25);
  }
}