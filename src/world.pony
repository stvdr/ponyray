use "collections"
use "math"
use "geometry"
use "material"

class World
  let viewPlane: ViewPlane
  let backgroundColor: RGBColor
  let objects: Array[GeometricObject] = Array[GeometricObject]

  new create(viewPlane': ViewPlane) =>
    viewPlane = viewPlane'
    backgroundColor = RGBColors.black()

  fun ref addObject(obj: GeometricObject) =>
    objects.push(obj)
