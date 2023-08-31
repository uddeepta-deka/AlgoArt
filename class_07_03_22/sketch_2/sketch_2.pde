color [] cols = {#6f1d1b, #bb9457, #432818, #99582a, #ffe6a7};
color [] leafcols = {#004b23, #006400, #007200, #008000, #38b000, #70e000, #9ef01a, #ccff33};

float thp = 0.0;
float thm = 0.0;
float radius = 300.0;
int iter = 0;
int saveIndx = 0;

void setup(){
  size(800,800);
  background(0);  
}
 
void draw(){
  background(0);
  fill(0, 10);
  noStroke();
  rect(0,0,width,height);
  //thp = mouseX*TWO_PI/width;
  //thm = mouseY*TWO_PI/width;
  
  thp = width/2 + radius * cos(iter*0.00002);
  thm = height/2 + radius * sin(iter*0.00002);
  
  drawBranch(width * 0.5, height * 0.8, 200, -PI/2, 10,0);
  
  // To make a movie --
  if((iter<1000) && (iter%10==0)){
    //save("frame-"+nf(saveIndx,3)+".png");
    saveIndx ++ ; 
  //}
  iter++;
}

void drawBranch(float x, float y, float len, float theta, float stwt, int cidx){
  
  float x2 = x + len * cos(theta);
  float y2 = y + len * sin(theta);
  strokeWeight(stwt);
  stroke(cols[cidx]);
  //line(x, y, x2, y2); 

  if(len>10){
    drawBranch(x2, y2, len * 0.7, theta + thp, stwt * 0.7, (cidx+1)%cols.length);
    drawBranch(x2, y2, len * 0.7, theta - thm, stwt * 0.7, (cidx+1)%cols.length);
  }else{
    float rad = 6;
    //fill(leafcols[int(random(leafcols.length))]);
    fill(leafcols[int(random(leafcols.length))],200);
    noStroke();
    ellipse(x2, y2, rad, rad);
  }
}
