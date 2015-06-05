/*
* nSlider v 1.0
* Slider dinamici per Processing
*
* Autore  : Andrea Lombardo
* Web     : http://www.lombardoandrea.com
* Git     : 
*/

Slider slider_1;
Slider slider_2;
Slider slider_3;
Slider slider_4;

float startW;
float startH;
float spazio;

void setup() {
  noSmooth();
  size(320, 480);
  background(255);
  frameRate(300);
  
  //imposto delle variabili da sfruttare per creare una serie di Slider in sequenza
  spazio = 40.0; // spazio tra uno Slider e l'altro
  startW = 20.0;
  startH = height - (spazio * 3);
  
  //creo il primo slider
  slider_1 = new  Slider(spazio, spazio, startW, startH, color(#FFFFFF), color(165, 60, 42)); //usato il costruttore completo 
  
  //nei prossimi slider sfrutterò i metodi get di Slider per ricavare posizioni e dimensioni e piazzare i nuovi slider nell'area
  
  //per posizionare lo Slider 2 di fianco allo Slider 1, la sua x sarà uguale a quella dello Slider 1 + la dimensione dello Slider 1 + lo spazio che abbiamo deciso debba intercorrere tra gli slider
  float s2_x = slider_1.getX() + slider_1.getW() + spazio;
  float s2_y = spazio;
  slider_2 = new  Slider(s2_x, s2_y, startW, startH, color(247, 119, 20), color(20, 116, 247));
  
  //ho giocato con il posizionamento e le dimensioni per posizionare gli slider 3 e 4
  
  float s3_x = slider_2.getX() + slider_2.getW() + (startW * 2);
  slider_3 = new  Slider(s3_x, spazio, 35, ((startH / 2)-spazio), color(#71C177), color(#407EFF));
  
  float s4_x = s3_x + slider_3.getW() + spazio;
  slider_4 = new  Slider(s4_x, slider_3.getH(), 40, ((startH / 2)), color(247, 119, 20), color(42, 131, 165));
  
  //Do dei nomi agli Slider cosi dà sfruttarli in fase di debug
  slider_1.setNome("S1");
  slider_2.setNome("S2");
  slider_3.setNome("S3");
  slider_4.setNome("S4");
  
  //Lo slider 1, 3 e 4 mostreranno il valore in un monitor
  slider_1.showMonitor();
  slider_3.showMonitor();
  slider_4.showMonitor();
  
  //definisco un range diverso per lo slider 4
  slider_4.setRange(0, 255);
}

void draw() {
  background(255);
  //Abilito la visualizzazione degli Slider
  slider_1.display();
  slider_2.display();
  slider_3.display();
  slider_4.display();

  //Gli Slider 2 e 3 muoveranno il loro cursore in base al valore dello Slider 1
  //ATTENZIONE QUESTO METODO PRESENTA ANCORA DEI PROBLEMI
  slider_2.setVal(slider_1.getVal());
  slider_3.setVal(slider_1.getVal());
  
  //Debug
  println("{"+slider_1._nome+"}- val = "+slider_1.getVal());
  println("{"+slider_1._nome+"}- Y = "+slider_1.getY());
  
  
  println("{"+slider_2._nome+"}- val = "+slider_2.getVal());
  println("{"+slider_2._nome+"}- Y = "+slider_2.getY());
  
  
  println("{"+slider_3._nome+"}- val = "+slider_3.getVal());
  println("{"+slider_3._nome+"}- Y = "+slider_3.getY());
}

void mousePressed() {
  //catturo l'evento mousePressed, ma controllo che il tasto cliccato sia quello sinistro
  if (mouseButton == LEFT) {
    slider_1.startSlide();
    slider_2.startSlide();
    slider_3.startSlide();
    slider_4.startSlide();
  }
}

void mouseDragged() {
  //se le condizioni dettate dal metodo startSlide sono rispettate, muovo i cursori interessati
  slider_1.slide();
  slider_2.slide();
  slider_3.slide();
  slider_4.slide();
  //println("x: "+ mouseX + ", y: " + mouseY);
}

void mouseReleased() {
  //catturo l'evento mouseReleased, ma controllo che il tasto cliccato sia quello sinistro, quindi stoppo il movimento dei cursori
  if (mouseButton == LEFT) {
    slider_1.stopSlide();
    slider_2.stopSlide();
    slider_3.stopSlide();
    slider_4.stopSlide();
  }
}

