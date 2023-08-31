float circleX;
float circleY;

void setup(){
  size(640,360);
  circleX = width/2;
  circleY = height/2;
  background(50);
}


void draw(){
  //drawing stuff
  circleX = random(width);
  circleY = random(height);
  fill(random(233), random(233), random(233));
  ellipse(circleX,circleY,random(30),random(30));
  println(circleX);
  // Logic
  //circleX=circleX+random(-2,2);
  //circleY=circleY+random(-2,2);
 
}
