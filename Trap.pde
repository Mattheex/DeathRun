class Trap {

  boolean rocket_b = false;
  int rocket_f  = 0;
  PVector rocket_v = new PVector(1500, 450);

  float time = millis();
  boolean death = false;
  int trap, currentFrame = 0;

  Trap() {
  }

  void update(float xP, float yP) {
    if (rocket_b) {
      //trap = 4;
      if (!death) {
        death = collision(xP, yP, 64, 64, rocket_v.x, rocket_v.y, 64, 32);
      }
      
      if (rocket_v.x >= -64) {
        rocket(true);
        image(sprites[4][rocket_f], rocket_v.x, rocket_v.y);
      } else {
        rocket(false);
      }
    }
  }

  void rocket(boolean loop) {
    if (loop) {
      rocket_v.x -= speed;
      if (millis() > time + 40) {
        if (rocket_f > 2) {
          rocket_f = 0;
        } else {
          rocket_f +=1;
        }
        time = millis();
      }
    } else {
      rocket_b = false;
      rocket_v.x = 1500;
    }
  }

  boolean collision(float x1, float y1, int w1, int h1, float x2, float y2, int w2, int h2) {
    if (x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && y1 + h1 > y2) {
      println("Collision");
      return true;
    } else {
      return false;
    }
  }
}
