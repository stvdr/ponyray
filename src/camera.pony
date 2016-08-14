use "collections"
use "math"

trait Camera
  fun render_scene(world: World, tracer: Tracer): (Image | None)

class PinholeCamera is Camera
  let eye: Point3
  let lookAt: Point3
  let up: Vec3
  let vpDist: F64

  var u: Vec3
  var v: Vec3
  var w: Vec3

  new create(eye': Point3, lookAt': Point3, viewPlaneDist: F64) =>
    up = Vec3(0.0, 1.0, 0.0)
    eye = eye'
    lookAt = lookAt'
    vpDist = viewPlaneDist
    
    w = eye.subPoint(lookAt).normalize()
    u = (up.cross(w)).normalize()
    v = w.cross(u)

  fun render_scene(world: World, tracer: Tracer): (Image | None) =>
    var img: Image = Image(world.viewPlane.horizontal.usize(), world.viewPlane.vertical.usize())

    try
      for r in Range[USize](0, world.viewPlane.vertical.usize()) do
        for c in Range[USize](0, world.viewPlane.horizontal.usize()) do
          var pixelColor = RGBColors.black()

          for s in Range[USize](0, world.viewPlane.sampler.getNumSamples()) do
            let sample: Point2 = world.viewPlane.sampler.getSample()
            var ppx = world.viewPlane.pixelSize * (c.f64() - ((0.5 * world.viewPlane.horizontal.f64()) + sample.x))
            var ppy = world.viewPlane.pixelSize * (r.f64() - ((0.5 * world.viewPlane.vertical.f64()) + sample.y))

            var ray = Ray3(eye, (((u*ppx) + (v*ppy)) - (w*vpDist)).normalize())

            pixelColor = pixelColor + tracer.trace(ray)
          end

          let color: RGBColor = pixelColor.divScalar(world.viewPlane.sampler.getNumSamples().f64())
          img.setPixel(r, c, (color.r*255).u8(), (color.g*255).u8(), (color.b*255).u8())

        end
      end

      img
    else
      return None
    end
