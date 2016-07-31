use "math"

class Renderer
  let _viewPlane: ViewPlane

  new create(viewPlane': ViewPlane) =>
    _viewPlane = viewPlane'

  // fun render(): Array[RGBColor] =>
    // var x: F64 = -(_viewPlane.width() / 2.0)
    // var y: F64 = -(_viewPlane.height() / 2.0)
    //
    // let g: GeometricObject = GeometricObject
    //
    // while x <= 500.0 do
    //   y = -500.0
    //   while y <= 500.0 do
    //       // draw ray from camera position (0,0) to (x,y)
    //       var r: Ray3 = Ray3(Point3(x, y, 0), Vec3(x,y,1.0))
    //
    //       if g(r) then
    //
    //       end
    //
    //
    //       y = y + 1
    //   end
    //   x = x + 1
    // end
