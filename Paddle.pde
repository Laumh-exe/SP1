class Paddle {
  int x;
  int y;
  int sizeX;
  int sizeY;
  int speed;
  boolean left;
  boolean right;

  Paddle(int x, int y, int sizeX, int sizeY) {
    this.x = x;
    this.y = y-sizeY;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    left = false;
    right = false;
    speed = 13;
  }

  // Display paddle
  void display() {
    rectMode(CENTER);
    fill(255,0,0);
    rect(x, y, sizeX, sizeY);
  }

  // Move the paddle - left and right is being checked by keyPressed, and keyReleased
  void move() {
    // Player movement
    playerControls();
    
    // Check for walls
    hitWalls();
  }

  // Check for walls
  void hitWalls() {
    if (x-sizeX/2 < 0) {
      x = 0+sizeX/2;
    } else if (x+sizeX/2 > height) {
      x = height-sizeX/2;
    }
  }
  
  void playerControls() {
    if (left) {
      x -= speed;
    } else if (right) {
      x += speed;
    }
  }
}
