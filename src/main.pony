use "math"
use "files"
use "sampling"
use "geometry"
use "material"

actor Main
  var _env: Env

  new create(env: Env) =>
    _env = env

    //let vp: ViewPlane = ViewPlane(1.0, 1600, 1200, 1.0, RandomSampler(16))
    //let vp: ViewPlane = ViewPlane(1.0, 1600, 1200, 1.0, SinglePixelSampler)
    
    let writer: ImageWriter = PPMImageWriter(_env)
    let vp: ViewPlane = ViewPlane(1.0, 800, 600, 1.0, JitteredSampler(16))
    let w: World = World(vp)
    let tracer: Tracer = MultiObjectTracer(w)
    let cam: Camera = PinholeCamera(Point3(0, 0, 500), Point3(0.0, 0.0, 0.0), 500)

    w.addObject(Sphere(Point3(-45, 45, 40), 50.0, RGBColor(1.0, 0.0, 0.0)))
    
    try
      match cam.render_scene(w, tracer)
      | let img: Image =>
        writer.writeImage(img)
      | None => _env.out.print("Received None")
      end
    else
      _env.err.print("Failed to render and write image.")
    end
