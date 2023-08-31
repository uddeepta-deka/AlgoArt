//-------- Algorithmic Art and Visualization -----------
//------------- Codes from Session 1 -------------------
//-- Siddhartha Mukherjee, ICTS, Bangalore, 220228 -----
//------------------------------------------------------

int step = 20;

//-- One syntax for declaring arrays, we'll see the other one soon
//color [] cols = {#03071e, #370617, #6a040f, #9d0208, #d00000, #dc2f02, #e85d04, #f48c06, #faa307, #ffba08};
color [] cols = {#003049, #d62828, #f77f00, #fcbf49, #eae2b7};

int saveID = 0;
color bgcol = cols[int(random(cols.length))];

//-- Multiple line tiles based upon a fraction of the step size
float frac = 0.5;

void setup() {
  size(800,800);
  background( bgcol );
  drawMaze();  
}

void drawMaze() {
  background(bgcol);
  
  //-- The two nested loops to subdivide space
  for(int i=0; i<=width; i+=step) {
    for(int j=0; j<=height; j+=step) {
      /* We will be using the translate function to reach our desired spatial location, hence
      we shall use pushMatrix() here so the code remembers (0,0) as the origin. Remember, you can 
      use multiple pushMatrix() commands, but make sure its not happening accidentally! Always use popMatrix()
       */
      pushMatrix();
      translate(i,j);
      /* Pick a random fill color. This is done by picking a random integer 
      between 0 and Number of Colours in the cols array.
      Here I am also using an alpha (transparency) value for the fill, this is the second argument
      in the fill function below*/ 
      fill( cols[int(random(cols.length))], j*255/height );
      //-- I first make a rectangle without a stroke but with a fill
      noStroke();
      rect(0,0,step,step);
      
      stroke( cols[int(random(cols.length))] );  
      //-- I am changing strokeWeight based upon the vertical location of the lines - try other variations
      strokeWeight( 4.0*j/height );
      
      float r = random(1);
      /* I'm using two kinds of "tiles", each with 3 lines
      Try to draw out the points being used for each line on a piece of paper */
      if(r < 0.5 ) {
        line(0,0,step,step);
        line(step*frac,0,step,step*(1-frac));
        line(0,step*frac,step*(1-frac),step);
      } else {
        line(step,0,0,step);
        line(0,step*(1-frac),step*(1-frac),0);
        line(step*frac,step,step,step*frac);
      }
      
      //-- ALways remember to popMatrix() back to the required coordinate system configuration
      popMatrix();    
    }
  }
}

void mousePressed() {
  //-- This is also a Processing in-built function
  //-- Left click regenerates the sketch, right click saves the sketch
  if(mouseButton==LEFT) {
    bgcol = cols[int(random(cols.length))];
    background( bgcol );
    drawMaze();
  } else {
    /* Here we save the drawing. We format the saveID using the number format function nf
    so nf(2,2) = 02, nf(2,3) = 002, nf(3,4) = 0003 and so on*/
    save( "Images/maze-" + nf(saveID,2) + ".png" );
    //-- Increment saveID to the next value, for the next save. Note that i++ is short hand for i=i+1 
    saveID++;
  }
}

void draw() {   
  //-- Currently empty, but required, to enable mouse interactions
}
