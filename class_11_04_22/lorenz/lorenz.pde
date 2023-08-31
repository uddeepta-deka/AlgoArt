int ntraj = 100; 
int niter = 10000; 

color [] cols= {#001219, #005f73, #0a9396, #94d2bd, #e9d8a6, #ee9b00, #ca6702, #bb3e03, #ae2012, #9b2226};
float [] x = new float[ ntraj*niter ];
float [] y = new float[ ntraj*niter ];
float [] z = new float[ ntraj*niter ];

float xcm = 0, ycm = 0, zcm = 0;
float scale = 15.0;
int iter = 0;

void setup(){
  size(800, 800, P3D);
  background(0);
  //-- Read the data into an array
  String [] dx = loadStrings("../lorx-ntraj"+nf(ntraj)+"-niter"+nf(niter)+".txt");
  String [] dy = loadStrings("../lory-ntraj"+nf(ntraj)+"-niter"+nf(niter)+".txt");
  String [] dz = loadStrings("../lorz-ntraj"+nf(ntraj)+"-niter"+nf(niter)+".txt");

  for (int i=0; i<dx.length; ++i){
    x[i] = float (dx[i]);
    y[i] = float (dy[i]);
    z[i] = float (dz[i]);
    xcm += x[i]; ycm += y[i]; zcm += z[i];
  }
  xcm /= dx.length; ycm /= dx.length; zcm /= dx.length;
  //drawTraj(5);
  //drawIter(5);
}

void draw(){
  background(0);
  drawIter(iter);
  iter ++;
}

void drawIter (int iter){
  int loc;
  strokeWeight(6);
  for ( int i=0; i<ntraj; ++i ){
    stroke(cols[i%cols.length]);
    loc = i*niter + iter;
    point(width*0.5+x[loc]*scale-xcm, height*0.85-z[loc]*scale+zcm, -height*0.5+y[loc]*scale-ycm);
  }
}

void drawTraj ( int id ){
  int loc;
  stroke(255);
  strokeWeight(2);
  for ( int i=0; i<niter; ++i ){
    loc = id*niter + i;
    point(width*0.5+x[loc]*scale-xcm, height*0.5-z[loc]*scale+zcm, -height*0.5+y[loc]*scale-ycm);
  }
}
