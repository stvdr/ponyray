use "random"
use "time"
use "math"

class RandomSampler is Sampler
  let samples: USize
  let mt: MT

  new create(samples': USize) =>
    samples = samples'
    mt = MT(Time.nanos())

  fun getNumSamples(): USize => samples

  fun ref getSample(): Point2 =>
    Point2(mt.real(), mt.real())
