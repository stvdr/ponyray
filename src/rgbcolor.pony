class val RGBColor is Equatable[RGBColor]
  let _r: F64
  let _g: F64
  let _b: F64

  new val create(r': F64, g': F64, b': F64) =>
    _r = r'
    _g = g'
    _b = b'

  fun add(c: RGBColor): RGBColor =>
    RGBColor(_r+c._r, _g+c._g, _b+c._b)

  fun mul(c: RGBColor): RGBColor =>
    RGBColor(_r*c._r, _g*c._g, _b*c._b)

  fun divScalar(s: F64): RGBColor =>
    RGBColor(_r/s, _g/s, _b/s)

  fun mulScalar(s: F64): RGBColor =>
    RGBColor(_r*s, _g*s, _b*s)

  fun pow(s: F64): RGBColor =>
    RGBColor(_r.pow(s), _g.pow(s), _b.pow(s))

  fun eq(c: RGBColor): Bool =>
    (_r==c._r) and (_g==c._g) and (_b==c._b)

  fun ne(c: RGBColor): Bool =>
    not eq(c)


primitive RGBColors
  fun red(): RGBColor =>
    RGBColor(1.0, 0.0, 0.0)

  fun green(): RGBColor =>
    RGBColor(0.0, 1.0, 0.0)

  fun blue(): RGBColor =>
    RGBColor(0.0, 0.0, 1.0)

  fun black(): RGBColor =>
    RGBColor(0.0, 0.0, 0.0)

  fun white(): RGBColor =>
    RGBColor(1.0, 1.0, 1.0)
