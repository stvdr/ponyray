use "files"
use "collections"

class Image
  var data: Array[U8]
  let width: USize
  let height: USize

  new create(width': USize, height': USize) =>
    width = width'
    height = height'
    data = Array[U8].undefined(width'*height'*3)

  fun ref setPixel(row: USize, col: USize, red: U8, green: U8, blue: U8) ? =>
    data.update((((width*row) + col)*3).usize(), red)
    data.update(((((width*row) + col)*3) + 1).usize(), green)
    data.update(((((width*row) + col)*3) + 2).usize(), blue)

  fun getPixel(row: USize, col: USize): (U8, U8, U8) ? =>
    ( data(((width*row) + col)*3),
      data((((width*row) + col)*3) + 1),
      data((((width*row) + col)*3) + 2) )

interface ImageWriter
  fun writeImage(img: Image) ?

class PPMImageWriter is ImageWriter
  let _env: Env

  new create(env: Env) =>
      _env = env

  fun writeImage(img: Image) ? =>
    _env.out.print("P3")
    _env.out.print(img.width.string() + " " + img.height.string())
    _env.out.print("255")

    if false then
      error
    end

    for row in Range[USize](0, img.height) do
      for col in Range[USize](0, img.width) do
          (var r: U8, var g: U8, var b: U8) = img.getPixel(row, col)
          _env.out.write(r.string() + " " + g.string() + " " + b.string() + " " )
      end
      _env.out.print("")
    end
