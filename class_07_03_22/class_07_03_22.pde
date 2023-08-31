int step = 200;

color [] cols = {#003049, #d62828, #f77f00, #fcbf49, #eae2b7};

void setup(){
  size(800,800);
  background(cols[int(random(cols.length))]);
  /* The coordinate system is 
  now translated to the center*/
  rectMode(CENTER);
  
  for (int i=0; i<width; i+=step){
    for (int j=0; j<height; j+=step){
      pushMatrix();
      translate(i + step/2,j + step/2);
      
      //rect(0, 0, step, step);
      // -- Call a recursive rectangle function
      nestedRect(step, j * TWO_PI/height, 10);
      
      popMatrix();
    }
  }
  // save("rectangles.png");
}

void nestedRect(float edge, float angle, float offset){
  rotate(random(angle));
  fill(cols[int(random(cols.length))], random(50,200));
  noStroke();
  
  rect( - offset, offset, edge, edge);
  if(edge>20){
    nestedRect(edge * random(0.6,0.9), angle * 0.75, offset * 0.75);
  }
  
}
