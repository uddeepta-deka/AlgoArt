class particle{
 //-- Define all the variables of particle 
  PVector loc, vel;
  float dt;
  int lifeTime;
  float theta;
  color col;
  
  //-- Constructor - first essential function to create the object
  particle(float x, float y){
    //-- Assign all variables to some values
     theta = random(TWO_PI);
     //loc = new PVector(random(width), random(height));
     loc = new PVector(x, y);
     vel = new PVector(cos(theta), sin(theta));
     dt = random(1,5);
     //lifeTime = int(random(500,1000));
     //lifeTime = 1000;
     col = cols[int(random(cols.length))];
  }
  
  void show(){
    stroke(0,25);
    strokeWeight(2);
    //-- another method to stop the animation
    //if (frameCount<lifeTime) point(loc.x, loc.y); 
  }
  
  void periodic(){
    loc.x = (loc.x + width) % width;
    loc.y = (loc.y + height) % height;
  }
  
  void move(){
     loc.add(vel.mult(dt)); 
     //theta += random(-0.25, 0.25);
     theta += randomGaussian() * 0.2;
     //vel = new PVector(random(-1,1), random(-1,1)); 
     vel = new PVector(cos(theta), sin(theta));
     //-- Introduces periodic boundary conditions
     periodic();
  }
  
}
