//Pizza Creator
private Squ joe[] = new Squ[11];
private Cir steve;
private boolean endR = false;
private boolean endL = false;
public void setup()
{
  size(600, 400);
  background(32);
  for (int i = 0; i <joe.length; i++)
  {
    joe[i] = new Squ(-25+(i*100), 300, 50, 50, "test");
    steve = new Cir(300, 150, 250, 250, 0);
  }
}
public void draw()
{
  background(32);
  steve.show();
  for (int i = 0; i <joe.length; i++)
  {
    joe[i].show();
    if (joe[i].getX() == 275)
    {
      steve.changeColor(joe[i].getColor());
    }
  }
}
public void mouseClicked()
{
  for (int i = 0; i <joe.length; i++) {
    joe[i].move();
  }
}

public class Squ
{
  float h, w, x, y, c;
  private String ingredient;
  public Squ(float xx, float yy, float ww, float hh, String ing)
  {
    h = hh; 
    w = ww; 
    x = xx; 
    y = yy; 
    c = (int)(Math.random()*255);
    ingredient = ing;
  }
  public void show()
  {
    stroke(155);
    fill(c);
    rect(x, y, w, h);
    fill(255);
    text(ingredient, x+25, y+25);
  }
  public void move()
  {
    if (mouseX >= 301 && mouseY >=250 && mouseY <= 350)
    {
      x += 100;
    } else if (mouseX <= 299 && mouseY >=250 && mouseY <= 350) {
      x -= 100;
    }
  }
  public float getColor()
  {
    return c;
  }
  public float getX()
  {
    return x;
  }
  public void toLeft()
  {
    if (mouseX <= 299 && mouseY >=250 && mouseY <= 350) {
      x -= 100;
    }
  }
  public void toRight()
  {
    if (mouseX >= 301 && mouseY >=250 && mouseY <= 350)
    {
      x += 100;
    }
  }
}
public class Cir
{
  private float x, y, h, w, c;
  public Cir(float xx, float yy, float ww, float hh, float cc)
  {
    h = hh; 
    w = ww; 
    x = xx; 
    y = yy; 
    c = cc;
  }
  public void show()
  {
    fill(c);
    ellipse(x, y, w, h);
  }
  public void changeColor(float col)
  {
    c = col;
  }
}
public class Button
{
  private float x, y, w, h;
  public Button(float xx, float yy, float ww, float hh)
  {
    h = hh; 
    w = ww; 
    x = xx; 
    y = yy; 
  }
  public void show()
  {
  }
  public void clicked()
  {
  }
}

