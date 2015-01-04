//Text Class
//By Hamilton Greene

public class Text
{
  private String myString;
  private int opacity; //0 = transparent
  private float myX;
  private float myY;
  private int rVal;
  private int gVal;
  private int bVal;
  private int textSize;
  private PFont myFont;
  
  public Text(String myString)
  {
    this.myString = myString;
    opacity = 255;
    myX = 0;
    myY = 0;
    rVal = 255;
    gVal = 255;
    bVal = 255;
  }
  
  public void displayText()
  {
    fill(rVal,gVal,bVal,opacity);
    textFont(myFont, textSize);
    text(myString, myX, myY);
  }
  
//*****Getters and Setters*****  
  
  public void setText(String newString)
  {
    myString = newString;
  }
  
  public void setOpacity(int newVal)
  {
    opacity = newVal;
  }
  
  public void setX(float newX)
  {
    myX = newX;
  }
  
  public void setY(float newY)
  {
    myY = newY;
  }
  
  public void setRVal(int newR)
  {
    rVal = newR;
  }
  
  public void setGVal(int newG)
  {
    gVal = newG;
  }
  
  public void setBVal(int newB)
  {
    bVal = newB;
  }
  
  public void setTextSize(int newSize)
  {
    textSize = newSize;
  }
  
  public void setFont(String newFont)
  {
    myFont = loadFont(newFont);
  }
  
  public String getText()
  {
    return myString;
  }
  
  public int getOpacity()
  {
    return opacity;
  }
  
  public float getX()
  {
    return myX;
  }
  
  public float getY()
  {
    return myY;
  }
  
  public int getRVal()
  {
    return rVal;
  }
  
  public int getGVal()
  {
    return gVal;
  }
  
  public int getBVal()
  {
    return bVal;
  }
  
}
