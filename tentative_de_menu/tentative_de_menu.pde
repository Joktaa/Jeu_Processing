Jeu_1 jeu_1;
Jeu_2 jeu_2;



void setup()
{
  jeu_1 = new Jeu_1();
  jeu_2 = new Jeu_2();
  background(0);
  size(600, 300);
  rectMode(CENTER);
  rect(width/3, height/2, 75, 50);
  rectMode(CENTER);
  rect(2*width/3, height/2, 75, 50);
  textSize(40);
  text("Choisis un carré", 150, 50);
}



void draw()
{
  isClick();
}



void isClick()
{
  if (key == 'a'){
    jeu_1.setup();    
  }
  else if (key == 'z'){
    jeu_2.setup();
  }
}



class Jeu_1
{
 void setup()
 {
   clear();
   textSize(25);
   text("Tu as choisi le premier jeu", 150, 50); 
 } 
}



class Jeu_2
{
  void setup()
  {
    clear();
    textSize(25);
    text("Tu as choisi le deuxieme jeu", 150, 50);
  }
}
