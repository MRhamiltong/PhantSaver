/*
PhantSaver Screensaver
Author: Hamilton Greene for HAMY Codes
Copyright 2014
*/

//*****Global Variables*****
public int myFrameRate = 30; //The desired frameRate for the screen saver to run at
public int counter; //Keeps track of trunk position
public float startingAngle = 7;
public boolean goRight = true;  //True if trunk moving right, false if left
public boolean startUp;
public PImage elephantHead;
public PImage elephantTrunk;

//*****Initialization*****

//Sets up the environment
void setup()
{
  size(displayWidth, displayHeight);  //Set sketch to size of screen
  noCursor(); //Get rid of cursor
  frameRate(myFrameRate);
  elephantHead = loadImage("Resources/ElephantHead.png");
  elephantTrunk = loadImage("Resources/TrunkPart.png");
  counter = 0;
  startUp = true;
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
  translate(displayWidth/2,displayHeight/2);  //Set origin to bottom of elephant head
  image(elephantHead, -elephantHead.width/2, -elephantHead.height/2);  //Place elephantHead in center of screen
  
  swing(10);
}

void swing(int travelTime)
{
  int xVal =  - (elephantTrunk.width/2) + elephantTrunk.width/8;
  int yVal =  (int) (elephantHead.height/20);
  
  if(counter==0 && startUp==true)
  {
    rotate(radians(startingAngle));
    //if(goRight) rotate(radians(startingAngle - 2*startingAngle*(counter/myFrameRate)));
    //else rotate(radians(-startingAngle + 2*startingAngle*(counter/myFrameRate)));
    startUp = false;
  }
  //image(elephantTrunk, xVal, yVal + elephantTrunk.height);
  
  
  for(float i = 0; i< 10; i++)
  {
    if(goRight) rotate(radians(startingAngle- 2*startingAngle*((float) counter/(travelTime*myFrameRate))));
    else rotate(radians(-startingAngle+2*startingAngle*((float) counter/(travelTime*myFrameRate))));
    image(elephantTrunk, xVal, yVal + elephantTrunk.height*i * 1.2);
  
    //rotate(radians(-5));
    //image(elephantTrunk, xVal, yVal + elephantTrunk.height);
  }
  
  
  counter++;
  
  //End condition for trunk travel
  if(counter== (travelTime*myFrameRate))
  {
    counter = 0;
    goRight = !goRight;
  }
}

//More exit conditions
void mouseMoved()
{
  if(abs(mouseX-pmouseX) > displayWidth/12 || abs(mouseY-pmouseY) > displayHeight/12) exit();
}
