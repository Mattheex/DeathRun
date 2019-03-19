class Trap {

  boolean rocket_b = false;
  int rocket_f  = 0;

  PVector rocket_v = new PVector(1500, 300);

  boolean caisse_b = false;
  int caisse_f = 0, c1, c2;
  PVector caisse_v = new PVector(600, 100);

  float time = millis();
  boolean death = false;
  int trap, currentFrame = 0, ground;

  int[] col = new int[33];

  Trap(int g) {
    ground = g;
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
    if (caisse_b) {
      image(sprites[5][caisse_f], caisse_v .x, caisse_v.y);
      caisse();
      if (!death) {
        death = collision(xP, yP, 64, 64, caisse_v.x, caisse_v.y, 64, 64);
      }
    }

    image(sprites[5][caisse_f], caisse_v .x, caisse_v.y);
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

  void caisse() {
    c1 = ceil(caisse_v.x);
    c2 = ceil(caisse_v.x + 64);
    if (col[c1/32] < col[c2/32]) {
      ground  = col[c1/32];
    } else {
      ground = col[c2/32];
    }
    if (caisse_v.y <= ground) {
      caisse_v.y += 10;
    } else {
      caisse_v.y = ground; 
      caisse_b = false;
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
