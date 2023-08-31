int nx = 512;
float [] vort = new float[ nx*nx ];

float vrms = 0.0;

color c1 = #0a9396;
color c2 = #ee9b00;
color c3 = #ae2012;

float clip = 1.0;
void setup() {
  size(512, 512);
  background(255);
  
  //-- Read the data into an array
  String [] data = loadStrings( "vortSample.txt" );
  
  for(int i=0; i<data.length; ++i) {
    vort[i] = float( data[i] );
    vrms += vort[i]*vort[i]; 
  }
  
  vrms = pow( vrms/data.length, 0.5 );
  println(vrms);
  
  viz2();
  colorbar();
}


void colorbar(){
  fill(0,150);
  noStroke();
  float th = 5;
  int ndiv = 200;
  rect( width * 0.5 -ndiv * 0.5 - th, height * 0.85-th, ndiv+2*th, 25+2*th);
  color cc;
  for (int i=0; i<ndiv; ++i){
    float frac = i* 1.0/ndiv;
    if (frac<0.5) cc = lerpColor( c1, c2, frac * 2.0);
    else cc = lerpColor(c2,c3, (frac-0.5)*2.0);
    fill(cc);
    noStroke();
    rect(width*0.5 - ndiv*0.5 +i, height*0.85, 1, 25);
  }
}


void viz2() {
  int loc;
  color cc;
  for(int i=0; i<nx; ++i) {
    for(int j=0; j<nx; ++j) {
      loc = j*nx + i;
      float frac = map( vort[loc], -clip*vrms, clip*vrms, 0, 1 );
      if (frac<0.5) cc = lerpColor( c1, c2, frac * 2.0);
      else cc = lerpColor(c2,c3, (frac-0.5)*2.0);
      noStroke();
      fill(cc);
      rect(i,j,1,1);
    }
  }
}
void viz() {
  int loc;
  for(int i=0; i<nx; ++i) {
    for(int j=0; j<nx; ++j) {
      loc = j*nx + i;
      float frac = map( vort[loc], -clip*vrms, clip*vrms, 0, 1 );
      color cc = lerpColor( c1, c2, frac );
      noStroke();
      fill(cc);
      rect(i,j,1,1);
    }
  }
}
