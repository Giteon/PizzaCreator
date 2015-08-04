//Pizza Creator
private ArrayList<Squ> joe; 
private Cir steve;
private ArrayList<Rec> larry;
private int numTopping = 11;
private int num = 0;
private float price = 10.00;
private float toppingPrice = .75;
public void setup()
{
  textAlign(CENTER);
  size(600, 400);
  background(32);
  steve = new Cir(300, 150, 250, 250, 0);
  larry = new ArrayList<Rec>();
  joe = new ArrayList<Squ>();
  for (int i = 0; i < numTopping; i++)
  {
    joe.add(i, new Squ(-25+(i*100), 300, 50, 50, "test"));
  }
  for (int n = 0; n < 2; n++)
  {
    larry.add(n, new Rec(20+(n*420), 40, 140, 100, 255));
  }
}
public void draw() {
  stroke(0);
  background(32);
  steve.show();
  fill(255, 0, 0);
  textSize(15);
  text("Number of Toppings:", 90, 175);
  text("Price of Your Pizza:", 510, 175);
  textSize(50);
  text(num, 90, 230 );
  text("$"+price, 510, 230);
  textSize(10);
  text("Topping price varies on size.\nFirst 2 toppings free", 90, 250);
  text("Topping Price For \n(Insert Size) Pizza: " + toppingPrice, 510, 250); 
  for (int n = 0; n < larry.size (); n++)
  {
    larry.get(n).show();
    larry.get(n).selection();
    larry.get(n).words();
  }
  for (int i = 0; i <joe.size (); i++)
  {
    textSize(15);
    joe.get(i).show();
    joe.get(i).selection(); //highlights the square
    if (joe.get(i).getX() == 275)
    {
      steve.changeColor(joe.get(i).getColor());//changes pizza to color of square --> adds topping to pizza
    }
  }
}
public void keyPressed()
{ 
  for (int i = 0; i <joe.size (); i++) {
    if (joe.get(i).getX() == 275 && key == ENTER) //Hit Enter to select topping, topping choice disappears, topping number on pizza increases, price increases
    {
      num++;
      joe.remove(i);
      for ( int j = i; j < joe.size (); j++)
      {
        joe.get(j).setX(100);
      }
      numTopping--;
      if (num > 2)
      {
        price+=toppingPrice;
      }
    }
  }
}
public void mouseClicked()
{

  for (int i = 0; i <joe.size (); i++) {
    if (joe.get(0).getX() == 275) //(buggy) if the first square is selected, cannot keep moving belt such that no topping is selected
    {
      joe.get(i).toLeft();
      print(joe.get(0).getX());
    } else
      if (joe.get(joe.size()-1).getX() == 275) //if the last square is selected, cannot keep moving belt such that no topping is selected
    {
      joe.get(i).toRight();
      print(joe.get(joe.size()-1).getX());
    } else {
      joe.get(i).move(); //Clicking on the right side moves the toppings to the right, vice versa
    }
  }
}

public class Squ //Pizza topping selections
{
  protected float h, w, x, y, c;
  private String ingredient;
  public Squ() {
  }
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
    fill(c);
    rect(x, y, w, h);
    fill(255);
    text(ingredient, x+25, y+25);
  }
  public void selection()//Highlights the square
  {
    if (x == 175)
    {
      stroke(255);
      strokeWeight(7);
    } else
    {
      stroke(130);
      strokeWeight(3);
    }
  }
  public void move()
  {
    if (mouseX >= 301 && mouseY >=250 && mouseY <= 350) //mouse has to be within the parameters to move belt
    {
      x -= 100;
    } else if (mouseX <= 299 && mouseY >=250 && mouseY <= 350) {
      x += 100;
    }
  }
  public float getColor() // returns color of square --> eventually return pizza topping
  {
    return c;
  }
  public float getX() // returns the x value of the square 
  {
    return x;
  }
  public void toRight()
  {
    if (mouseX <= 299 && mouseY >=250 && mouseY <= 350) {
      x += 100;
      redraw();
    }
  }
  public void toLeft()
  {
    if (mouseX >= 301 && mouseY >=250 && mouseY <= 350)
    {
      x -= 100;
    }
  }
  public void setX(int d)
  {
    x-=d;
  }
}
public class Cir extends Squ //Pizza circle
{
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
  public void changeColor(float col) // if called, changes the color of the circle to the one of the box--> adds topping to pizza
  {
    c = col;
  }
}
public class Rec extends Squ //Class for back and forward buttons
{
  public Rec(float xx, float yy, float ww, float hh, float cc  )
  {
    h = hh; 
    w = ww; 
    x = xx; 
    y = yy; 
    c = cc;
  }
  public void show()
  {
    fill(255, 0, 0);
    rect(x, y, w, h);
    
  }
  public void words()
  {
    if (x < 300)
    {
      fill(0);
      textSize(20);
      text("Back\nto\nMenu", x+70, y+25);
    } else
    {
      fill(0);
      textSize(20);
      text("Proceed\nto\nCheckout", x+70, y+25);
    }
  }
  public void selection()//(buggy)Mouse hover of buttons will cause light up
  {
  }
}
