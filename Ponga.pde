GameMenu menu;
Ball ball;
Paddle paddle;
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
ArrayList<Diamond> diamonds = new ArrayList<Diamond>();
boolean gameRunning = false;
Score score;

void setup() {
  size(800, 800);
  menu = new GameMenu();
  frameRate(60);
}

void draw() { //<>//
  background(200);

  if (!gameRunning) {
    menu.displayStart();
  } else if (gameRunning) {
    playGame();
  } 
}

// Cointains methods for gameplay
void playGame() {

  
  // Ball
  ball.display();
  ball.move();

  // Paddle
  paddle.display();
  paddle.move();

  // Spawn diamond
  spawnDiamond();
  
  // add bubbles to bubbles array
  addBubble();
  // Spawn bubbles from bubbles array
  spawnBubble();

  // Display score
  score.display();
}

void addBubble() {
  // Add bubble every 2.5 seconds
  if (bubbles.size() < 15 && frameCount%150 == 0) {
    bubbles.add(new Bubble((int) random(10,790),(int) random(10,600)));
  }
  
  // Check each bubble if it has been hit
  int tmpSize = bubbles.size();
  for(int i = 0; i < tmpSize; i++) {
    if(bubbles.get(i).wasHit()){
      bubbles.remove(i);
      score.points++;
      break;
    }
  }
  
  
}

void spawnBubble() {
  for (Bubble b : bubbles) {
    b.display();
  }
}

void spawnDiamond() {
  diamonds.add(new Diamond());
  if (diamonds.size() >= 1) {
    diamonds.get(0).display();
    if (ball.hitDiamonds(diamonds)) {
      diamonds.remove(0);
    }
  }
}

// Starts new game
void createNewGame() {   
  // Make sure no objects are left over from a potential last game
  bubbles.clear();
  diamonds.clear();
  
  // Instantiate new objects
  ball = new Ball(40);
  paddle = new Paddle(width/2, height+15, width/2, 20);
  score = new Score();
}

// Check if key is pressed
void keyPressed() {
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    paddle.left = true;
    paddle.right = false;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    paddle.right = true;
    paddle.left = false;
  } else if (gameRunning == false && keyCode == ' ') {
    gameRunning = true;
    createNewGame();
  }
}

// Check if key is released
void keyReleased() {
  if (key == 'a' || key == 'A' || keyCode == LEFT) {
    paddle.left = false;
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    paddle.right = false;
  }
}
