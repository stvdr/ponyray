use "sampling"

class ViewPlane
  let pixelSize: F64
  let horizontal: U32
  let vertical: U32
  let gamma: F64
  let sampler: Sampler

  new create(pixelSize': F64, horizontal': U32, vertical': U32, gamma': F64, sampler': Sampler) =>
    pixelSize = pixelSize'
    horizontal = horizontal'
    vertical = vertical'
    gamma = gamma'
  	sampler = sampler'
