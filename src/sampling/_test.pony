use "collections"
use "math"
use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_Random)

class _Random is UnitTest
  fun name(): String => "Jittered sampling samples properly"

  fun apply(h: TestHelper) =>
    for r in Range[USize](0, 100000) do
      var sampler: JitteredSampler = JitteredSampler(5)
      h.assert_true(sampler.getNumSamples() == 4)

      for s in Range[USize](0, sampler.getNumSamples()) do
        var sample: Point2 = sampler.getSample()
        if s == 0 then
          h.assert_true((sample.x < 0.5) and (sample.x >= 0.0), "x=" + sample.x.string())
          h.assert_true((sample.y < 0.5) and (sample.y >= 0.0), "y=" + sample.y.string())
        elseif s == 1 then
          h.assert_true((sample.x >= 0.5) and (sample.x < 1.0), "x=" + sample.x.string())
          h.assert_true((sample.y < 0.5) and (sample.y >= 0.0), "y=" + sample.y.string())
        elseif s == 2 then
          h.assert_true((sample.x < 0.5) and (sample.x >= 0.0), "x=" + sample.x.string())
          h.assert_true((sample.y >= 0.5) and (sample.y < 1.0), "y=" + sample.y.string())
        else
          h.assert_true((sample.x >= 0.5) and (sample.x < 1.0), "x=" + sample.x.string())
          h.assert_true((sample.y >= 0.5) and (sample.y < 1.0), "y=" + sample.y.string())
        end
    end
  end
