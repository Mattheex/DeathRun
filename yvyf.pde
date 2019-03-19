int speed = 10, ground = 720 - 64 - 32;
PImage[] images_l = new PImage[8];
PImage[] images_r = new PImage[8];
PImage[] images_j = new PImage[4];
PImage[] images_d = new PImage[4];
PImage[] rocket = new PImage[4];
PImage[] caisse = new PImage[1];
PImage[] mort = new PImage[6];
PImage[] button = new PImage[2];
PImage [][] sprites = {images_l, images_r, images_j, images_d, rocket, caisse, mort, button};
Perso p = new Perso(speed, ground);
Trap t = new Trap();
Map m = new Map(1056, 720);

int bouton;

void setup() {
  size(1056, 720);
  for (int k = 0; k < 8; k++) {
    sprites[0][k] = loadImage("data/perso/left/left" + k + ".png");
  }
  for (int k = 0; k < 8; k++) {
    sprites[1][k] = loadImage("data/perso/right/right" + k + ".png");
  }
  for (int k = 0; k < 4; k++) {
    sprites[2][k] = loadImage("data/perso/jump/jump" + k + ".png");
  }
  for (int k = 0; k < 4; k++) {
    sprites[3][k] = loadImage("data/perso/down/down" + k + ".png");
  }
  for (int k = 0; k < 4; k++) {
    sprites[4][k] = loadImage("data/piege/rocket/rocket" + k + ".png");
  }
  sprites[5][0] = loadImage("data/piege/caisse.png");
  for (int k = 0; k < 6; k++) {
    sprites[6][k] = loadImage("data/perso/mort/mort" + k + ".png");
  }
  for (int k = 0; k < 2; k++) {
    sprites[7][k] = loadImage("data/piege/button/button" + k + ".png");
  }
}

void draw() {
  background(255);

  m.update();
  p.update();
  t.update(p.position.x, p.position.y);
  p.death = t.death;
}

void keyPressed() {
  if (keyCode == 90 || keyCode == 32) { // z
    p.t_up(true);
  } else if (keyCode == 83) { // s
    p.t_down(true);
  } else if (keyCode == 81) { //q
    p.t_left(true);
  } else if (keyCode == 68) { // d
    p.t_right(true);
  }
}

void keyReleased() {
  if (keyCode == 90 || keyCode == 32) { // z
    p.t_up(false);
  } else if (keyCode == 83) { // s
    p.t_down(false);
  } else if (keyCode == 81) { //q
    p.t_left(false);
  } else if (keyCode == 68) { // d
    p.t_right(false);
  }
}

void mouseClicked() {
  if (mouseX >= m.c_flottant.x && mouseX <= m.c_flottant.x+m.t_cube && mouseY >= m.c_flottant.y && mouseY <= m.c_flottant.y+32) {
    t.rocket_b = true;
    m.button = 1;
  }
}
