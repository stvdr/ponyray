use "collections"
use "math"

class World
  let viewPlane: ViewPlane
  let backgroundColor: RGBColor
  let objects: Array[GeometricObject] = Array[GeometricObject]

  new create(viewPlane': ViewPlane) =>
    viewPlane = viewPlane'
    backgroundColor = RGBColors.black()

  fun ref addObject(obj: GeometricObject) =>
    objects.push(obj)
