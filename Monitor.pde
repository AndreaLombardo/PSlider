/*
* nSlider v 1.0
* Slider dinamici per Processing
*
* Autore  : Andrea Lombardo
* Web     : http://www.lombardoandrea.com
* Git     : 
*/

class Monitor extends Base {
  private String _text;
  private PFont _font;
  private int _textSize;
  Monitor(float x, float y, float w, float h, color f, color s) {
    super( x, y, w, h, f, s);
    _strokeWidth = _w / 12;
    _text = "";
    textAlign(CENTER);
    _textSize = parseInt(this._strokeWidth * 3);
    _font = createFont("Rockwell-15.vlw", _textSize);
  }

  protected void setText(String text) {
    _text = text;
  }

  protected void display() {
    super.display();
    smooth();
    textFont(_font);
    fill(this._stroke);
    text(this._text, this.getX(), this.getY() + (_textSize * 1.5), this.getW(), this.getH()); 
    noSmooth();
  }
}
