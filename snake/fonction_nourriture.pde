void affiche_nourriture()                                                   //Création de la fonction qui permet l'affichage de la nourriture
{ 
  fill(#FD0000);                                                            // On donne la couleur rouge
  //??????                                                                  // On appel la fonction rect, on défini la position x et y puis la taille en x et en y
}  

void positionner_nourriture()                                               // Création de la fonctione qui positionne l'aliment
{
  int i = 0;                                                                // On crée la variable i et on l'initialise a 0

  nourriture_x = int(random(20, 480));                                      // On donne une valeur en int aléatoire entre 20 et 480 a nourriture_x
  nourriture_y = int(random(20, 480));                                      // On donne une valeur en int aléatoire entre 20 et 480 a nourriture_y
  while (i < longueur_snake)                                                // tant que la valeur de i est inferieur a la valeur de la variable longueur_snake
  {
    if (snake_x[0] == nourriture_x && snake_y[0] == nourriture_y)           // Si les valeur de snake_x[0] est égale a nourriture_x et que snake_y[0] est égale a nourriture_y / Si 
    {
      nourriture_x = int(random(20, 480));                                  // On donne une valeur en int aléatoire entre 20 et 480 a nourriture_x
      nourriture_y = int(random(20, 480));                                  // On donne une valeur en int aléatoire entre 20 et 480 a nourriture_y
      i = -1;                                                               // On décremente i de 1
    }
    i = i + 1;                                                              // On incrémente i de 1
  }
  if (nourriture_x % pixel_snake != 0)                                      // Si le modulo de nourriture_x et de pixel_snake est différent de 0
  {
    nourriture_x -= nourriture_x % pixel_snake;                             // On décremente nourriture_x par le modulo de nourriture_x et de pixel_snake
  }
  if (nourriture_y % pixel_snake != 0)                                      // Si le modulo de nourriture_y et de pixel_snake est différent de 0
  {
    nourriture_y -= nourriture_y % pixel_snake;                             // On décremente nourriture_y par le modulo de nourriture_y et de pixel_snake
  }
}