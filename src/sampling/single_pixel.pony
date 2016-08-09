use "math"

class SinglePixelSampler is Sampler
  fun getNumSamples(): USize => 1

  fun ref getSample(): Point2 =>
    Point2(0.5, 0.5)
