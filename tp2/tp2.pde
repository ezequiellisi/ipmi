//Declaro variables
PImage img1, img2, img3;
PFont t;
String texto1, texto2, texto3;
int segundos;
int posX;
float posY;


void setup(){
  size(640,480);
  
  //Cargo imágenes
  img1 = loadImage("twd1.png");
  img2 = loadImage("twd2.jpg");
  img3 = loadImage("twd3.jpg");
  
  //Cargo fuente de texto y los textos que usaré
  t = loadFont("rockwell.vlw");
  textFont(t,35);
  texto1 = "The Walking Dead es una serie apocalíptica de zombies inspirada en la saga de cómics con el mismo nombre.";
  texto2 = "DIRECTORES \nGwyneth Horder-Payton, \nGuy Ferland, \nErnest R. Dickerson y \nFrank Darabont.";
  texto3 = "ELENCO PRINCIPAL \nAndrew Lincoln como Rick Grimes \nDanai Gurira como Michonne Hawthorne \nNorman Redus como Daryl Dixon \nMelissa McBride como Carol Peletier \nLauren Cohan como Magie Rhee \nJeffrey D. Morgan como Negan Smith";
  
  //Asigno valores a las variables de posición
  posX = 20;
  posY = 480;
}


void draw(){
  background(0);
  
  //Establezco un contador de segundos
  if(frameCount%60==0){
    segundos++;
  }
  
  //Primera condición: Si segundos es menor o igual a 9, que se reproduzca la primera imagen y el primer texto.
  if(segundos<=9){
  image(img1,0,0,width,height);  
  textFont(t);
  textSize(35);
  float tono = map(posY,480,10,0,175);
  fill(tono,0,0);
  text(texto1,posX,posY,600,200);
  posY = posY-0.5;
  
  //Le doy movimiento vertical ("hacia arriba") al texto
  if(posY>10){
    posY = posY - 0.5;
  }else{
    posY=10;
  }
  
  //Segunda condición: Si segundos es mayor a 9 y menor o igual que 18, que se reproduzca la segunda imagen y el segundo texto.
  }else if(segundos>9 && segundos<=18){
    image(img2,0,0,width,height);
    textFont(t);
    textSize(35);
    float opacidad1 = map(frameCount,540,960,0,255);
    fill(255,247,80,opacidad1);
    text(texto2,160,140,600,200);
  
  //Tercera condición: Si segundos es mayor a 18, se reproduce la tercera imagen y el tercer texto.
  }else{
  image(img3,0,0,width,height);
  textFont(t);
  textSize(20);
  posY = 180;
  posX=120;
  float opacidad2 = map(frameCount,1080,1380,0,255);
  fill(83,242,233,opacidad2);
  text(texto3,posX,posY,600,200);
  
  //Aparición de un botón de reinicio.
  if(segundos>=30){
    fill(255,0,0);
    rect(500,400,100,50);
    fill(0);
    text("reiniciar",510,420,100,50);
    }
  }
}


//Reinicio de variables para que el botón tenga utilidad.
void mousePressed(){
  if(mouseX>500 && mouseX<600 && mouseY>400 && mouseY<450){
    segundos = 0;
    posX = 20;
    posY = 480;
  }
}
  
  
