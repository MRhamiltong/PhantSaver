/*
PhantSaver Screensaver v.0.0.1
Author: Hamilton Greene for HAMY Codes
Copyright 2014
*/

//*****Global Variables*****
public int myFrameRate = 30; //The desired frameRate for the screen saver to run at
public int counter, startTime, textOpacity; //Keeps track of trunk position
public float startingAngle = 7;
public boolean goRight = true;  //True if trunk moving right, false if left
public boolean startUp, textFinish;
public PImage elephantHead;
public PImage elephantTrunk;
public PImage HucciSymbol;
public PFont myFont;
public String myText;

public HamText aText;
public HamText bText;

//*****Initialization*****

//Sets up the environment
void setup()
{
  size(displayWidth, displayHeight);  //Set sketch to size of screen
  noCursor(); //Get rid of cursor
  frameRate(myFrameRate);
  elephantHead = loadImage("Resources/ElephantHead.png");
  elephantTrunk = loadImage("Resources/TrunkPart.png");
  HucciSymbol = loadImage("Resources/HucciRoseGold.png");
  counter = 0;
  startUp = true;
  textFinish = false;
  startTime = millis();
  
  //Set up text classes
  aText = new HamText("PHANTSAVER");
  aText.setFont("SegoeUIBlack-48.vlw");
  aText.setX(-11*(displayWidth/24));
  aText.setY(-3*(displayHeight/8));
  aText.setOpacity(0);
  
  bText = new HamText("BY:");
  bText.setFont("SegoeUIBlack-48.vlw");
  bText.setX(-11*(displayWidth/24));
  bText.setY(-3*(displayHeight/8) - 48);
  bText.setOpacity(0);
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
  
  //Text changes, fade-ins, timing
  if(!textFinish)
  {
    if(millis() <= startTime + 5000) aText.incOpacity(8);
    else if(millis() <= startTime +7500) aText.decOpacity(8);
    else if(millis()<= startTime+12000)
    {
      aText.setText("HAMY CODES");
      aText.incOpacity(8);
      bText.incOpacity(8);
    }
    else if(millis() <= startTime+14000) 
    {
      aText.decOpacity(8);
      bText.decOpacity(8);
    }
    else if(millis() <= startTime+18500) 
    {
      aText.setText("MINDZAI.NET");
      bText.setText("ART:");
      aText.incOpacity(8);
      bText.incOpacity(8);
    }
    else if(millis() <= startTime +22000) 
    {
      aText.decOpacity(8);
      bText.decOpacity(8);
    }
    else if(millis() >= startTime + 24000) 
    {
      textFinish = true;
      
      //Setup time and date text
      aText.setText(getAbbrevMonth().toUpperCase() + ". " + day());
      aText.setY(2*(displayHeight/8));
      bText.setY(2*(displayHeight/8) + 48); //Move bText to next line
    }
    
    aText.displayText();
    bText.displayText();
  }
  //Leave all the checking behind
  else
  {
    bText.setText(hour() + ":" + minute());
    aText.incOpacity(8);
    bText.incOpacity(8);
    aText.displayText();
    bText.displayText();
  }
    
  
  swing(10);
}

/**
* swing controls the trunk swing
* int travelTime is the amount of time it will take the trunk to get from one side to the other
**/
void swing(int travelTime)
{
  int xVal =  - (elephantTrunk.width/2) + elephantTrunk.width/8;
  int yVal =  (int) (elephantHead.height/20);
  
  if(counter==0 && startUp==true)
  {
    rotate(radians(startingAngle));
    startUp = false;
  }
  
  //Place trunk on screen and determine rotation degree
  for(float i = 0; i< 11; i++)
  {
    if(goRight) rotate(radians(startingAngle- 2*startingAngle*((float) counter/(travelTime*myFrameRate))));
    else rotate(radians(-startingAngle+2*startingAngle*((float) counter/(travelTime*myFrameRate))));
    
    if(i<10) image(elephantTrunk, xVal, yVal + elephantTrunk.height*i * 1.2);
    else image(HucciSymbol, xVal - 10, yVal + elephantTrunk.height*i * 1.3);  
  }
  
  counter++;
  
  //End condition for trunk travel
  if(counter== (travelTime*myFrameRate))
  {
    counter = 0;
    goRight = !goRight;
  }
}


//More exit conditions for mouse movement
void mouseMoved()
{
  //if(abs(mouseX-pmouseX) > displayWidth/12 || abs(mouseY-pmouseY) > displayHeight/12) exit();
}
