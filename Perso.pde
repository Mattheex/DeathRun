class Perso {
  PVector position, start;
  int speed, previous_direct = 2, direct = 1, x2 = 0;
  boolean z = false, s = false, q = false, d = false, monte = false, saut = false, death=false;
  int currentFrame = 0;
  float g = -350, t;
  int v0 = 150;
  int direct_saut;
  float time0, time = millis();

  Perso(int s, int g) {
    position = new PVector(10, g);
    speed = s;
  }

  void update() {
    if (death) {
      if (direct!= 6) {
        direct = 6;
        currentFrame = 1;
      } else if (currentFrame != 5) {
        timeFrame(5);
      }

      if (position.y < ground) {
        position.y += 20;
      } else {
        position.y = ground ;
      }
    } else if (saut) {
      if (z && x2 == 2) {
        time0 = millis();
        start = position;
        x2 = 3;
      } else if (z) {
        monte = true;
      } else {
        monte = false;
        if (x2 != 3) {
          x2 = 2;
        }
      }

      if (q) {
        direct_saut = 0;
      } else if (d) {
        direct_saut = 1;
      } else if (s) {
        direct_saut = 2;
      } else {
        if (previous_direct != 2) {
          direct_saut = 3;
        } else {
          direct_saut = 4;
        }
      }

      jump();
    } else {
      if (z) {
        time0 = millis();
        saut = true;
        start = position;
        previous_direct = 2;
        if (direct == 0) {
          currentFrame = 2;
        } else {
          currentFrame = 0;
        }
        direct = 2;
        x2 = 1;
      } else  if (q) { // left
        left();
        if (direct != 0) {
          currentFrame = 0;
          direct = 0;
        }
        timeFrame(7);
      } else if (d) { // right
        right();
        if (direct != 1) {
          currentFrame = 0;
          direct = 1;
        }
        timeFrame(7);
      } else if (s) {
        if (direct != 3) {
          if (direct == 0) {
            currentFrame = 1;
          } else {
            currentFrame = 3;
          }
          direct = 3;
        }
      } else {
        currentFrame = 0;
      }
    }

    image(sprites[direct][currentFrame], position.x, position.y);
  }

  void timeFrame(int max) {
    if (millis() > time + 40) {
      if (currentFrame >= max) {
        currentFrame = 0;
      } else {
        currentFrame +=1;
      }
      time = millis();
    }
  }

  void jump() {
    t = (millis() - time0)/1000;

    if (t > 0.1 && x2 == 0) {
      currentFrame = 1;
      x2 = 1;
    }

    if (monte) {
      position.y = start.y - (v0+speed) * t - g * t * t;
    } else {
      position.y = start.y - (v0+speed -30) * t - g * t * t;
    }

    switch (direct_saut) {
    case 0:
      previous_direct = 0;
      currentFrame = 3;
      left();
      break;
    case 1:
      previous_direct = 1;
      currentFrame = 1;
      right();
      break;
    case 2 :
      if (previous_direct == 0) {
        currentFrame = 0;
      } else {
        currentFrame = 2;
      }
      position.y -= g * t * 0.2;
      break;
    case 3:
      if (previous_direct == 0) {
        currentFrame = 3;
        position.x -= speed * 0.5;
      } else {
        currentFrame = 1;
        position.x += speed * 0.5;
      }
      break;
    }

    if (position.y > ground) {
      position.y = ground;
      saut = false;
      x2 = 0;
      if (previous_direct == 0) {
        direct = 0;
      } else {
        direct = 1;
      }
      previous_direct = 2;
    }
  }

  void right() {
    position.x += speed;
  }

  void left() {
    position.x -= speed;
  }

  void t_up(boolean u) {
    z = u;
  }
  void t_down(boolean d) {
    s  = d;
  }
  void t_right(boolean r) {
    d = r;
  }
  void t_left(boolean l) {
    q = l;
  }
}
