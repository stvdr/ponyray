use "math"

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

class val SimpleSphere is GeometricObject
  let center: Point3
  let radius: F64
  let color: RGBColor

  new create(center': Point3, radius': F64, color': RGBColor) =>
    center = center'
    radius = radius'
    color = color'

  fun hit(r: Ray3): HitResult =>
    // TODO: Check for intersection between ray and the sphere
    //ShadeRec()

    var t: F64 = 0.0
    var temp: Vec3 = r.o.subPoint(center)
    var a: F64 = r.d.dot(r.d)
    var b: F64 = (r.d.dot(temp)) * 2.0
    var c: F64 = (temp.dot(temp)) - (radius * radius)
    var disc: F64 = (b * b) - (4.0 * a * c)

    if disc >= 0.0 then
      let e: F64 = disc.sqrt()
      let denom: F64 = 2.0 * a
      t = (-b - e) / denom

      if t <= 0.0001 then
        t = (-b + e) / denom
      end

      if t > 0.0001 then
        return Hit(t,
          r.o + (r.d * t),
          color,
          (temp + (r.d*t)) / radius)
      end
    end

    // Default to no hit
    NoHit
