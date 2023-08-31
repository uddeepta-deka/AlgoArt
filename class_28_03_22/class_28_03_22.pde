PImage img;
particles [] part;
int np=0;
int step = 15;

int iter=0;
float dt = 0.025; 
float noiseScale = 0.002;

void setup(){
  size(672, 960);
  background(255);
  rectMode(CENTER);
  
  img = loadImage("/home/uddeepta/sketchbook/class_28_03_22/kahlo.jpg");
  img.loadPixels();
  
  loadPixels();
  
  for(int i=0; i<width; i+=step){
    for (int j=0; j<height; j+=step){
      np++;
    }
  }
  println("NumParticles", np);
  part = new particles[np];
  int k=0;
  
  for(int i=0; i<width; i+=step){
    for (int j=0; j<height; j+=step){
      int loc = j*width + i;
      part[k] = new particles(i, j, brightness(img.pixels[loc]));
      k++;
    }
  }
}

void init(){
  noiseScale = random(0.0001,0.01);
  int k = 0;
  for(int i=0; i<width; i+=step){
    for (int j=0; j<height; j+=step){
      int loc = j*width + i;
      part[k] = new particles(i, j, brightness(img.pixels[loc]));
      k++;
    }
  }
}

void draw(){
  fill(255);
  //rect(0,0,width, height);
  
  for(int i=0; i<np; ++i){
    //part[i].show();
    part[i].move();
    part[i].showTrails();
  }
  if ((iter%150==0) && (iter>0)) init();
  iter++;
  //float d = dist(width/2, height/2, mouseX, mouseY)/2.5;
  ////println(d);
  
  //for(int i=0; i<width; ++i){
  //  for(int j=0; j<height;++j){
  //    int loc = j*width + i;
  //    float shade=brightness(img.pixels[loc]);
  //    pixels[loc] = color(shade, shade, d);
  //  }
    
  //}
  //updatePixels();
}

class particles{
  float x, y, shade, rad, phase;
  int life, counter;
  
  particles(float xx, float yy, float shade_){
    x = xx; y=yy;
    shade = shade_;
    rad = step*1.5;
    //rad = map(shade, 0, 255, step, step*0.2); 
    phase = map(shade, 0, 255, 0, PI);
    life = 10+int(shade/2);
    counter =0;
  }
  
  void move(){
    float theta = noise(x*noiseScale,y*noiseScale)*TWO_PI;
   x+=cos(theta);
   y+=sin(theta);
  }
  
  void showTrails(){
    float r = shade + abs(sin(iter*dt + phase + PI/2)) * 50.0;
    float g = shade;
    float b = shade + abs(sin(iter*dt + phase)) * 120.0;
    fill(r, g, b);
    noStroke();
    float rr = rad * (1.0 - counter*1.0/life);
    if (counter<life){
      ellipse(x, y, rr, rr);
      counter++;
    }
  }
  
  void show(){
    //-- Rect
    float r = shade + abs(sin(iter*dt + phase + PI/2)) * 50.0;
    float g = shade;
    float b = shade + abs(sin(iter*dt + phase)) * 120.0;
    fill(r, b, g);
    noStroke();
    float rr = rad * sin(iter*dt + phase);
    if(abs(rr)>step*0.9) stroke(255);
    rect(x, y, step,step);
    
    //-- Ellipse
    r = shade + abs(sin(iter*dt + phase + PI/2)) * 150.0;
    g = shade;
    b = shade + abs(sin(iter*dt + phase)) * 10.0;
    fill(r, g, b);
    noStroke();

    ellipse(x, y, rr, rr);
  }
}
