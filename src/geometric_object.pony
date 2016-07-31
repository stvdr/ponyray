use "math"

// primitive GeometricObject
//   //new create() => GeometricObject
//
//   fun apply(r: Ray3): (Bool | ShadeRec) =>
//     true

trait GeometricObject
  fun hit(r: Ray3): ShadeRec
  fun color(): RGBColor

type NonePoint is (Point3 | None)
type NoneColor is (RGBColor | None)
type NoneVector3 is (Vec3 | None)

class val ShadeRec
  let isHit: Bool
  let hitPoint: NonePoint
  let hitColor: NoneColor
  let hitNormal: NoneVector3

  new val create(isHit': Bool = false,
                  hitPoint': NonePoint = None,
                  hitColor': NoneColor = None,
                  hitNormal': NoneVector3 = None) =>
    isHit= isHit'
    hitPoint = hitPoint'
    hitColor = hitColor'
    hitNormal = hitNormal'

class SimpleSphere is GeometricObject
  let center: Point3
  let radius: F64

  new create(center': Point3, radius': F64) =>
    center = center'
    radius = radius'

  fun hit(r: Ray3): ShadeRec =>
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
        return ShadeRec(
          true,
          r.o + (r.d * t),
          RGBColor(1.0, 0.0, 0.0),
          (temp + (r.d*t)) / radius)
      end
    end

    // Default to no hit
    ShadeRec()

  fun color(): RGBColor =>
    RGBColors.red()
