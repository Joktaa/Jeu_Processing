// Initialisation des variables 
PImage flappy, back, alien;                                                          
int flappyX, flappyY, kappaX, kappaY;                                         
int a = 0;
Kappa[] kappa = new Kappa[5];
int aliens = 0;



void setup()
{
size(900, 599);
flappy = loadImage("nyan_cat.png");
back = loadImage("back.png");
flappyX =450;
flappyY =400;
}



void draw()
{
  background(back);
  imageMode(CENTER);                                      // Centre peut etre les coor. de l'image
  image(flappy, flappyX, flappyY, 100, 50);
  for (int i = 0; i<kappa.length; i++){
    kappa[i] = new Kappa();
    kappa[i].setup();  
    kappa[i].draw();
  }
}



void keyPressed()
{
  if(keyCode == UP){
    flappyY -= 5;
  }
    if(keyCode == DOWN){
    flappyY += 5;
  }
    if(keyCode == LEFT){
    flappyX -= 5;
  }
    if(keyCode == RIGHT){
    flappyX += 5;
  }
}



// Colisionneur retournant un booléen 
/*boolean collision()
{
  if (){
     
     return(true);
   }
   else {
     
     return(false);
   }
}*/



class Kappa
{
PImage kappaImage;
int kappaX, kappaY;
// int aliens = 0;



  void setup()
  {
    kappaImage = loadImage("kappa.png");
  }



  void draw()
  {
    if (aliens < 5){
      get_kappa();
    }
    else {
      update();
    }
  }



  void update()
  {
    kappaX =
    kappaY +=2;
    image(kappaImage, kappaX, kappaY, 100, 100);
  }



/*  void get_alien()
  {
    while (a < 5){
      println("test");
      kappaX = int(random(50, 850));
      kappaY = 0;
      image(alien, kappaX, kappaY, 100, 100);
      a += 1;
    }
    kappaY += 2;
    image(alien, kappaX, kappaY, 100, 100);  
  }*/

  

  void get_kappa()
  {
    //kappaX = int(random(50, 850));
    kappaY = 0;    
    image(kappaImage, kappaX, kappaY, 100, 100);
    aliens += 1;    
  }
}
