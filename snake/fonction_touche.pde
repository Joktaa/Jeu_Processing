void keyPressed()            // Création de la fonction nommée keyPressed
{
  if (key == 'r')            // Si la touche "r" est pressé
  {
    snake_x= new int[2500];  // On initialise snake_x
    snake_y= new int[2500];  // On initialise snake_y
    pause = false;           // Initialise pause a faux
    loop();                  // Appel la fonction loop qui elle même appel la fonction draw
    initialisation();        // Appel de la fonction initialisation
  }
  if (keyCode == ENTER)      // Si la touche Entrer est appuyé
  {
    if (pause == true)       // Si pause est vrai
    {
      pause = false;         // On met pause a faux
      loop();                // Appel la fonction loop qui elle même appel la fonction draw
    } else                   // sinon
    {
      pause = true;          // On met pause a vrai
      noLoop();              // On dit a processing de ne plus appeler la fonction draw
    }
  }
  /*
  if (keyCode == UP && angle != 270 && snake_y[0] - pixel_snake != snake_y[1])       // Si la touche du clavier "HAUT" est pressé et que le serpent ne décend pas
  {
    angle = 90;                                                                      // On donne la valeur 90 a angle pour que le snake monte
  }
  if (keyCode == ???? && angle != 90 && snake_y[0] + pixel_snake != snake_y[1])      // Si la touche du clavier "BAS" est pressé et que le serpent ne monte pas
  {
    angle = 270;                                                                     // On donne la valeur 270 a angle pour que le snake parte a gauche
  }
  if (keyCode == LEFT && angle != 0 && snake_x[0] - pixel_snake != snake_x[1])       // Si la touche du clavier "GAUCHE" est pressé et que le serpent ne vas pas a droite
  {
    angle = 180;                                                                     // On donne la valeur 180 a angle pour que le snake parte a droite
  }
  if (keyCode == ???? && angle != 180 && snake_x[0] + pixel_snake != snake_x[1])    // Si la touche du clavier "DROITE" est pressé et que le serpent ne vas pas a gauche
  {
    angle = 0;                                                                       // On donne la valeur 0 a angle pour que le snake decende
  }
  */
}