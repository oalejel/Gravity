ArrayList<Object> world = new ArrayList<Object>(100);//a way to organize all of our boxes togetjer
float gravity = 2;//pretty much acceleration but in pixels per frame squared
int loop = 0;//tells us number of frames passed

//do some setup to the window and other stuff
void setup() {
  size(600, 600);//set the window size
  background(0);//make the background back
  noStroke();//turn off borders
  frameRate(60);//60 frames per second (also # of times draw is called)
}

//whatever is between these brackets repeats at the framerate
void draw() {
  ///////
  //make everything black again
  background(0);
  //redraw it to the screen with different y values
  for (Object object : world) {
    rect(object.x, object.y + object.velocity, object.w, object.h);
    object.velocity = object.velocity + gravity;
    object.y = object.y + object.velocity;
  }
  //if we go through 50 frames
  //then add an object and set a random color
  if (loop >= 50) {
    addRandomObject();
    loop = 0;
    setRandomStroke();
  }
  loop++;
  /////
}

//adds a box with randomized values to our "world" list
void addRandomObject() {
  float xx = random(width / 3);
  float y = 0;//random((float)height);
  float w = random((float)width / 2);
  float h = random((float)height / 2);
  float mass = random(10);//max of 5 kg 

  Object o = new Object(xx, y, w, h, mass);
  world.add(o);
}

//jjst to organize boxes by their information
class Object {
  //a float is a decimal number (like 1.4)
  float mass = 0;
  float velocity = 0;

  float h = 0;
  float w = 0;
  float x;
  float y;
  //the initializer that "creates" an object
  Object(float xx, float yy, float ww, float hh, float mm) {
    x = xx;
    y = yy;
    w = ww;
    h = hh;
    mass = mass;
  }
}

//make the color default different
void setRandomStroke() {
  float r = random(255) + 100;
  float g = random(255) + 100;
  float b = random(255) + 100;
  fill(r, g, b);
}

