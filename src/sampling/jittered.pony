use "random"
use "time"
use "math"

class JitteredSampler is Sampler
  let samples: USize
  let samplesSqrt: F64
  let percentPerStratum: F64
  let mt: MT

  var curSamplePos: USize = -1

  new create(samples': USize) =>
    samplesSqrt = samples'.f64().sqrt().usize().f64()
    samples = (samplesSqrt * samplesSqrt).usize()
    percentPerStratum = 1.0 / samplesSqrt
    mt = MT(Time.nanos())

  fun getNumSamples(): USize => samples

  fun ref getSample(): Point2 =>
    curSamplePos = (curSamplePos+1) % samples
    
    let row: F64 = (curSamplePos.f64() / samplesSqrt).usize().f64()*percentPerStratum
    let col: F64 = (curSamplePos % samplesSqrt.usize()).f64()*percentPerStratum

    Point2(col + (mt.real() / samplesSqrt), row + (mt.real() / samplesSqrt))
