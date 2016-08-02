class val Point3 is (Equatable[Point3] & Stringable)
  let x: F64
  let y: F64
  let z: F64

  new val create(x': F64, y': F64, z': F64) =>
    x = x'
    y = y'
    z = z'

  fun eq(p: Point3): Bool =>
    (x == p.x) and (y == p.y) and (z == p.z)

  fun ne(p: Point3): Bool =>
    not eq(p)

  fun string(fmt: FormatSettings = FormatSettingsDefault): String iso^ =>
	   ("(" + x.string() + "," + y.string() + "," + z.string() + ")").string(fmt)

  fun add(v: Vec3): Point3 =>
    Point3(x + v.x, y + v.y, z + v.z)

  fun sub(v: Vec3): Point3 =>
    Point3(x - v.x, y - v.y, z - v.z)

  fun subPoint(p: Point3): Vec3 =>
    Vec3(x - p.x, y - p.y, z - p.z)

  fun neg(): Point3 =>
    Point3(-x, -y, -z)

class val Point2 is (Equatable[Point2] & Stringable)
  let x: F64
  let y: F64

  new val create(x': F64, y': F64) =>
    x = x'
    y = y'

  fun eq(p: Point2): Bool =>
    (x == p.x) and (y == p.y)

  fun ne(p: Point2): Bool =>
    not eq(p)

  fun string(fmt: FormatSettings = FormatSettingsDefault): String iso^ =>
	   ("(" + x.string() + "," + y.string() + ")").string(fmt)
