use "random"
use "time"
use "math"

// class RandomSampler is Sampler
//   var samples: U32
//   var jump: U64
//   let sets: U32 = 83
// 
//   fun ref setNumberOfSamples(n: U32) =>
//     samples = n
//
//   fun ref getNextSample(): Point2 =>
//     count = count +
//     if (count % samples == 0) then
//       mt = MT(Time.nanos())
//       jump = mt.u32() % sets
//
//     samples(jump + (count % samples))
