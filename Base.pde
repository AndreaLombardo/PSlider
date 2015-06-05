/*
 * PSlider v 1.0
 * Slider dinamici in Processing
 *
 * Autore  : Andrea Lombardo
 * Web     : http://www.lombardoandrea.com
 * Git     : https://github.com/AndreaLombardo/PSlider
 */

public class Base {
  protected float _x; //Coord X
  protected float _y; //Coord Y
  protected float _w; //Larghezza
  protected float _h; //Altezza
  color _stroke; //Colore di Stroke
  color _fill; //Colore di Sfondo
  float _strokeWidth; // Dimensione Linea

  String _nome;

  /**Costruttore dettagliato Base*/
  Base(float x, float y, float w, float h, color fill, color stroke) {
    setX(x);
    setY(y);
    setFillColor(fill);
    setStrokeColor(stroke);
    setW(w);
    setH(h);
    setNome("Senza nome");
  }

  /**Imposta il valore di _x*/
  protected void setX(float x) {
    _x = x;
  }

  /**Restituisce il valore di _x*/
  public float getX() {
    return _x;
  }

  /**Imposta il valore di _y*/
  protected void setY(float y) {
    _y = y;
  }

  /**Restituisce il valore di _y*/
  public float getY() {
    return _y;
  }

  /**Imposta il valore di _w*/
  protected void setW(float w) {
    _w = w;
  }

  /**Restituisce il valore di _w*/
  public float getW() {
    return _w;
  }

  /**Imposta il valore di _h*/
  protected void setH(float h) {
    _h = h;
  }

  /**Restituisce il valore di _h*/
  public float getH() {
    return _h;
  }

  /**Imposta il valore di _strokeWidth*/
  protected void setStrokeWidth(float strokeWidth) {
    _strokeWidth = strokeWidth;
  }

  /**Restituisce il valore di _strokeWidth*/
  public float getStrokeWidth() {
    return _strokeWidth;
  }

  /**Imposta il colore della linea*/
  protected void setStrokeColor(color strokeColor) {
    _stroke = strokeColor;
  } 

  /**Restituisce il valore di _stroke, colore della linea*/
  public color getStrokeColor() {
    return _stroke;
  }

  /**Imposta il colore di riempimento*/
  protected void setFillColor(color fill) {
    _fill = fill;
  }
  /**Restituisce il valore di _fill, colore di sfondo*/
  public color getFillColor() {
    return _fill;
  }

  /**Imposta il valore di _nome*/
  public void setNome(String nome) {
    _nome = nome;
  }

  /**Imposta il valore di _nome, il nome del componente*/
  public String getNome() {
    return _nome;
  }

  /**Disegna il componente*/
  protected void display() {
    stroke(_stroke);
    strokeWeight(_strokeWidth);
    fill(_fill);
    rect(_x, _y, _w, _h);
  }
}

