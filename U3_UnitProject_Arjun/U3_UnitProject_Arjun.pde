import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

KinectTracker tracker;
Kinect kinect;
void setup() 
{
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() 
{
  background(255);


  tracker.track();
  tracker.display();

  //PVector v1 = new PVector(mouseX, mouseY);
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);
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
    else if (keyCode == DOWN) 
    {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}