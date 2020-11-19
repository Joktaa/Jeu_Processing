PImage fond,sol,tubeHaut,tubeBas,oiseau0, oiseau1, oiseau2;
PFont police;
int positionSol, imageOiseau, score = 0;
int Xtube = 200;
int Ytube = 300;
int hauteurOiseau = 300;
float vitesseOiseau = -5;
boolean finJeu = false;

void setup(){
  size(288,512);
  fond = loadImage("fondJour.png");
  sol = loadImage("sol.png");
  tubeHaut = loadImage("tubeHaut.png");
  tubeBas = loadImage("tubeBas.png");
  oiseau0 = loadImage("flappy1.png");
  oiseau1 = loadImage("flappy2.png");
  oiseau2 = loadImage("flappy3.png");
  police = loadFont("BritannicBold-48.vlw");
}

void draw(){
  image(fond,0,0);
  image(sol, positionSol, 400);
  image(tubeBas, Xtube, Ytube);
  image(tubeHaut, Xtube, Ytube - 470);
  displayScore();
if(finJeu == false){
//bouge le sol
  if(positionSol > -48){
    positionSol--;
  }
  else if (positionSol == -48){
    positionSol = 0;
  }
//bouge les tubes
  if(Xtube > -52){
    Xtube--;
  }
  else if(Xtube == -52){
    Ytube = int(random(200, 400));
    Xtube = 288;
  }
  
  imageOiseau = (imageOiseau + 1)%3;
  oiseau();
  finJeu = chocOiseau();
} 
  else{
    image(oiseau0, 150, hauteurOiseau);
  }
}

void mouseClicked(){
 vitesseOiseau = -5; 
}


void oiseau(){
  hauteurOiseau += int(vitesseOiseau); 
  vitesseOiseau += 0.2; 
  switch (imageOiseau){
    case 0 :
    image(oiseau0, 150, hauteurOiseau);
    break;
    case 1 :
    image(oiseau1, 150, hauteurOiseau);
    break;   
    case 2 :
    image(oiseau2, 150, hauteurOiseau);
    break;  
  }
}


boolean chocOiseau(){
  if(184 > Xtube && Xtube+52 > 150){
    if(hauteurOiseau < Ytube-150 || hauteurOiseau+24> Ytube){
      return true;
    }
  }
  if(hauteurOiseau >= 372){
    return true;
  } 
  else{
  return false;
  }
}


void displayScore(){
  if(Xtube+52== 150){
    score++;
  }
  textFont(police, 20);
  fill(255);
  text("scores: "+score, 20, 30);
}
