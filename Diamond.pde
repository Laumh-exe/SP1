class Diamond {
  int cX;
  int cY;
  int size;
  int x1;
  int x2;
  int x3;
  int x4;
  int y1;
  int y2;
  int y3;
  int y4;
  int r;
  int colorChange;
  
  Diamond() {
    this.cX = (int) random(40,width-40);
    this.cY = (int) random(50,height-200);
    size = 60;
    // Up point
    this.x1 = cX;
    this.y1 = cY - size/2-10;
    // Left point
    this.x2 = cX - size/2;
    this.y2 = cY;
    // Down point
    this.x3 = cX;
    this.y3 = cY + size/2+10;
    // Right point
    this.x4 = cX + size/2;
    this.y4 = cY;
    r = 255;
    colorChange = -3;
  }
  
  void display() {
    noStroke();
    if(r < 200 || r > 255) {
      colorChange *= -1;
    }
    fill(r, 0, 0);
    quad(x1,y1,x2,y2,x3,y3,x4,y4);
    r += colorChange;
  }
  
}
