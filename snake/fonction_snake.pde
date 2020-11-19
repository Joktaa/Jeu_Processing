void affiche_snake()                         // On crée la fonction affiche_snake
{
  int i = 0;                                                      // Creation est initialisation de la variable i

  fill(#35DE00);                                                  // On definie la couleur du serpent en vert
  stroke(0);                                                      // On met une bordure au snake
  while (i < longueur_snake)                                      // Tant que i est inférieur a la valeur de longeur_snake
  {
    rect(snake_x[i], snake_y[i], pixel_snake, pixel_snake);       // on appel la fonction rect, on défini la position x et y puis la taille en x et en y
    i = i + 1;                                                    // On incrémente i de 1
  }
}

void mouvement_snake()                                            // Création de la fonction mouvement_snake
{
  int size = longueur_snake - 1;                                  // On déclare la variable size et on lui donne la valeur de longueur_snake moins 1

  while (size > 0)                                                // Tant que la taille est supérieur a 0
  {
    snake_x[size] = snake_x[size - 1];
    snake_y[size] = snake_y[size - 1];
    size = size - 1;                                              // On décremente size de 1
  }
  if (angle == 0)                                                 // Si la variable angle est égale a 0
  {
    snake_x[0] += pixel_snake;                                    // On ajoute la valeur de pixel_snake a snake_x[0] pour l'effet de déplacement
  } else if (angle == 270)                                        // Sinon si la valeur de angle est egale a 270
  {
    snake_y[0] += pixel_snake;                                    // On ajoute la valeur de pixel_snake a snake_y[0] pour l'effet de déplacement
  } else if (angle == 180)                                        // Sinon si la valeur de angle est egale a 180
  {
    snake_x[0] -= pixel_snake;                                    // On enleve la valeur de pixel_snake a snake_x[0] pour l'effet de déplacement
  } else                                                          // Sinon
  {
    snake_y[0] -= pixel_snake;                                    // On enleve la valeur de pixel_snake a snake_y[0] pour l'effet de déplacement
  }
}

void manger()                                                     // On crée la fonction manger
{
  int tete_x = snake_x[0];                                        // Variable qui indique la position x de la tête du snake
  int tete_y = snake_y[0];                                        // Variable qui indique la position y de la tête du snake
 /* 
  if (tete_x == ???? && ???? == nourriture_y)           // Si les valeur de snake_x[0] est égale a nourriture_x et que snake_y[0] est égale a nourriture_y 
  {
    snake_x[longueur_snake] = snake_x[longueur_snake - 1];        // On donne la valeur de snake_x[longueur_snake - 1] a snake_x[longueur_snake]
    snake_y[longueur_snake] = snake_y[longueur_snake - 1];        // Même étape mais avec snake_y
    longueur_snake += 1;                                          // On incrémente la longueur du serpent de 1 pour le faire grandir
    mange = true;                                                 // Le serpent mange
    positionner_nourriture();                                     // Appel de la fonction positionner_nourriture pour en faire apparaitre une autre
  }
  */
}