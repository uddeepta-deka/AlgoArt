int N = 100;
par [] p = new par[N];
float dt = 1.0;
float len = 25;

float nscale = 0.025;

color [] cols = {#f94144, #f9c74f, #43aa8b, #277da1, #d00000};
int iter = 0;

void setup() {
  size(800,800);
  background(0);
  blendMode(SCREEN);
  
  reInit();

}

void draw() {
  fill(0,0);
  noStroke();
  rect(0,0,width,height);
  
  for(int i=0; i<N; ++i) {
    p[i].show();
    p[i].move();
  }
  
  connect();  
  iter++;  
}

void mousePressed() {
  if(mouseButton==LEFT) {
    reInit();
  }
}
