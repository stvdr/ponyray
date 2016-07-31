class val Ray3 is (Equatable[Ray3] & Stringable)
  let o: Point3
  let d: Vec3

  new val create(origin': Point3, direction': Vec3) =>
      o = origin'
      d = direction'

  fun eq(r: Ray3): Bool =>
    (o == r.o) and (d == r.d)

  fun ne(r: Ray3): Bool =>
    not eq(r)

  fun string(fmt: FormatSettings = FormatSettingsDefault): String iso^ =>
    ("[origin: " + o.string(fmt) + " direction: " + d.string(fmt) + "]").string(fmt)
