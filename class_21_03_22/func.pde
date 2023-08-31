void reInit() {
  float rad = int(random(1,4))*75;
  for(int i=0; i<N; ++i) {
    float xx = width*0.5 + rad*cos(TWO_PI*i/N);
    float yy = height*0.5 + rad*sin(TWO_PI*i/N);
    p[i] = new par( xx, yy );
  }
}

void connect() {
  for(int i=0; i<N; ++i) {
    for(int j=i; j<N; ++j) {
      if(i!=j) {
        float d = dist( p[i].loc.x,p[i].loc.y,p[j].loc.x,p[j].loc.y);
        if( d < len) {
          stroke(p[i].cc,4);
          strokeWeight(1);
          line( p[i].loc.x,p[i].loc.y,p[j].loc.x,p[j].loc.y );
          
          //p[i].acc += new PVector( (p[i].loc.x-p[j].loc.x)/d, (p[i].loc.y-p[j].loc.y)/d );
          
        }
      }      
    }
  }
  
}

class par{
  PVector loc;
  PVector vel;
  float theta;
  color cc;
  
  par( float x, float y ) {
    loc = new PVector(x,y);
    theta = random(TWO_PI);
    vel = new PVector( cos(theta), sin(theta) );
    cc = cols[int(random(cols.length))];
  }
  
  void move() {
    loc.add(vel.mult(dt));
    //loc.x = (loc.x+width)%width;
    //loc.y = (loc.y+height)%height;
    //theta += random(-1,1)*0.25;
    
    theta = noise(loc.x * nscale, loc.y * nscale) * TWO_PI;
    vel = new PVector( cos(theta), sin(theta) );
  }
  
  void show() {
    stroke(cc,50);
    strokeWeight(2);
    point(loc.x, loc.y);  
  }
  
}
