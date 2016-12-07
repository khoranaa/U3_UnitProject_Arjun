class KinectTracker  //all data in the Kinect Tracker class
{ 

  int threshold = 900; //Starting original threshold

  PVector loc; //original location of Average point tracker

  PVector lerpedLoc; //changing location of the Average point tracker through movment 
                     //over time
  int[] depth; //array of depth
  
  PImage display; //assigning the display of the image
   
  KinectTracker() //assigning all the functions of how the image and the Average Point
  {               //Tracking
    kinect.initDepth();
    kinect.enableMirror(true);
    display = createImage(kinect.width, kinect.height, RGB);
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() //function of how the Average Point Tracker works
  {
    depth = kinect.getRawDepth(); //telling the tracker to get the depth imaage

    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) 
    {
      for (int y = 0; y < kinect.height; y++) 
      {
        
        int offset =  x + y*kinect.width;
        int rawDepth = depth[offset];

        if (rawDepth < threshold) 
        {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    if (count != 0) 
    {
      loc = new PVector(sumX/count, sumY/count);
    }

    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() 
  {
    return lerpedLoc;
  }

  PVector getPos() 
  {
    return loc;
  }

  void display() //showing the functions in how the display would work
  {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height/2; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < threshold) {
          // A red color instead
          display.pixels[pix] = color(0,255,0);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels(); //telling the pixels to be where they need to be in order to
                            //get the depth image
    // Draw the image
    image(display, 0, 0);
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}