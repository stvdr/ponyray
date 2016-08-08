use "random"
use "time"
use "math"

interface Sampler
  fun ref getSample(): Point2
  fun getNumSamples(): USize
