void setup(){
  size(880,1200);
  background(216, 225, 149);

}
void draw(){  
  if(mousePressed){
    stroke(122);
    fill(20,20,20);
    rect(mouseX, mouseY, 80,80);
  }else{
    fill(123,20,20);
    ellipse(mouseX,mouseY,80,80);
  }
  
}
