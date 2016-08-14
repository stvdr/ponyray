class val RGBColor is Equatable[RGBColor]
  let r: F64
  let g: F64
  let b: F64

  new val create(r': F64, g': F64, b': F64) =>
    r = r'
    g = g'
    b = b'

  fun add(c: RGBColor): RGBColor =>
    RGBColor(r+c.r, g+c.g, b+c.b)

  fun mul(c: RGBColor): RGBColor =>
    RGBColor(r*c.r, g*c.g, b*c.b)

  fun divScalar(s: F64): RGBColor =>
    RGBColor(r/s, g/s, b/s)

  fun mulScalar(s: F64): RGBColor =>
    RGBColor(r*s, g*s, b*s)

  fun pow(s: F64): RGBColor =>
    RGBColor(r.pow(s), g.pow(s), b.pow(s))

  fun eq(c: RGBColor): Bool =>
    (r==c.r) and (g==c.g) and (b==c.b)

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
