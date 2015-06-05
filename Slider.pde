/*
 * nSlider v 1.0
 * Slider dinamici per Processing
 *
 * Autore  : Andrea Lombardo
 * Web     : http://www.lombardoandrea.com
 * Git     : 
 */

public class Slider extends Base {

  //Componenti
  Cursore cursore;
  Monitor monitor;

  //proprietà Slider
  private float maxVal;
  private float minVal;
  private float curVal;
  private boolean canSlide;
  private boolean withMonitor;

  //Proprietà Cursore
  private float curW;
  private float curH;
  private float curX;
  private float curY;

  //Proprietà Monitor
  private float monW;
  private float monH;
  private float monX;
  private float monY;

  /**Costruttore slider*/
  Slider(float x, float y, float w, float h, color f, color s) {
    super( x, y, w, h, f, s);

    //inizializzo variabili
    canSlide = false;
    withMonitor = false;

    //imposto range di default
    setRange(0, 100);

    //calcolo dimensione del bordo in proporzione alle dimensioni dello slider
    _strokeWidth = _w / 8;

    //calcolo dimensioni e posiziono il cursore a metà scala
    curW = _w + (_w / 2);
    curH = _w / 2;
    curX = _x - (_w / 4);
    curY = ((_h / 2) + _y) - (curH / 2);

    //creo il cursore e lo posiziono in base ai calcoli fatti qui sopra
    cursore = new Cursore(curX, curY, curW, curH, _stroke, _fill);

    //calcolo posizione monitor (TODO: possibilità di personalizzare il monitor in posizione dimensioni e colori)
    monW = curW;
    monH = monW;
    monX = curX;
    monY = this.getY() + this.getH() + cursore.getH();

    //creo il monitor, non sarà visibile se non verrà chiamato il metodo showMonitor()
    monitor = new Monitor(monX, monY, monW, monH, _fill, _stroke);
  }

  /**Mostrerà il monitor contenente il valore dello slider*/
  public void showMonitor() {
    withMonitor = true;
  }

  /**Non mostrare il monitor*/
  public void hideMonitor() {
    withMonitor = false;
  }

  /**Imposta il valore minimo dello slider*/
  public void setMinVal(float min) {
    minVal = min;
  }

  /**Imposta il valore massimo dello slider*/
  public void setMaxVal(float max) {
    maxVal = max;
  }

  /**Imposta il valore minimo e massimo dello slider*/
  public void setRange(float min, float max) {
    setMinVal(min);
    setMaxVal(max);
  }

  /**
   *Determina se la posizione del mouse si trova all'interno del cursore e abilita quindi il suo scorrimento.
   *Questo metodo va chiamato nell'evento mousePressed()
   */
  public void startSlide() {
    //controlla se mouse è dentro l' area del cursore
    if ((mouseX >= cursore.getX()) && (mouseX <= (cursore.getX() + cursore.getW()))) {
      if ((mouseY >= cursore.getY()) && (mouseY <= (cursore.getY() + cursore.getH()))) {
        canSlide = true;
      } else {
        canSlide = false;
      }
    } else {
      canSlide = false;
    }
  }

  /**
   *Se il metodo startSlide ha stabilito che il puntatore del mouse si trova all'interno del cursore, cambierò la sua y in base a quella del mouse.
   *Questo metodo va chiamato nell'evento mouseDragged()
   */
  public void slide() {
    if (canSlide) { 
      if ((mouseY >= (this.getY() - (cursore.getH()/2)))&&(mouseY <= (this.getY()+this.getH()) - cursore.getH() /2)) {    
        if (mouseY > 0) {
          cursore.setY(mouseY);// - (cursore.getH()/2));
        }
        println("Valore: " + this.getVal());
      }
    }
  }

  /**Metodo chiamato nell'evento mouseReleased(). Imposta canSlide a false, e disabilita quindi lo spostamento del cursore.*/
  public void stopSlide() {
    canSlide = false;
  }

  /**
   *Restituisce il valore dello slider in base alle dimensioni e al range di valori impostati.
   **/
  public float getVal() {
    float computedMin = this.getY() - (cursore.getH() / 2);
    float computedMax = this.getH() + this.getY() - (cursore.getH() / 2);

    //eseguo mappatura
    curVal = map(cursore.getY(), computedMin, computedMax, this.minVal, this.maxVal);

    //l'asse delle y del piano di Processing, si muove in maniera inversamente proporzionale al funzionamento di uno slider convenzionale (salgo = aumento, scendo = diminuisco)
    //per ottenere il risultato, inverto il meccanismo e ricavo il valore assoluto (senza segno) che sarà il nuovo valore dello slider.
    curVal = abs(curVal - this.maxVal - this.minVal);

    return curVal;
  };

  /************************************************************/
  /**********QUESTO METODO ANCORA NON FUNZIONA BENE************/
  /************************************************************/
  /**DOVREBBE SETTARE IL VALORE DELLO SLIDER E POSIZIONARE IL CURSORE IN BASE AL VALORE SETTATO*/
  public void setVal(float val) {

    //DEBUG
    println("{"+_nome+"}-1 val = " + getVal());
    println("{"+_nome+"}-1 Y = " + cursore.getY());

    //curVal = val;
    float newY = abs((getVal() * cursore.getY() ) / val);

    cursore.setY(newY);

    //DEBUG
    println("{"+_nome+"}-2 val = " + getVal());
    println("{"+_nome+"}-2 Y = " + newY);
  };

  /**Mostro lo Slider*/
  protected void display() {
    super.display();
    cursore.display();

    monitor.setText(nf(getVal(), 1, 1));
    if (withMonitor) {
      monitor.display();
    }
  }
}

