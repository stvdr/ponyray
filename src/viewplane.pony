class ViewPlane
  let pixelSize: F64
  let horizontal: U32
  let vertical: U32
  let gamma: F64

  new create(pixelSize': F64, horizontal': U32, vertical': U32, gamma': F64) =>
    // TODO: verify that the horizontal width is a multiple of 2

    pixelSize = pixelSize'
    horizontal = horizontal'
    vertical = vertical'
    gamma = gamma'
