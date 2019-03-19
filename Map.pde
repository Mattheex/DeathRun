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

  /*ArrayList<Integer> abscisse = new ArrayList<Integer>();
   ArrayList<Integer> col = new ArrayList<Integer>();
   int ab_now = -2;*/

  int[] col = new int[33];

  Map(int x, int y) {
    sX = x;
    sY = y;
    for (int i = 0; i < col.length; i++) {
      col[i] = sY + 64;
    }
  }

  void update() {
    noStroke();
    fill(8, 7, 7);
    
    sol(150, 300);
    escalier(384, 656, 5);
    reverseEscalier(384+5*32, 656, 5);

    rect(c_flottant.x, c_flottant.y, t_cube, t_cube);
    image(sprites[7][button_r], button_r_v.x, button_r_v.y);

    rect(c_flottant2.x, c_flottant2.y, t_cube, t_cube);
    image(sprites[7][button_b], button_b_v.x, button_b_v.y);
  }

  void plafond() { // Dessine un plafond
    rect(0, 0, 1056, 32);
  }

  void plateforme(int x, int y, int n) { // Créé des plateformes
    for (i = 0; i < n * 32; i += 32) {
      rect(x + i, y, t_cube, t_cube);
    }
  } // plateforme

  void sol(int x1, int x2) { // Permet un sol avec un gouffre entre x1 et x2
    if (x1 != 0 && x2 != 0) {

      for (i = 0; i < x1; i+= t_cube) {
        rect(i, sY - t_cube, t_cube, t_cube);
        col[i/t_cube] = sY-t_cube - 64;
      }
      for (i = x2; i < sX; i+= t_cube) {
        rect(i, sY - t_cube, t_cube, t_cube);
        col[i/t_cube] = sY-t_cube - 64;
      }
    } else {
      for (i = 0; i < sX; i += t_cube) {
        rect(i, sY - t_cube, t_cube, t_cube);
        col[i/t_cube] = sY-t_cube - 64;
      }
    }
  } // sol

  void escalier(int x, int y, int n) { // (x, y, nombre de marche)
    int q = n; 
    for (int s = 0; s < n * t_cube; s += t_cube) {
      plateforme(x + s, y - s, q); 
      q -= 1; 
      col[(x+s)/t_cube] = y - s - 64;
    }
  } // escalier

  void reverseEscalier(int x, int y, int n) {
    int q = n; 
    for (int s = 0; s < n * t_cube; s += t_cube) {
      plateforme(x, y - s, q); 
      q -= 1; 
      col[(x+q*32)/t_cube] = y - s - 64;
    }
  } // Reverse escalier
}
