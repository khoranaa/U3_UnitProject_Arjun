import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
Kinect kinect;

void setup()
{
  fullScreen();
  kinect = new Kinect (this);
  kinect.initDepth();
  kinect.initVideo();
}

void draw()
{
  background(0);
  PImage img = kinect.getDepthImage();
  image(img, 0, 0); 
}