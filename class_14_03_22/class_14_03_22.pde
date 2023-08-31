int np = 100;
float rad = 200;

particle [] p = new particle[np];
//color [] cols = {#001219, #005f73, #0a9396, #94d2bd, #e9d8a6, #ee9b00, #ca6702, #bb3e03, #ae2012, #9b2226};
color [] cols = {#143601, #1a4301, #245501, #538d22, #73a942, #aad576};

void setup(){
  size(800,800);
  background(0);
  blendMode(ADD);
  for (int i=0; i<np; ++i){
    p[i] = new particle(width*0.5+rad*cos(TWO_PI*i/np),height*0.5+rad*sin(TWO_PI*i/np));
    //p[i] = new particle(random(width), random(height));
  }
  
}

void draw(){
  //fill (255, 5);
  //noStroke();
  //rect(0,0,width, height);
  
  for (int i=0; i<np; ++i){
    p[i].show();
    p[i].move();
  }
  
  //-- stopping criteria
  if(frameCount>1000) noLoop();
  connect();
}

void connect(){
  stroke(cols[int(random(cols.length))],25);
  //stroke(255,5);
  strokeWeight(1);
  //-- Loop over all particles
  //-- for each, check every other particle
  //-- if dist() < cutoff {drawLine}
  
  float cutoff;
  cutoff = 40;
  for (int i=0;i<np;++i){
   for (int j=i+1; j<np; ++j){
     if (dist(p[i].loc.x, p[i].loc.y, p[j].loc.x, p[j].loc.y) < cutoff){
       line(p[i].loc.x, p[i].loc.y, p[j].loc.x, p[j].loc.y);
     }
   }
  }
  
}
