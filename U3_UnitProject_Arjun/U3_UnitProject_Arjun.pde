import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
PImage ch;
KinectTracker tracker;
Kinect kinect;
Picture p;
float lines[] = {width, width/0.5};
float y;

void setup() 
{
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  p = new Picture();
  kinect.getDepthImage();
  kinect.getRawDepth();
  kinect.getVideoImage();
  ch = loadImage("Ch.png");
}

void draw() 
{
  background(255);
  tracker.track();
  p.draw();

  //PVector v1 = new PVector(mouseX, mouseY);
  PVector v1 = tracker.getPos();
  fill(0, 255, 0);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);


  PVector v2 = tracker.getLerpedPos();
  fill(255, 0, 0);
  noStroke();
  image(ch, v2.x, v2.y + height/2.5);

  int t = tracker.getThreshold();
  fill(255);
  textSize(12);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", width*0.01, height*0.95);
    
  if(t < 900)
  {
    y = v2.y;
    image(ch, v2.x, y + height/2.5);
    y = height/2.5 - 0.25;
  }
  
  if (y < height/2.45)
  {
    y = height/2.45 - 0.25;
  }    
}

void keyPressed() 
{
  int t = tracker.getThreshold();
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      t+=5;
      tracker.setThreshold(t);
    } 
    else  if (keyCode == DOWN) 
    {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}