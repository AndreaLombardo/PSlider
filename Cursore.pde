/*
 * PSlider v 1.0
 * Slider dinamici in Processing
 *
 * Autore  : Andrea Lombardo
 * Web     : http://www.lombardoandrea.com
 * Git     : https://github.com/AndreaLombardo/PSlider
 */

class Cursore extends Base {
  Cursore(float x, float y, float w, float h, color f, color s) {
    super( x, y, w, h, f, s);
    _strokeWidth = _w / 16;
  }
}

