use "math"
use "files"

actor Main
  var _env: Env

  new create(env: Env) =>
    _env = env

    let w: World = World
    let writer: ImageWriter = PPMImageWriter(_env)

    try
      match w.render()
      | let img: Image =>
        writer.writeImage(img)
      | None => _env.out.print("Received None")
      end
    else
      _env.err.print("Failed to render and write image.")
    end

