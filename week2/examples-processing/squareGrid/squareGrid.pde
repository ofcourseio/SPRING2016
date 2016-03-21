int numPicsX = 5;
int numPicsY = 7;
int margin = 20;

void setup(){
size(400, 600);
}

void draw(){

  int w2 = width - margin*(numPicsX + 1);
  int rectangleWidth = w2/numPicsX;
  
  int h2 = height - margin*(numPicsY + 1);
  int rectangleHeight = h2/numPicsY;
  int totalNumPics = 17;
  
 for(int i = 0; i < totalNumPics; i++){
   color(255, 0,0);
   int x = i % numPicsX;//modulo
   int y = floor(i/numPicsX);
   rect(margin + (rectangleWidth + margin)*x, margin + (rectangleHeight + margin) * y, rectangleWidth, rectangleHeight);
 } 
  
}