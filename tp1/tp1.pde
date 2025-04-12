PImage img;
void setup(){
  size(800,400);
  img = loadImage("BOBESPONJA.jpeg");
}

void draw(){
  background(112,145,154);
  image(img,0,0,400,400);
  
  //pared de fondo
  fill(129,220,245);
  stroke(129,220,245);
  rect(400,0,400,295);
  
  //columnas de la pared de fondo
  fill(57,156,216);
  stroke(57,156,216);
  rect(440,0,20,295);
  rect(500,0,20,295);
  rect(560,0,20,295);
  rect(620,0,20,295);
  rect(680,0,20,295);
  rect(740,0,20,295);
  
  //objeto decorativo de la pared de fondo
  stroke(0);
  strokeWeight(5);
  noFill();
  bezier(410,25,410,135,420,285,445,155);
  stroke(8,118,15);
  fill(8,118,15);
  triangle(400,0,400,20,480,0);
  stroke(39,115,142);
  fill(39,115,142);
  triangle(400,20,400,50,480,0);
  
  //brazos de Bob Esponja
  fill(255,236,59);
  stroke(0);
  strokeWeight(2);
  rect(505,249,10,80);
  rect(675,242,10,87);
  
  //manos de Bob Esponja
  rect(505,305,30,30);
  line(515,320,515,335);
  line(525,320,525,335);
  rect(655,300,30,30);
  line(665,315,665,330);
  line(675,315,675,330);
  
  //mangas de Bob Esponja
  fill(255);
  stroke(0);
  triangle(500,250,520,250,506,200);
  triangle(675,245,695,240,682,200);
  
  //cuerpo de Bob Esponja
  fill(255,236,59);
  stroke(0);
  quad(485,25,710,20,680,235,510,240);
  
  //circulos del cuerpo de Bob Esponja
  fill(179,198,138);
  ellipseMode(CORNER);
  ellipse(510,45,21,29);
  ellipse(523,200,21,29);
  ellipse(655,173,22,32);
  ellipse(500,80,12,22);
  ellipse(523,175,7,10);
  ellipse(655,217,9,12);
  ellipse(680,58,9,16);
  
  //boca de Bob Esponja
  noFill();
  bezier(515,145,565,200,635,200,686,145);
  fill(255);
  quad(575,183,592,186,592,198,575,198);
  quad(607,186,624,183,624,198,607,198);
  
  //ojos de Bob Esponja
  line(548,70,548,80);
  line(563,65,563,80);
  line(578,70,578,80);
  line(620,70,620,80);
  line(635,65,635,80);
  line(650,70,650,80);
  fill(255);
  ellipseMode(CENTER);
  ellipse(565,115,70,75);
  ellipse(635,115,70,75);
  fill(75,190,211);
  ellipse(576,114,21,22);
  ellipse(625,113,21,22);
  fill(0);
  ellipse(575,114,8,8);
  ellipse(624,113,8,8);
  
  //nariz de Bob Esponja
  fill(255,236,59);
  bezier(595,144,587,98,624,133,600,155);
  
  //camisa de Bob Esponja
  fill(255);
  stroke(0);
  quad(510,240,680,235,680,265,510,270);
  noFill();
  triangle(560,238,600,238,585,255);
  triangle(600,238,640,236,615,255);
  
  //zapatos de Bob Esponja (relleno)
  //zapato izquierdo
  noStroke();
  fill(206,179,108);
  ellipse(568,367,44,46);
  triangle(548,370,555,388,535,393);
  //zapato derecho
  ellipse(623,369,42,45);
  
  //piernas de Bob Esponja
  fill(255,236,59);
  stroke(0);
  strokeWeight(2);
  rect(564,275,10,80);
  rect(618,275,10,80);
  //medias bob esponja
  fill(255);
  rect(564,320,10,35);
  rect(618,320,10,35);
  
  //zapatos de Bob Esponja (borde de los zapatos)
  //zapato izquierdo
  stroke(0);
  fill(203,157,39);
  bezier(519,340,500,325,480,410,541,392);
  fill(206,179,108);
  bezier(537,392,523,369,495,310,551,366);
  bezier(546,359,552,350,558,345,564,345);
  bezier(576,345,592,350,589,379,581,388);
  bezier(538,393,552,389,561,385,568,378);
  fill(203,157,39);
  triangle(567,379,569,390,557,389);
  line(570,389,583,389);
  //zapato derecho
  stroke(0);
  fill(203,157,39);
  bezier(636,393,702,400,680,345,658,341);
  fill(206,179,108);
  bezier(635,393,651,365,675,310,636,363);
  bezier(635,393,629,387,623,382,619,378);
  bezier(629,348,634,350,637,351,641,356);
  bezier(615,346,600,352,597,369,606,386);
  line(606,386,619,389);
  fill(203,157,39);
  triangle(620,390,620,377,628,387);
  
  //pantalon de Bob Esponja
  fill(142,105,10);
  stroke(0);
  quad(510,270,680,265,680,305,510,310);
  
  //cinturon de Bob Esponja
  fill(0);
  rect(515,275,25,8);
  rect(555,275,25,8);
  rect(615,273,25,8);
  rect(650,273,25,8);
  
  //corbata de Bob Esponja
  fill(255,0,0);
  stroke(0);
  quad(600,238,590,270,600,285,610,270);
  
  
  
  println("x:");
  println(mouseX);
  println("y:");
  println(mouseY);
  
 }
