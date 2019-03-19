class Map {
  int sX, sY;
  int t_cube = 32;
  
  PVector c_flottant = new PVector(64,500);
  PVector button_r = new PVector(c_flottant.x,c_flottant.y-20);
  int button = 0;
  int i;

  Map(int x, int y) {
    sX = x;
    sY = y;
  }

  void update() {
    
    fill(120);

    sol(sX, sX);
    escalier(384,656,5);
    reverseEscalier(32,656,5);
    rect(c_flottant.x, c_flottant.y, t_cube, t_cube);

    image(sprites[7][button], button_r.x, button_r.y);
    
  }
  
  void plateforme(int x, int y, int n) {
    for (i = 0; i < n * 32; i += 32) {
      rect(x + i, y, t_cube, t_cube);

    }
  } // plateforme
  
  void sol(int x1, int x2){
    for (i = 0; i < x1; i+= t_cube) { // Sol
      rect(i, sY - t_cube, t_cube, t_cube);
    }
    for (i = x2; i < sX; i+= t_cube) {
      rect(i, sY - t_cube, t_cube, t_cube);
    }
  } // sol
  
  void escalier(int x, int y, int n) { // (x, y, nombre de marche)
    int q = n;
    for (int s = 0; s < n * t_cube; s += t_cube) {
      plateforme(x + s, y - s, q);
      q -= 1;
    }
  } // escalier
  
  void reverseEscalier(int x, int y, int n) {
    int q = n;
    for (int s = 0; s < n * t_cube; s += t_cube) {
      plateforme(x , y - s, q);
      q -= 1;
    }
  } // Reverse escalier
  
} // Map
