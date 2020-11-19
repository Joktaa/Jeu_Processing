// music
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;    //music
AudioSnippet music;    //music
PImage[] mario;
PImage jump, ground, bg1, bullet, etoile;
PFont font1;
int marioNb, groundX, groundY, bulletY, bulletX, etoileY, vitesseBullet= 0;
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
  etoile = loadImage("jolie_etoile.png");
  font1 = loadFont("Stencil-48.vlw");
  minim = new Minim(this);    //music
  music = minim.loadSnippet("pas_gave_bien.mp3");    //music
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
  if (key == 'z') {
    marioX += 5;
  }
  if (key == 's'){
    marioX -= 5;
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
  if (music.isPlaying() == false){    //music
    music.play();
    
  }
}



//music
void stop()
{
  music.close();
  minim.stop();
  super.stop();
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
  //piece();
  image(bullet, bulletX, bulletY);
  textAlign(LEFT, DOWN);
  fill(255);
  textFont(font1, 48);
  text("Score : " + int(score), 10, 40);
}


boolean collision()
{
  if (marioX + 35 >= bulletX && marioX < bulletX + 34 && hauteur + 63 >= bulletY && hauteur < bulletY + 20) {
    return (true);
  } else {
    return (false);
  }
}

void move_bullet()
{
  bulletX = bulletX - vitesseBullet;  //retirer vitesseBullet à bulletX
  if (bulletX <= -20 && vitesseBullet < 10) {
  bulletX = 900;
  bulletY = int(random(550, 650));
  vitesseBullet += 1;
  }
  if(bulletX <= -20 && vitesseBullet >= 10) {
  bulletX = 900;
  bulletY = int(random(550, 650));
  vitesseBullet -= 1;
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
  } //si marioNb est égal à 24 mettre marioNb à 0
}

void piece()
{
  etoileY = int(random(550,600));
  image(etoile, 100, etoileY, 50, 50);
}
