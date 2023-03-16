class Ball {
  int x;
  int y;
  int size;
  float speedY;
  float speedX;
  int r;
  boolean fPHit;
  
  Ball(int size) {
    this.x = (int) random(width/2-100, width/2+100);
    this.y = (int) random(height/2-50, height/2+50);
    this.size = size;
    this.speedY = 10;
    this.speedX = 10;
    this.r = size/2;
    fPHit = false;
  }

  // Displaying the ball
  void display() {
    fill(0);
    ellipse(x, y, size, size);
  }

  // Making the ball move
  void move() {
    y += speedY;

    // Ball goes straight down after it spawns
    if (fPHit) {
      x += speedX;
    }

    // Check for walls
    hitWalls();

    // Check for paddle
    hitPaddle();
  }

  // Hit detection for walls
  void hitWalls() {
    if (x-r < 0) {
      x = 0+r;
      speedX *= -1;
    } else if (x+r > width) {
      x = width-r;
      speedX *= -1;
    } else if (y+r > height) {
      gameRunning = false;
    } else if (y-r < 0) {
      y = 0+r;
      speedY *= -1;
    }
  }

  // Hit detection for paddle
  void hitPaddle() {
    if (y+r > paddle.y-paddle.sizeY/2 && x+r > paddle.x-paddle.sizeX/2 && x-r < paddle.x+paddle.sizeX/2) {
      // True after paddle was hit first time (So that the ball goes straight down first
      fPHit = true;
      // Adjust angle
      speedX = map(x - paddle.x, -paddle.sizeX/2, paddle.sizeX/2 , -10, 10);
      // Reverse speedY
      speedY *= -1;
    }
  }

  // Hit detection for diamonds
  boolean hitDiamonds(ArrayList<Diamond> diamonds) {
    int d;
    d  = (int) dist(ball.x, ball.y, diamonds.get(0).cX, diamonds.get(0).cY );
    if (d < ball.r + diamonds.get(0).size/2) {
      score.points += score.diamondValue;
      if (paddle.sizeX > 30) {
        paddle.sizeX -= 20;
      }
      return true;
    }
    return false;
  }
  
}
