// A Mover object
Ball ball1;
Ball ball2;

void setup() {
  size(640,360);
  ball1 = new Ball(); 
  ball2 = new Ball(100,200,2,1);
}

void draw() {
  background(0);
  
  // Update the location
  ball1.move();
  // Display the Mover
  ball1.bounce();
  ball1.display(); 
   ball2.move();
  // Display the Mover
  ball2.bounce();
  ball2.display(); 
}




/**
 * Acceleration with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of the basics of motion with vector.
 * A "Mover" object stores location, velocity, and acceleration as vectors
 * The motion is controlled by affecting the acceleration (in this case towards the mouse)
 */


class Ball {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector(0.01,0.01);
   
  Ball() {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(2.5,-2);
    
    
  
  }
  Ball(float locx , float locy, float vx, float vy)
  {
    velocity = new PVector(vx,vy);
    location = new PVector(locx,locy);
    
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
  }
  void bounce()
  {
    if((location.x > width ) || (location.x < 0))
    {
      velocity.x = velocity.x * -1;
      acceleration.x = acceleration.x * -1;
    }
    if((location.y > height)||(location.y) < 0)
    {
      velocity.y = velocity.y * -1;
      acceleration.y = acceleration.y * -1;
    }
  }
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,40,40);
  }

}
