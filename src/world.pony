use "collections"
use "math"

class World
  let viewPlane: ViewPlane
  let backgroundColor: RGBColor
  //let tracer: Tracer
  //let sphere: SimpleSphere
  let objects: Array[GeometricObject] = Array[GeometricObject]

  new create() =>
    viewPlane = ViewPlane(1.0, 800, 800, 1.0)
    backgroundColor = RGBColors.black()
    //sphere = SimpleSphere(Point3(0, 0, 0), 250.0)
    //tracer = SimpleSphereracer
    //tracer = SimpleSphereTracer(this)

  fun ref addObject(obj: GeometricObject) =>
    objects.push(obj)

  fun render(tracer: Tracer): (Image | None) =>
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
          let color: RGBColor = tracer.trace(ray)
          img.setPixel(r, c, (color.r*255).u8(), (color.g*255).u8(), (color.b*255).u8())
        end
      end

      img
    else
      return None
    end
