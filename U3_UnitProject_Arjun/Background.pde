class Background //showing how the main background and movements were drawn 
{
  int x; //variables
  int y;
  float lines[] = {width, width/0.5}; //array of lines

  public void Draw()
  {    
    background(0, 0, 51); //background of image

    fill(0, 255, 0); //drawing the ground
    rect(0, height*0.9, width, height*0.2);

    fill(255, 255, 102);//drawing the moon
    ellipse(width*0.9, height*0.15, width*0.15, height*0.25);

    strokeWeight(3); //drawing the array of lines
    fill(0,255,0);
    line(lines[0], height/5, lines[0], height);
    fill(0,255,0);
    line(lines[1], height, lines[1], height);

    lines[0] = lines[0] - 1; //showing the line movements
    lines[1] = lines[1] - 1;
  }
}