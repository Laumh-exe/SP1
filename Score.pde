class Score {
  int fontSize;
  int points;
  int diamondValue;
  
  Score() {
    fontSize = 50;
    points = 0;
    diamondValue = 10;
  }

  void display() {
    fill(0);
    textSize(fontSize);
    textAlign(CORNER);
    text(points, 30, 40);
  }
  
}
