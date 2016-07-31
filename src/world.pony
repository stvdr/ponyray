use "collections"
use "math"

class World
  let viewPlane: ViewPlane
  let backgroundColor: RGBColor
  //let tracer: Tracer
  let sphere: SimpleSphere

  new create() =>
    viewPlane = ViewPlane(1.0, 800, 800, 1.0)
    backgroundColor = RGBColors.black()
    sphere = SimpleSphere(Point3(0, 0, 0), 85.0)

  fun render(): (Image | None) =>
    let zw: F64 = 100.0
    var x: F64 = 0
    var y: F64 = 0
    var ray: Ray3 = Ray3(Point3(0, 0, zw), Vec3(0,0,-1))

    var img: Image = Image(viewPlane.horizontal.usize(), viewPlane.vertical.usize())

    try
      for r in Range[USize](0, viewPlane.vertical.usize()) do
        for c in Range[USize](0, viewPlane.horizontal.usize()) do
          x = viewPlane.pixelSize * (c.f64() - (0.5 * (viewPlane.horizontal - 1).f64()))
          y = viewPlane.pixelSize * (r.f64() - (0.5 * (viewPlane.vertical - 1).f64()))

          ray = Ray3(Point3(x, y, zw), Vec3(0, 0, -1))

          var hit: ShadeRec = sphere.hit(ray)
          if hit.isHit then
            img.setPixel(r, c, 255, 0, 0)
          else
            img.setPixel(r, c, 0, 0, 0)
          end
        end
      end

      img
    else
      return None
    end
