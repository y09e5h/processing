// A Mover object
Ball ball1;
Ball ball3;
Ball ball5;
Ball ballomkar;
void setup() {
  size(700,760);
  ball1 = new Ball(100,height/3, 20); 
  ball3 = new Ball(200,height/4, 35);
  ball5 = new Ball(400,height/5, 30);
  ballomkar = new Ball(300,0,65);
}


void draw() {
  background(0);
  
  ball1.steps();
  ball3.steps();
  ball5.steps();
  ballomkar.steps();
}



class Ball {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector windforce = new PVector(200,0);
  PVector gravity = new PVector(0,0.98);
  PVector friction = new PVector(0,0);
  float mass=0;
  PVector acceleration = new PVector(0,0);
  int radious = 0;
   PVector force;
  float frictionConst = 0.01;
  float weight =0;
  float e = 0.6;
  Ball() {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    radious = 2;
    mass = 3.14 * radious * radious;
    weight = gravity.y*mass;
   
  }
  Ball(float locx , float locy, int r)
  {
    velocity = new PVector(0,0);
    location = new PVector(locx,locy);
    radious = r;
    mass = 3.14 * radious * radious;
    weight = gravity.y*mass;
  }
  void steps()
  {
    move();
    display();
    if(mousePressed)
    { 
      if(mouseX >= width/2 && windforce.x > 0)
      {
        windforce.mult(-1);
      }
      
      if(mouseX < width/2 && windforce.x < 0)
      {
        windforce.mult(-1);
      }
      applyForce(windforce);
    }
   
    applyForce(new PVector(0,weight));
    friction = new PVector((weight * frictionConst) /*% (mass* acceleration.x)*/,0);
    if(acceleration.x>0)
    {
      friction.mult(-1);
    }
    
    if( acceleration.x != 0 && location.y >= height)
    {
      applyForce(friction);
    }
   
    
  }
  void applyForce(PVector F)
  {
    
     acceleration.add(PVector.div(F,mass)); 
    //acceleration.add(velocity); 
  }
  void move()
  {
          //System.out.println("location.x : "+location.x+"  acceleration.x : "+acceleration.x);

     if(location.x > width  )
    {
      //velocity.x = velocity.x * -1;
      //a.x = a.x * -1;
      location.x = width;
      acceleration.x = (int)Math.floor(e * Math.floor(acceleration.x) * -1);
     // location.x =  radious*5;
      
    }
     if(location.x < 0  )
    {
      //velocity.x = velocity.x * -1;
      //a.x = a.x * -1;
      location.x = 0;
      acceleration.x = (int)Math.floor(e * Math.floor(acceleration.x) * -1);
     // location.x =  radious*5;
      
    }
    if((location.y > height)) 
    {
      //System.out.println(location.y);
      //velocity.y = velocity.y * -1;
      //location.y=height;
       acceleration.y = (int)Math.floor(e * Math.floor(acceleration.y) * -1);
     // System.out.println("location.y : "+location.y+ " , height - radious : "+(height - radious));
      //location.y = 5+height- radious;
      
    }
    
    location.add(acceleration);
  
    //if(location.y>)
  }
  
   
  
  void display() {
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y-this.radious/2,radious,radious);
  }

}
