/* Initialisation des variables */
int[] snake_x= new int[2500];        // Variable qui contient la position du serpent dans l'axe X
int[] snake_y= new int[2500];        // Variable qui contient la position du serpent dans l'axe Y
int nourriture_x;                    // Variable qui contient la postion de la nourriture dans l'axe X 
int nourriture_y;                    // Variable qui contient la postion de la nourriture dans l'axe Y
int longueur_snake;                  // Variable avec la longueur du serpent
int angle;                           // Variable qui contient la direction du serpent
int pixel_snake;                     // Variable qui contient la taille d'un carre du serpent et de la nourriture en pixel
boolean pause;                       // Variable pour savoir si le jeux est en pause ou pas
boolean mange;                       // Variable pour savoir si le serpent mange ou pas

void setup()
{
  size(500, 500);                    // Ouvrir une fenetre de taille 500x500
  frameRate(15);                     // Definir les fps (images par secondes) a 15 fps
  pause = true;                      // Mettre le jeux en pause
  initialisation();                  // Appel de la fonction fonction initialisation
}

void initialisation()
{
  pixel_snake = 20;                  // Mettre la taille d'un carre a 20 pixels
  snake_x[0] = 260;                  // Initialiser la postion du snake a la postion 260 de X
  snake_y[0] = 260;                  // Pareil, mais pour Y
  positionner_nourriture();          // Appel de la fonction qui positionne la nourriture dans une zone aleatoire de la carte
  angle = 90;                        // Definir l'angle de depart du serpent (Donc ici vers le haut)
  longueur_snake = 1;                // Definir la longueur du serpent de base a 1
  mange = false;                     // Initialiser la variable manger à FAUX
}

void draw()
{
  if (pause == true)                 // Si le jeux est en pause
  {
    noLoop();                        // On dit a processing de ne plus appeler la fonction draw
  }
  background(0);                       // Afficher un fond au noir
  //?????;                             // Appel de la fonction qui met une bordure bleue
  //?????;                             // Appel de la fonction qui affiche un cube de nourriture
  mouvement_snake();                 // Appel de la fonction qui fait bouger le serpent
  //?????;                             // Appel de la fonction qui affiche le serpent
  fin_jeu();                         // Appel de la fonction qui verifie si la partie est finie ou pas
  //manger();                          // Appel de la fonction qui fait manger le serpent et l'agrandis
}

void affiche_bordure()
{
  fill(#16324C);                    // Remplir de bleu la bordure
  noStroke();                       // Desactiver la mini-bordure mise automatiquement
  rect(0, 0, 20, 500);              // Mettre un carre qui sert de bordure a gauche
  //rect(480, 0, ???, ???);            // Pareil mais a droite
  rect(0, 0, 500, 20);              // En haut
  //rect(???, ???, 500, 20);            // Puis en bas
}  

void fin_jeu()                      // Fonction fin du jeux
{
  int i = 1;                        // Variable index
  int tete_x = snake_x[0];          // Variable qui indique la position x de la tête du snake
  int tete_y = snake_y[0];          // Variable qui indique la position y de la tête du snake

  /*
  if ( tete_x < 20 || ??? > 470 || ??? < 20 || tete_y > 470)        // Si le serpent touche les bordures
  {
    stopLoop();                                                                          // Fin du jeux
  }
  */
  while (i < longueur_snake)                                                              // Si i est inferieur a la longueur du serpent
  {
    if (snake_x[i] == snake_x[0] && snake_y[i] == snake_y[0] && mange == false)          // Si le serpent se mange alors
    {
      stopLoop();                                                                        // Fin du jeux 
    }
    i = i + 1;                                                                           // Je prend i et je lui ajoute 1
  }
  mange = false;                                                                         // Met la variable manger a FAUX
}

void stopLoop()                                                                          // Fonction qui affiche la fin du jeux, le "Game Over" et le score
{
  fill(255);                                                                             // Rendre le petit rectable visible
  rect(150, 190, 200, 75);                                                               // Creer un rectangle au centre de la fenetre
  fill(0);                                                                               // Remplir le petit rectangle de blanc
  text("GAME OVER", 210, 215);                                                           // Afficher le fameux "Game Over"
  text("Score:  "+ longueur_snake, 225, 250);                                            // Puis afficher le score par rapport a la longueur du serpent
  noLoop();                                                                              // Ne plus appeler la fonction draw
}