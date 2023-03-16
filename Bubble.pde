class Bubble {
  int x;
  int y;
  int size;
  int r;
  
  
  Bubble(int x, int y) {
    this.x = x;
    this.y = y;
    size = 20;
    r = size/2;
  }
  
  void display() {
    fill(0,200,0);
    ellipse(x,y,size,size);
  }
  
  boolean wasHit() {
    int d = (int) dist(ball.x, ball.y, x, y);
    if (d < ball.r + this.r) {
      return true;
    }
    return false;
  }
}
