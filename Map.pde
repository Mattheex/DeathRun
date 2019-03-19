class Map {
  int sX, sY;
  int t_cube = 32;

  PVector c_flottant = new PVector(60, 500);
  PVector button_r_v = new PVector(c_flottant.x, c_flottant.y-32);
  int button_r = 2;

  PVector c_flottant2 = new PVector(120, 500);
  PVector button_b_v = new PVector(c_flottant2.x, c_flottant2.y-32);
  int button_b = 0;

  int i;

  Map(int x, int y) {
    sX = x;
    sY = y;
  }

  void update() {
    noStroke();
    fill(8, 7, 7);
    for (i = 0; i < sX; i+=32) {
      rect(i, 0, t_cube, t_cube);
      rect(i, sY - t_cube, t_cube, t_cube);
    }
    
    scene1();

    rect(c_flottant.x, c_flottant.y, t_cube, t_cube);
    image(sprites[7][button_r], button_r_v.x, button_r_v.y);

    rect(c_flottant2.x, c_flottant2.y, t_cube, t_cube);
    image(sprites[7][button_b], button_b_v.x, button_b_v.y);
  }

  void scene1() {
    for (i = 32*10; i < 32*18; i+=32) {
      rect(i, 450, t_cube, t_cube);
    }
  }
}
