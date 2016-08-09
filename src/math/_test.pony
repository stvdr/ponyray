use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_Equatable)
    //test(_Getters)
    //test(_Operators)

class _Equatable is UnitTest
  """
  Test Vec3 equality
  """
  fun name(): String => "math/Vec3 equality"

  fun apply(h: TestHelper) =>
    h.assert_true(Vec3(1.0,2.0,3.0) == Vec3(1.0,2.0,3.0))
    h.assert_true(Vec3(1.0,2.0,3.0) != Vec3(1.0,2.0,0.0))
    h.assert_true(Vec3(1.0,2.0,3.0) != Vec3(1.0,0.0,3.0))
    h.assert_true(Vec3(1.0,2.0,3.0) != Vec3(0.0,2.0,3.0))

//class _Getters is UnitTest
//  """
//  Test Vec3 getters
//  """
//  fun name(): String => "math/Vec3 getters"
//
//  fun apply(h: TestHelper) =>
//    let v = Vec3(1.0, 2.0, 3.0)
//    h.assert_true(v.x() == 1.0)
//    h.assert_true(v.y() == 2.0)
//    h.assert_true(v.z() == 3.0)
//
//class _Operators is UnitTest
//  """
//  Test Vec3 operators (add, subtract, neg, etc.)
//  """
//  fun name(): String => "math/Vec3 operators"
//
//  fun apply(h: TestHelper) =>
//    let v = Vec3(1.0, 2.0, 3.0)
//    let u = Vec3(10.0, 20.0, 30.0)
//    h.assert_true((v + u) == Vec3(11.0, 22.0, 33.0))
//    h.assert_true((v - u) == Vec3(-9.0, -18.0, -27.0))
//    h.assert_true(-v == Vec3(-1.0, -2.0, -3.0))
