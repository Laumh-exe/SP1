class GameMenu {
  int fontSize;

  GameMenu() {
    fontSize = 50;
  }

  void displayStart() {
    if (frameCount%60 > 40) {
      fill(200);
    } 
    else {
      fill(0);
    }
    textSize(fontSize);
    textAlign(CENTER);
    text("PRESS SPACE TO START NEW GAME", width/2, height/2);
  }

}
