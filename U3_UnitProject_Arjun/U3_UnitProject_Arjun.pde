//U3 Unit Project: Personal Workout (Hurdle Game) by Arjun Khorana
//This is a game that works with the Kinect v1. The objective of the game is to get the
//highest score possible by jumping over green hurdles with you represented in a 
//character of a smiley face emoji. This will all be done in the middle of the night! 
//So, go out, have fun, keep running and jumping, and get more healthy!

import org.openkinect.freenect2.*; //Kinect Library Functions
import org.openkinect.processing.*;
import org.openkinect.tests.*;
PImage ch; //Image of character 
KinectTracker tracker; //Classes (next 3 lines)
Kinect kinect;
Picture p;
float lines[] = {width, width/0.5}; //array of hurdles 
float y; //variables
float x;
int score; //variable for scores

void setup() 
{
  size(640, 520);
  kinect = new Kinect(this); //assigning classes
  tracker = new KinectTracker();
  p = new Picture();
  kinect.getDepthImage(); //getting the Kinect to get the proper image
  kinect.getRawDepth(); //getting the Kinect to get a depth image
  kinect.getVideoImage(); //getting the Kinect to get a main RGB real time image
  ch = loadImage("Ch.png"); //loading the image of the character
}

void draw() 
{
  background(255); //drawing background
  tracker.track();
  p.draw();

  PVector v1 = tracker.getPos(); //drawing main and original position of Average Point
  fill(0, 255, 0);               //tracker
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);


  PVector v2 = tracker.getLerpedPos(); //drawing average changed positions over time 
  fill(255, 0, 0);                     //in moving images, such as people moving, or
  noStroke();                          //anything causing movmement
  image(ch, v2.x, v2.y + height/2.5);
 
  int t = tracker.getThreshold(); //drawing the threshold (the thing that decides how 
  fill(255);                      //much of the video image will be tracked with the 
  textSize(12);                   //Average point tracking)
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", width*0.01, height*0.95);
    
  if(t < 900) //running upwards function if threshold is 900
  {
    y = v2.y;
    image(ch, v2.x, y + height/2.5);
    y = height/2.5 - 0.25;
  }
  
  y = v2.y;
  image(ch, v2.x, y + height/2.5); //assigning the image
  
  if(y < height/2.45) //running downwards function if height is less than a certain 
  {                   //amount
    y = height/2.45 - 0.25;
  }    
  
  if((y < height/2) || (y > height/2.5)) //jumping function if character reaches a 
  {                                      //certain point
    y = height/2 - 3;
  }
  
  if(collision()) //showing the game over and restart if character touches the hurdle
    {
      score = 0;
      delay(3000);
      
      lines[0] = width - 1;
      lines[1] = width/0.5 - 1;
    }
    
    if(noCollision()) //showing what happens if character successfully jumps over the
    {                 //hurdle
      score = score + 1; 
    }
    
    if(lineMovement()) //movement of one of the hurdles if it goes off the screen
    {
      lines[0] = width - 1;
    }
    
    if(lineMovement2()) //movement of the other hurdle if it goes off the screen 
    {
      lines[1] = width - 1;
    }
  }
    
    boolean collision() //showing how the result of the collision can be brought upon
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
    
    boolean noCollision() //showing how the result of the noCollision can be brought upon
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
    
    boolean lineMovement() //showing how the result of both the hurdles happens
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


void keyPressed() 
{
  int t = tracker.getThreshold(); //settings the change the threshold of the Average 
  if (key == CODED)               //Point Tracker
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