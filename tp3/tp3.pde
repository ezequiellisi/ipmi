//https://youtu.be/4c5vnc-rm_E
//Ezequiel Lisi Armesto
//comisión 1
//Obra a replicar: n° 12

PImage img;
int cant=14;
float tam;
boolean invertir = false;


void setup() {

  size(800, 400);
  img = loadImage("12.png");

  tam = (width/2)/cant;
}

/*ACLARACIÓN: Todas las funciones ellipse() así como los ellipseMode(CENTER) fueron previamente funciones rect() y rectMode(CENTER).
 El motivo de esto es para lograr la correcta ubicación de las líneas blancas; ya que al trabajar con cuadrados, estos coincidían entre sí en las esquinas.
 La intersección de las esquinas de los cuadrados, era el lugar deseado para colocar las líneas blancas.
 Una vez logrado, todas las funciones referentes a rect() fueron modificadas por funciones referentes a ellipse() para lograr el efecto de la imagen deseado*/

void draw() {
  background(0);

  stroke(255);
  strokeWeight(5);
  //Establezco el tamaño de las líneas blancas (será la mitad del lado del cuadrado, o del diámetro de los círculos).
  float tamLinea = tam / 2;

  //Anidación de ciclo for para distribuir las lineas a lo largo de la pantalla.
  for (int x = 0; x <= cant; x++) {
    for (int y = 0; y <= cant; y++) {
      /*Quiero que las líneas blancas tengan su centro justo en la intersección de las esquinas de los cuadrados.
       Este centro de líneas tendrá coordenadas (cx,cy).
       Como en un principio usé rectMode(CENTER), el origen del cuadrado es su centro y no su esquina superior izquierda.
       Luego, para definir cx y cy, a x*tam e y*tam le resto tam/2, o sea la mitad de lo que vale su centro en x y en y. En el caso de x le sumo 400 para que se desplace a la derecha.*/
      float cx = 400 + x * tam - tam / 2;
      float cy = y * tam - tam / 2;

      /*Quiero que las lineas blancas estén a 45° por lo que debo desplazarme la misma cantidad en x como en y respecto de sus centros.
       Las unidades que debo desplazarme es tamLinea/2; arriba, abajo, derecha o izquierda segun corresponda a cada punto de la linea.
       Si las lineas tocan la "parte roja" de la pantalla, que vayan "hacia abajo". Sino (es decir tocan "la parte verde" de la pantalla) que vayan "hacia arriba".
       Esto se logra con la función propia tocaZonaRoja y el uso de condicionales*/


      boolean sentido = tocaZonaRoja(x, y);

      if (invertir) {
        sentido = !sentido;
      }

      if (sentido) {
        line(cx - tamLinea / 2, cy - tamLinea / 2, cx + tamLinea / 2, cy + tamLinea / 2);
      } else {
        line(cx - tamLinea / 2, cy + tamLinea / 2, cx + tamLinea / 2, cy - tamLinea / 2);
      }
    }
  }

  /*defino el relleno y borde de los cuadrados (posteriormente círculos).
   Al haber elegido rectMode(CENTER) (posteriormente ellipseMode(CENTER)),los primeros dos parámetros de rect() serán su ubicación (x,y) del centro.*/
  stroke(0);
  strokeWeight(3);
  ellipseMode(CENTER);

  /*Anidación de ciclo for para distribuir los círculos a lo largo de la pantalla.
   Para x e y menores e iguales a cant, se repdroducirá la función dibujarCirculoConColor().
   Uso de condicionales y función propia estaEnZonaRoja() para determinar el color de los cuadrados (círculos).*/
  for (int x = 0; x <= cant; x++) {
    for (int y = 0; y <= cant; y++) {
      if (estaEnZonaRoja(x, y)) {
        dibujarCirculoConColor(400 + x * tam, y * tam, tam, color(198, 55, 26)); //Si se cumple estaEnZonaRoja(), los círculos tendrán relleno rojo
      } else {
        dibujarCirculoConColor(400 + x * tam, y * tam, tam, color(96, 147, 144)); //Si no se cumple, el relleno de los círculos será verdoso
      }
    }
  }




  //Inserto la imagen en este caso al final del draw, ya que hay elementos del código que pueden superponerse con la imagen.
  image(img, 0, 0, 400, 400);
}

//Función propia con parámetros que NO retorna valores.
//Servirá para darle color de relleno a los círculos
void dibujarCirculoConColor(float cx, float cy, float diametro, color c) {
  fill(c);
  ellipse(cx, cy, diametro, diametro);
}

//Función propia con parámetros que SÍ retorna valores.
//Con esta función se busca "delimitar un área o región" para luego rellenar los círculos mediante condicionales.
boolean estaEnZonaRoja(int x, int y) {
  return (x >= 5 && x < 10 && y >= 5 && y < 10);
}

//Función propia con parámetros que SÍ retorna valores.
//Servirá para determinar la inclinación de las líneas.
//Como las líneas blancas están en una intersección entre cuadrados (círculos), esta parte analiza a los 4 círculos que rodean la línea.
boolean tocaZonaRoja(int x, int y) {
  return (estaEnZonaRoja(x, y) || (x > 0 && estaEnZonaRoja(x - 1, y)) || (y > 0 && estaEnZonaRoja(x, y - 1)) || (x > 0 && y > 0 && estaEnZonaRoja(x - 1, y - 1)));
}


/*Este void es para lograr el efecto de zoom al hacer click, por lo que quiero que disminuyan la cantidad de círculos. Ese valor lo da decremento.
 Quiero que el zoom sea más intenso entre los valores (width/6)*4 y (width/6)*5 en x (El rango que ocupan los círculos rojos).
 La intensidad del zoom está determinada por los dos map(), y random() elige un valor aleatorio entre ellos.
 Fuera del rango mencionado, el zoom será menos intenso pero constante, disminuyendo un cículo por lado por cada click.
 Para evitar que el programa utilice números negativos, se estable que si cant - decremento < 1, el valor de cant vuelve a ser 14. Caso contrario, se sigue haciendo zoom.
 La última línea es importante para lograr el efecto, ya que establece el tamaño de los círculos en base a la cantidad. Menos círculos = mayor diámetro y viceversa. */
void mousePressed() {
  float decremento;

  if (mouseX >= 400 && mouseX <= 800) {
    if (mouseX >= (width/6)*4 && mouseX <= (width/6)*5) {

      float minRand = map(mouseX, 550, 650, 3, 3.5);
      float maxRand = map(mouseX, 550, 650, 4, 5);
      decremento = random(minRand, maxRand);
    } else {

      decremento = 1;
    }

    if (cant - decremento < 1) {
      cant = 14;
    } else {
      cant -= decremento;
    }

    tam = (width / 2) / cant;
  }
}

//Al apretar "i" se cambia el sentido de las líneas blancas.
//Al apretar ENTER se reinicia el programa
void keyPressed() {
  if (key=='i' || key=='I') {
    invertir = !invertir;
  }

  if (keyCode == ENTER) {
    cant = 14;
    tam = (width / 2) / cant;
    invertir = false;
  }
}
