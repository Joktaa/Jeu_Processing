PImage[] mario;
PImage jump, ground, bg1, bullet;
PFont font1;
int marioNb, groundX, groundY, bulletY, bulletX, vitesseBullet= 0;
boolean saut = false;
int hauteur, sol = 600;
int marioX = 0;
float vitesseChute, score= 0;
boolean perdu = false;
PFont police;
boolean isJump = true;

void setup()
{
  int i = 0;
  
  size(820, 720);
  mario = new PImage[24];
  while (i != 24) {
    mario[i] = loadImage("mario" + i + ".png");
    i ++;
  }
  jump = loadImage("mario3.png");
  ground = loadImage("ground.png");
  bg1 = loadImage("back_back.png");
  bullet = loadImage("bullet.png");
  font1 = loadFont("Stencil-48.vlw");
  groundY = sol + 68;
  bulletY = 600;
  bulletX = 900;
  vitesseBullet = 5;
  perdu = false;
  score = 0;
}

void keyPressed()
{
  if (key == 'r' && perdu == true)
  {
    setup();
  }
  if (key == ' ' && hauteur == sol) {
    vitesseChute = -9;
  }
}

void draw()
{
  if (perdu == false) {
    run_game();
  } else {
    textAlign(CENTER, CENTER);
    fill(46, 13, 115);
    textFont(font1, 30);
    text("pas gave fort ... seulement: " + score, 410, 360);
  }
}


void  run_game()
{
  score += 1; //ajout de 0.1 à la variable score
  move_ground();
  chute();
  move_mario();
  move_bullet();
  if (collision() == true) {
    perdu = true;
  }
  if (hauteur >= sol) {
    hauteur = sol;
    isJump = false;
  } else {
    isJump = true;
  }
  display();
}

void display()
{
  background(bg1);
  image(ground, groundX, groundY); //image(variable du sol, variable sol X, variable sol Y);
  if (isJump == true) {
    image(jump, marioX, hauteur);
  } 
  else {
    image(mario[marioNb], marioX, hauteur); //afficher image mario
  }
  image(bullet, bulletX, bulletY);
  textAlign(LEFT, DOWN);
  fill(255);
  textFont(font1, 48);
  text("Score : " + int(score), 10, 40);
}

boolean collision()
{
  if (10 + 40 >= bulletX && 10 < bulletX + 34 && hauteur + 63 >= bulletY && hauteur < bulletY + 20) {
    return (true);
  } else {
    return (false);
  }
}

void move_bullet()
{
  bulletX = bulletX - vitesseBullet;  //retirer vitesseBullet à bulletX
  if (bulletX <= -20) {
  bulletX = 900;
  bulletY = int(random(550, 650));
  vitesseBullet = int(random(5, 10));
  }
}

void move_ground()
{
  groundX -= 4;
  if (groundX == -1004) {
    groundX = -4;
  }    
}

void chute()
{
  hauteur = hauteur + int(vitesseChute);
  
  if (hauteur >= sol) {
    vitesseChute = 0;
  } else {
    vitesseChute += 0.4;
  }
  
}

void move_mario()
{
  marioNb +=  1;
      
  if (marioNb == 24){
    marioNb = 0;
  }                                   //si marioNb est égal à 24 mettre marioNb à 0
}
