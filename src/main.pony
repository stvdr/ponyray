use "math"
use "files"
use "sampling"

actor Main
  var _env: Env

  new create(env: Env) =>
    _env = env

    let vp: ViewPlane = ViewPlane(1.0, 800, 800, 1.0, SinglePixelSampler)

    let w: World = World(vp)
    w.addObject(SimpleSphere(Point3(0, 0, 0), 250.0, RGBColor(1.0, 0.0, 0.0)))
    w.addObject(SimpleSphere(Point3(200, 0, 0), 75.0, RGBColor(0.0, 1.0, 0.0)))
    w.addObject(SimpleSphere(Point3(-300, 250, -40), 125, RGBColor(0.0, 1.0, 1.0)))

    //let tracer: Tracer = SimpleSphereTracer(w)
    let tracer: Tracer = MultiObjectTracer(w)
    let writer: ImageWriter = PPMImageWriter(_env)

    try
      match w.render(tracer)
      | let img: Image =>
        writer.writeImage(img)
      | None => _env.out.print("Received None")
      end
    else
      _env.err.print("Failed to render and write image.")
    end
