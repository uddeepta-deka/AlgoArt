float circleX;
float circleY;
float xspeed = 2;
float yspeed = 2;

void setup(){
  size(640,360);
  circleX = random(width/2);
  circleY = random(height/2);
}

void draw(){
  background(50);
  fill(102);
  stroke(255);
  ellipse(circleX, circleY, 24,24);
  circleX += xspeed;
  circleY += yspeed;
  if (circleX>width||circleX<0){
    xspeed=-xspeed;
  }
  if (circleY>height||circleY<0){
    yspeed=-yspeed;
  }
}
