// Initialisation des variables 
color final_color = #FF0000;        // Variable qui va contenir la couleur du cercle
color background_final_color = 0;   // Variable qui va contenir la couleur de background
float millisecond = millis();       // Variable qui va contenir le temps depuis le début du lancement du jeux (c'est avec cette variable qu'on va pouvoir définir la fréquence à laquelle on change la couleur)
float wait = 0;                     // Variable qui va contenir le temps d'attente entre deux couleurs
int score_1 = 0;                    // Variable qui va contenir le score du joueur 1
int score_2 = 0;                    // Variable qui va contenir le score du joueur 2
int longueur = 0;                   // Variable qui va contenir la longueur de la fenêtre
int hauteur = 0;                    // Variable qui va contenir la hauteur de la fenêtre
int cheat = 0;                      // Variable qui va contenir la valeur du cheat code
int j = 0;                          // Variable qui va contenir la valeur aléatoire pour le background
boolean first = true;               // Variable qui va permettre de détecter si le point a déjà été attribué. 


// Initialisation de la fenêtre de jeux
void setup()
{
  fullScreen();                    // On appelle une fonction processing permettant d'avoir le jeux en plein écran
  longueur = width;                // On stocke la longueur de la fenêtre dans la varible "longueur"
  hauteur = height;                // On stocke la hauteur de la fenêtre dans la varible "hauteur"
}



// Fonction qui est appelée en boucle par proccessing, c'est dans cette fonction qu'on va coder le jeu.
void draw()
{   
  if (cheat != 5) {                                    // Condition chargeant le background si le cheat code n'est pas actif
background(0);
}
else {                                                 // Condition chargeant le background si le cheat code est actif
 background_get_color(j);
}

if (wait <= millisecond && millisecond > 4000.0) {       // Chargement du changement de couleur et du temps quand le temps actuel est fini et initialisation du nouveau fond
  j = int(random(0,4));
  get_color();
  setTime();
}
if (millisecond > 4000.0){
  fill(final_color);                                     // On remplie le cercle qu'on va créer avec la couleur contenue dans "final_color"
  ellipse(width/2, height/2, longueur/4, longueur/4);    // On crée un cercle positionner au centre de la fenêtre 
  displayText();                                         // On appelle la fonction affichant le score
}
  millisecond = millis();                                // On stocke dans la variable 'millisecond' le temps en ms depuis le début du jeux en appelant la fonction processing 'millis()'  
  display_start(millisecond);
}



// Fonction permettant de choisir la nouvelle couleur du cercle
void get_color()
{
  color last_final_color = final_color;              // 
  int i = int(random(-1, 4));                        // On fait un random pour obtenir un chiffre entre -1 et 4 (-1 et 4 ne sont pas compris)
while (last_final_color == final_color)              //
{
  if (i == 0 || i == 1)                              // Si i est égal à 0 on rentre dans cette condition
  {                                                  // On met le code couleur du rouge dans la variable final_color
    last_final_color = #FF0000;
  }
  else if (i == 2)                                   // Si i est égal à 1 on rentre dans cette condition
  {                                                  // On met le code couleur du vert dans la variable final_color
    last_final_color = #00FF00;
  }
  else if (i == 3)                                   // Si i n'est pas égal à 0 ni à 1 on rentre dans cette condition
  {                                                  // On met le code couleur du bleu dans la variable final_color
    last_final_color = #0000FF;
  }
i = int(random(-1, 4)); 
}

final_color = last_final_color;
  first = true;                                      // On remet la variable first a true pour pouvoir reattribué un point
}



// Fonction qui choisi la couleur du fond avec comme parametre le chiffre alléatoire choisis dans draw 
void background_get_color(int j)
{
  if (j == 0 || j == 1)                               
  {                                                  
    background(255, 0, 0);
  }
  else if (j == 2)                                   
  {                                                  
    background(0, 255, 0);
}
  else if (j == 3)                                    
  {                                                
    background(0, 0, 255);
}
}



//Fonction permettant de définir le temps d'attente avant de changer la couleur
void setTime()
{
  wait = random(1250, 2250);               // On fait un random entre 1250 et 2250 ms
  wait += millisecond;                     // On ajoute ensuite le temps contenu dans "millisecond" pour définir combien de temps il faut attendre pour changer la couleur
}



void display_start(float millisecond)
{
  if (millisecond < 1000.0 ){
    textSize(50);
    fill(255);
    text("3", width/4, 175);
  }
  else if(millisecond < 2000.0){
    textSize(50);
    fill(255);
    text("2", width/2, 175);
  }
  else if (millisecond < 3000.0){
    textSize(50);
    fill(255);
    text("1", 3*width/4, 175);
  }
  else if (millisecond < 4000.0){
    textSize(100);
    fill(255);
    text("GO !", 600, height/2);
  }
  if (millisecond < 3000.0){
    textSize(50);
    fill(#FF0000);
    text("Appuyez le plus rapidement sur votre touche quand le cercle est rouge", 100, height/2);
    text("5", 100, 400);
  }
}



// Fonction permettant d'afficher du texte
void displayText()
{
  fill(#ffffff);                                               // On définit la couleur du texte en blanc
  textSize(100);                                               // On définit la police du texte
  text(score_1, longueur/8, 100);                              // On appelle une fonction processing affichant le score du joueur 1 en le positionant à 1/8 de la longueur de l'écran, et se position à la coordonnée 100 sur l'axe des ordonnées
  text(score_2, longueur/8 * 7, 100);                          // On appelle une fonction processing affichant le score du joueur 2 en le positionant à 7/8 de la longueur de l'écran, et se position à la coordonnée 100 sur l'axe des ordonnées
  
  if (score_1 == 10)                                           // Si le score du joueur 1 est égal à 10 on rentre dans cette condition
  { 
    text("Player 1 won !", longueur/3, 200);                   // On affiche que le joueur 1 à gagné
    text("Press echap to quit", longueur/4, hauteur - 200);    // On affiche un texte indiquant comment quitter le jeux
    noLoop();                                                  // On dit à processing d'arrêter d'appeller la fonction "draw" en boucle, arrêtant ainsi le jeu
  }
  else if (score_2 == 10)                                      // Si le score du joueur 2 est égal à 10 on rentre dans cette condition
  {
    text("Player 2 won !", longueur/3, 200);                   // On affiche que le joueur 2 à gagné
    text("Press echap to quit", longueur/4, hauteur - 200);    // On affiche un texte indiquant comment quitter le jeux
    noLoop();                                                  // On dit à processing d'arrêter d'appeller la fonction "draw" en boucle, arrêtant ainsi le jeu
  }
}



// Fonction processing permettant de détecter si une touche a été appuyée
void keyPressed()
{

  if (key == 'p' && first == true && final_color == #FF0000)          // Si la touche p est appuyée et que le point est attribuable (first == true) et que le code couleur dans "final_color" est rouge on rentre dans la condition
  {
    score_2 += 1;                                                     
    first = false;                                                    // On passe la variable "first" à false pour dire que le point n'est plus attribuable à ce tour
  }
  if (key == 'q' && first == true && final_color == #FF0000)          // Si la touche q est appuyée et que le point est attribuable (first == true) et que le code couleur dans "final_color" est rouge on rentre dans la condition
  {
    score_1 += 1;                                                     
    first = false;                                                    
  }
  if (key == 'p' && first == true && final_color != #FF0000)          // Si la touche p est appuyée et que le point est attribuable (first == true) et que le code couleur dans "final_color" n'est pas rouge on rentre dans la condition
  {
    score_1 += 1;                                                     
    first = false;                                                    
  }
  if (key == 'q' && first == true && final_color != #FF0000)          // Si la touche q est appuyée et que le point est attribuable (first == true) et que le code couleur dans "final_color" n'est pas rouge on rentre dans la condition
  {
    score_2 += 1;                                                     
    first = false;                                                    
  }
 if (key == 'm')                                                      // Condition ajoutant 10 au cheat code quand on appuie sur m
 {
   cheat += 10;   
 }
 if (key == 'x')                                                      // Condition enlevant 5 au cheat code quand on appuie sur x
 {
   cheat -= 5;   
 }
}
