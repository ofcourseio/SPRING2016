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
   int xIndex = i % numPicsX;
   float yIndex = floor((float)i/(float)numPicsX);
   
   
   int x = margin + (rectangleWidth + margin) * xIndex;
   int y = (int)(margin + (rectangleHeight + margin) * yIndex);
   int w = rectangleWidth;
   int h = rectangleHeight;
   if(inside(x, y, w, h)){
     if(mousePressed){
        fill(255,0,0);
     }else{
         fill(255, 127, 127);
     }
   }else{
     fill(255);
   }
   rect(x, y, w, h);
 }  
}

boolean inside(int x, int y , int w, int h){
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
  return true;
  }else{
  return false;
  }
}

///   5/2 = floor(2.5) = 2; ceil(2.5) = 3; round(2.5) = 3