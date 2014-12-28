/*
PhantSaver Screensaver
Author: Hamilton Greene for HAMY Codes
Copyright 2014
*/

//*****Global Variables*****
public int myFrameRate = 30; //The desired frameRate for the screen saver to run at
public PImage elephantHead;

//*****Initialization*****

//Sets up the environment
void setup()
{
  size(displayWidth, displayHeight);  //Set sketch to size of screen
  noCursor(); //Get rid of cursor
  frameRate(myFrameRate);
  elephantHead = loadImage("Resources/ElephantHead.png");
}

//Ensures the sketch is always run in fullscreen
boolean sketchFullScreen() 
{
  return true;
}

//*****Body*****

//Code executed at every frame
void draw()
{
  //Provide exit conditions
  if(mousePressed==true || keyPressed == true) exit();
  
  background(black);
  image(elephantHead, displayWidth/2-(elephantHead.width/2), displayHeight/2-(elephantHead.height/2));  //Place elephantHead in center of screen
}

void swing(int travelTime)
{
}

//More exit conditions
void mouseMoved()
{
  if(abs(mouseX-pmouseX) > displayWidth/12 || abs(mouseY-pmouseY) > displayHeight/12) exit();
}
