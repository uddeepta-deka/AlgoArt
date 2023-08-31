color bgcol = #000000;
color [] cols = {#f94144, #f9c74f, #43aa8b, #277da1, #d00000};

color c1 = #f94144;
color c2 = #f9c74f;
int iter = 0 ;

int np = 500;
orbs [] ola = new orbs[np];


void setup(){
  size(800, 800);
  background(bgcol);
  
  for(int i=0; i<np; ++i){
    ola[i] = new orbs(TWO_PI*i/np);
  }
}

void draw(){
  fill(bgcol,20);
  noStroke();
  rect(0,0,width,height);
  for(int i=0; i<np; ++i){
    ola[i].show();  
    ola[i].move();
  }
  iter++;
  //envelope();
}

class orbs{
  float x, y, theta, rad, radBase;
  int cindx;
  orbs( float th ){
    theta = th;
    radBase = 200;
    rad = radBase + randomGaussian()*20;
    x = width * 0.5 + rad * cos(theta);
    y = height * 0.5 + rad * sin(theta);
    cindx = int(rad/75);
  }
  
  void move(){
    rad += randomGaussian()*2;
    if((rad>400)||(rad<0)) rad = 200;
    x = width * 0.5 + rad * cos(theta);
    y = height * 0.5 + rad * sin(theta);
    cindx = int(rad/5);
    theta += 0.001;
  }
  
  void show(){
    fill(cols[cindx%cols.length]);
    noStroke();
    float rr = rad * 10 / (width * 0.5);
    ellipse(x, y, rr, rr);
  }
  
}

void envelope(){
  int ci = 0;
  for(int i=0;i<np;++i){
    ci += ola[i].cindx;
  }
  ci/=np;
  
  //stroke(cols[ci%cols.length]);
  color cc = lerpColor(c1,c2,abs(sin(iter*0.01)));
  stroke(cc);
  noFill();
  beginShape();
  curveVertex(ola[0].x,ola[0].y);
  for(int i=0;i<np;++i){
    curveVertex(ola[i].x,ola[i].y);
  }
  curveVertex(ola[0].x,ola[0].y);
  curveVertex(ola[0].x,ola[0].y);

  endShape();
}
