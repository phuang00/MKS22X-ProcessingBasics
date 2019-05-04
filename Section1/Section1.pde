int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  int num_bars;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y, int bars) {
    // keeps bars within 0 to 40 (by adding finding the absolute value of bars mod 41, producing an int between 0 and 40, and then adding one if bars is equal to zero)
    bars = (int)abs(bars % 41);
    if (bars == 0){
      num_bars = 1;
    }
    else{
      num_bars = bars;
    }
    this.x = x;
    this.y = y;
    values = new float[num_bars];
    speeds = new float[num_bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    
    for (int i = 0; i < values.length; i++){
      if (values[i] < 0){
        fill(255, 0, 0);
      }
      else{
        fill(0, 255, 0);
      }
      rect(x + (400 / num_bars) * i, y + MAX_VALUE, (400 / num_bars), -values[i]); 
    }



    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if (values[i] > MAX_VALUE){
        values[i] = MAX_VALUE;
      }
      if (values[i] < MIN_VALUE){
        values[i] = MIN_VALUE;
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      if (values[i] == MAX_VALUE || values[i] == MIN_VALUE){
        speeds[i] = -speeds[i];
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 10);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
