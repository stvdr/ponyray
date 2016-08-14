use "math"
use "geometry"
use "material"

interface Tracer
  fun trace(ray: Ray3): RGBColor

class MultiObjectTracer is Tracer
  let _world: World
  new create(world: World) =>
    _world = world

  fun trace(ray: Ray3): RGBColor =>
    var curResult: HitResult = NoHit

    for o in _world.objects.values() do
      let newResult: HitResult = o.hit(ray)

      match (newResult, curResult)
      | (let n: Hit, let c: Hit) =>
        if n.t < c.t then
          curResult = n
        end
      | (let n: Hit, NoHit) =>
        curResult = n
      end
    end

    match curResult
    | let h: Hit =>
      h.color
    else
      _world.backgroundColor
    end
