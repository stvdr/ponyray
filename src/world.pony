use "collections"
use "math"
use "random"
use "time"

class World
  let viewPlane: ViewPlane
  let backgroundColor: RGBColor
  let objects: Array[GeometricObject] = Array[GeometricObject]

  new create(viewPlane': ViewPlane) =>
    viewPlane = viewPlane'
    backgroundColor = RGBColors.black()

  fun ref addObject(obj: GeometricObject) =>
    objects.push(obj)

  fun ref render(tracer: Tracer): (Image | None) =>
    let n: USize = 16 // sqrt of the # of samples per pixel (n^2 samples total)
    let zw: F64 = 100.0
    var x: F64 = 0
    var y: F64 = 0
    var ray: Ray3 = Ray3(Point3(0, 0, zw), Vec3(0,0,-1))

    var ppx: F64 = 0
    var ppy: F64 = 0

    var img: Image = Image(viewPlane.horizontal.usize(), viewPlane.vertical.usize())

    let mt: MT = MT(Time.nanos())

    try
      for r in Range[USize](0, viewPlane.vertical.usize()) do
        for c in Range[USize](0, viewPlane.horizontal.usize()) do
          var pixelColor = RGBColors.black()

          for s in Range[USize](0, viewPlane.sampler.getNumSamples()) do
            let sample: Point2 = viewPlane.sampler.getSample()
            ppx = viewPlane.pixelSize * (c.f64() - ((0.5 * viewPlane.horizontal.f64()) + sample.x))
            ppy = viewPlane.pixelSize * (r.f64() - ((0.5 * viewPlane.vertical.f64()) + sample.y))
            ray = Ray3(Point3(ppx, ppy, zw), Vec3(0, 0, -1))
            pixelColor = pixelColor + tracer.trace(ray)
          end

          let color: RGBColor = pixelColor.divScalar(viewPlane.sampler.getNumSamples().f64())
          img.setPixel(r, c, (color.r*255).u8(), (color.g*255).u8(), (color.b*255).u8())

        end
      end

      img
    else
      return None
    end
