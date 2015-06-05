# nSlider
Da la possibilità di creare degli slider con cursori mobili e interattivi in Processing. Utile qualora si volessero creare delle interfacce grafiche per inviare valori ad altri software o ardware tipo Arduino
Obbiettivo futuro è quello di trasformare il progetto in libreria... Ho imparato ieri ad usare Processing!

![](https://raw.githubusercontent.com/AndreaLombardo/nSlider/master/img/Sample.png)

<pre>
Slider mioSlider;

void setup(){
  // Slider(x, y, width, height, fillColor, strokeColor)
  mioSlider = new Slider(20, 20, 30, 120, color(#FFFFFF), color(#000000));
  mioSlider.setRange(0, 255);
  mioSlider.showMonitor();
}

void draw(){
  background(255);
  mioSlider.display();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    mioSlider.startSlide();
  }
}

void mouseDragged() {
  mioSlider.slide();
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    mioSlider.stopSlide();
  }
}
</pre>

