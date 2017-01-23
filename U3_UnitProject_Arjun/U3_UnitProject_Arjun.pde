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
Background b;
float lines[] = {width, width/0.5}; //array of hurdles 
float y; //variables
float x;
int score; //variable for scores
int gravity = 10;
Player p;
PVector trackerPos = new PVector(0,0);

void setup() 
{
  size(640, 520);
  kinect = new Kinect(this); //assigning classes
  tracker = new KinectTracker();
  b = new Background();
  ch = loadImage("Ch.png");
  p = new Player(ch);
  kinect.getDepthImage(); //getting the Kinect to get the proper image
  kinect.getRawDepth(); //getting the Kinect to get a depth image
  kinect.getVideoImage(); //getting the Kinect to get a main RGB real time image //loading the image of the character
  
  imageMode(CENTER);
}

void draw() 
{
  background(255); //drawing background
  tracker.track();
  b.Draw();
  p.Update();
  p.Draw();
  //p.Jump();


  PVector trackerPos = tracker.getLerpedPos(); //drawing average changed positions over time 
  fill(255, 0, 0);                     //in moving images, such as people moving, or
  noStroke(); //anything causing movmement
  
  if(millis() < 4000)
  {
    p.SetStartY(trackerPos.y);
  }
  
  if(collision()) //showing the game over and restart if character touches the hurdle
    {
      score = 0;
      
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