use "math"
use "material"

primitive NoHit


class val Hit
  let point: Point3
  let color: RGBColor
  let normal: Vec3
  let t: F64

  new val create(t': F64 = 0.0, point': Point3, color': RGBColor, normal': Vec3) =>
    t = t'
    point = point'
    color = color'
    normal = normal'


type HitResult is (Hit | NoHit)


trait GeometricObject
  fun hit(r: Ray3): HitResult

