///|
type! GaErr String

///| struct holding 4D geometric algebra
pub(all) struct GeometricAlgebra4D {
  scalar : Double
  e1 : Double
  e2 : Double
  e3 : Double
  e4 : Double
  e12 : Double
  e23 : Double
  e34 : Double
  e41 : Double
  e13 : Double
  e24 : Double
  e123 : Double
  e234 : Double
  e341 : Double
  e412 : Double
  e1234 : Double
}

///|
pub impl Eq for GeometricAlgebra4D with op_equal(self, other) -> Bool {
  let delta = self - other
  let m2 = delta.magnitude2()
  return m2 < 1.0e-20
}

///|
pub impl Show for GeometricAlgebra4D with output(self, logger) -> Unit {
  logger.write_string(GeometricAlgebra4D::to_string(self))
}

///|
pub fn GeometricAlgebra4D::to_string(a : GeometricAlgebra4D) -> String {
  let mut ret = "GeometricAlgebra4D {"
  if a.scalar != 0.0 {
    ret += " scalar: " + a.scalar.to_string() + ","
  }
  if a.e1 != 0.0 {
    ret += " e1: " + a.e1.to_string() + ","
  }
  if a.e2 != 0.0 {
    ret += " e2: " + a.e2.to_string() + ","
  }
  if a.e3 != 0.0 {
    ret += " e3: " + a.e3.to_string() + ","
  }
  if a.e4 != 0.0 {
    ret += " e4: " + a.e4.to_string() + ","
  }
  if a.e12 != 0.0 {
    ret += " e12: " + a.e12.to_string() + ","
  }
  if a.e23 != 0.0 {
    ret += " e23: " + a.e23.to_string() + ","
  }
  if a.e34 != 0.0 {
    ret += " e34: " + a.e34.to_string() + ","
  }
  if a.e41 != 0.0 {
    ret += " e41: " + a.e41.to_string() + ","
  }
  if a.e13 != 0.0 {
    ret += " e13: " + a.e13.to_string() + ","
  }
  if a.e24 != 0.0 {
    ret += " e24: " + a.e24.to_string() + ","
  }
  if a.e123 != 0.0 {
    ret += " e123: " + a.e123.to_string() + ","
  }
  if a.e234 != 0.0 {
    ret += " e234: " + a.e234.to_string() + ","
  }
  if a.e341 != 0.0 {
    ret += " e341: " + a.e341.to_string() + ","
  }
  if a.e412 != 0.0 {
    ret += " e412: " + a.e412.to_string() + ","
  }
  if a.e1234 != 0.0 {
    ret += " e1234: " + a.e1234.to_string() + ","
  }
  if ret.ends_with(",") {
    ret = ret.substring(end=ret.length() - 1)
  }
  ret += " }"
  return ret
}

///|
pub fn GeometricAlgebra4D::new(
  scalar : Double,
  e1 : Double,
  e2 : Double,
  e3 : Double,
  e4 : Double,
  e12 : Double,
  e23 : Double,
  e34 : Double,
  e41 : Double,
  e13 : Double,
  e24 : Double,
  e123 : Double,
  e234 : Double,
  e341 : Double,
  e412 : Double,
  e1234 : Double
) -> GeometricAlgebra4D {
  return {
    scalar,
    e1,
    e2,
    e3,
    e4,
    e12,
    e23,
    e34,
    e41,
    e13,
    e24,
    e123,
    e234,
    e341,
    e412,
    e1234,
  }
}

///|
pub fn GeometricAlgebra4D::make(
  scalar~ : Double = 0,
  e1~ : Double = 0,
  e2~ : Double = 0,
  e3~ : Double = 0,
  e4~ : Double = 0,
  e12~ : Double = 0,
  e23~ : Double = 0,
  e34~ : Double = 0,
  e41~ : Double = 0,
  e13~ : Double = 0,
  e24~ : Double = 0,
  e123~ : Double = 0,
  e234~ : Double = 0,
  e341~ : Double = 0,
  e412~ : Double = 0,
  e1234~ : Double = 0
) -> GeometricAlgebra4D {
  return {
    scalar,
    e1,
    e2,
    e3,
    e4,
    e12,
    e23,
    e34,
    e41,
    e13,
    e24,
    e123,
    e234,
    e341,
    e412,
    e1234,
  }
}

///|
pub fn GeometricAlgebra4D::from_v4f(v : Array[Double]) -> GeometricAlgebra4D {
  guard v.length() == 4 else {
    println("GeometricAlgebra4D::from_v4f: v.length() != 4")
    panic()
  }
  return GeometricAlgebra4D::make(e1=v[0], e2=v[1], e3=v[2], e4=v[3])
}

///| only return the first 4 elements
pub fn GeometricAlgebra4D::to_v4f(self : GeometricAlgebra4D) -> Array[Double] {
  return [self.e1, self.e2, self.e3, self.e4]
}

///|
pub fn GeometricAlgebra4D::default() -> GeometricAlgebra4D {
  return GeometricAlgebra4D::make()
}

///|
pub fn GeometricAlgebra4D::i() -> GeometricAlgebra4D {
  return GeometricAlgebra4D::make(e1234=1.0)
}

///|
pub fn GeometricAlgebra4D::op_add(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.scalar + other.scalar,
    self.e1 + other.e1,
    self.e2 + other.e2,
    self.e3 + other.e3,
    self.e4 + other.e4,
    self.e12 + other.e12,
    self.e23 + other.e23,
    self.e34 + other.e34,
    self.e41 + other.e41,
    self.e13 + other.e13,
    self.e24 + other.e24,
    self.e123 + other.e123,
    self.e234 + other.e234,
    self.e341 + other.e341,
    self.e412 + other.e412,
    self.e1234 + other.e1234,
  )
}

///|
pub fn GeometricAlgebra4D::op_neg(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    -self.scalar,
    -self.e1,
    -self.e2,
    -self.e3,
    -self.e4,
    -self.e12,
    -self.e23,
    -self.e34,
    -self.e41,
    -self.e13,
    -self.e24,
    -self.e123,
    -self.e234,
    -self.e341,
    -self.e412,
    -self.e1234,
  )
}

///|
pub fn GeometricAlgebra4D::op_sub(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return self + other.op_neg()
}

///| this is a huge equation of Geometric Algebra 4D multiplication(aka. Clifford product)
/// https://gist.github.com/tiye/c96ceb4345162ca5a4e3b37478e1e0bd#file-result-txt-L1
/// this polynomial contains 256 terms, hard to garantee correctness, will check again and again in future
pub fn GeometricAlgebra4D::op_mul(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  let s = self.scalar * other.scalar +
    self.e4 * other.e4 +
    self.e1 * other.e1 +
    self.e2 * other.e2 +
    self.e3 * other.e3 -
    self.e12 * other.e12 -
    self.e23 * other.e23 -
    self.e34 * other.e34 -
    self.e41 * other.e41 -
    self.e13 * other.e13 -
    self.e24 * other.e24 -
    self.e412 * other.e412 -
    self.e123 * other.e123 -
    self.e234 * other.e234 -
    self.e341 * other.e341 +
    self.e1234 * other.e1234
  let e1 = self.scalar * other.e1 +
    self.e4 * other.e41 -
    self.e412 * other.e24 -
    self.e24 * other.e412 +
    self.e1 * other.scalar +
    self.e12 * other.e2 +
    self.e234 * other.e1234 -
    self.e3 * other.e13 -
    self.e41 * other.e4 -
    self.e123 * other.e23 -
    self.e1234 * other.e234 -
    self.e2 * other.e12 -
    self.e23 * other.e123 -
    self.e34 * other.e341 -
    self.e341 * other.e34 +
    self.e13 * other.e3
  let e2 = self.scalar * other.e2 -
    self.e4 * other.e24 +
    self.e1 * other.e12 +
    self.e1234 * other.e341 +
    self.e2 * other.scalar +
    self.e23 * other.e3 -
    self.e41 * other.e412 -
    self.e412 * other.e41 +
    self.e24 * other.e4 -
    self.e12 * other.e1 +
    self.e123 * other.e13 -
    self.e234 * other.e34 -
    self.e3 * other.e23 -
    self.e34 * other.e234 -
    self.e341 * other.e1234 +
    self.e13 * other.e123
  let e3 = self.scalar * other.e3 +
    self.e412 * other.e1234 +
    self.e2 * other.e23 +
    self.e3 * other.scalar +
    self.e34 * other.e4 -
    self.e13 * other.e1 -
    self.e4 * other.e34 -
    self.e41 * other.e341 +
    self.e24 * other.e234 +
    self.e1 * other.e13 -
    self.e12 * other.e123 -
    self.e123 * other.e12 -
    self.e1234 * other.e412 -
    self.e23 * other.e2 +
    self.e234 * other.e24 -
    self.e341 * other.e41
  let e4 = self.scalar * other.e4 +
    self.e4 * other.scalar +
    self.e41 * other.e1 -
    self.e24 * other.e2 +
    self.e1234 * other.e123 +
    self.e3 * other.e34 -
    self.e341 * other.e13 -
    self.e412 * other.e12 -
    self.e1 * other.e41 -
    self.e12 * other.e412 -
    self.e123 * other.e1234 +
    self.e2 * other.e24 -
    self.e23 * other.e234 -
    self.e234 * other.e23 -
    self.e34 * other.e3 -
    self.e13 * other.e341
  let e12 = self.scalar * other.e12 +
    self.e4 * other.e412 +
    self.e412 * other.e4 -
    self.e24 * other.e41 +
    self.e1 * other.e2 +
    self.e12 * other.scalar +
    self.e123 * other.e3 +
    self.e234 * other.e341 +
    self.e3 * other.e123 +
    self.e41 * other.e24 -
    self.e1234 * other.e34 -
    self.e2 * other.e1 +
    self.e23 * other.e13 -
    self.e34 * other.e1234 -
    self.e341 * other.e234 -
    self.e13 * other.e23
  let e23 = self.scalar * other.e23 +
    self.e4 * other.e234 +
    self.e41 * other.e1234 -
    self.e24 * other.e34 +
    self.e1 * other.e123 -
    self.e12 * other.e13 +
    self.e123 * other.e1 +
    self.e1234 * other.e41 +
    self.e2 * other.e3 +
    self.e23 * other.scalar +
    self.e234 * other.e4 +
    self.e341 * other.e412 -
    self.e412 * other.e341 -
    self.e3 * other.e2 +
    self.e34 * other.e24 +
    self.e13 * other.e12
  let e34 = self.scalar * other.e34 +
    self.e412 * other.e123 +
    self.e1 * other.e341 +
    self.e2 * other.e234 -
    self.e23 * other.e24 +
    self.e234 * other.e2 +
    self.e3 * other.e4 +
    self.e34 * other.scalar +
    self.e341 * other.e1 -
    self.e4 * other.e3 -
    self.e41 * other.e13 +
    self.e24 * other.e23 -
    self.e12 * other.e1234 -
    self.e123 * other.e412 -
    self.e1234 * other.e12 +
    self.e13 * other.e41
  let e41 = self.scalar * other.e41 +
    self.e4 * other.e1 +
    self.e41 * other.scalar +
    self.e412 * other.e2 -
    self.e12 * other.e24 +
    self.e123 * other.e234 +
    self.e1234 * other.e23 +
    self.e2 * other.e412 +
    self.e23 * other.e1234 +
    self.e3 * other.e341 +
    self.e341 * other.e3 +
    self.e24 * other.e12 -
    self.e1 * other.e4 -
    self.e234 * other.e123 +
    self.e34 * other.e13 -
    self.e13 * other.e34
  let e13 = self.scalar * other.e13 +
    self.e24 * other.e1234 -
    self.e123 * other.e2 +
    self.e1234 * other.e24 -
    self.e2 * other.e123 -
    self.e23 * other.e12 -
    self.e234 * other.e412 -
    self.e3 * other.e1 -
    self.e34 * other.e41 +
    self.e13 * other.scalar +
    self.e4 * other.e341 +
    self.e41 * other.e34 +
    self.e412 * other.e234 +
    self.e1 * other.e3 +
    self.e12 * other.e23 +
    self.e341 * other.e4
  let e24 = self.scalar * other.e24 -
    self.e4 * other.e2 -
    self.e41 * other.e12 +
    self.e24 * other.scalar +
    self.e1234 * other.e13 -
    self.e234 * other.e3 -
    self.e3 * other.e234 -
    self.e34 * other.e23 -
    self.e341 * other.e123 +
    self.e13 * other.e1234 +
    self.e412 * other.e1 +
    self.e1 * other.e412 +
    self.e12 * other.e41 +
    self.e123 * other.e341 +
    self.e2 * other.e4 +
    self.e23 * other.e34
  let e123 = self.scalar * other.e123 -
    self.e24 * other.e341 +
    self.e1 * other.e23 +
    self.e12 * other.e3 +
    self.e123 * other.scalar +
    self.e1234 * other.e4 -
    self.e2 * other.e13 +
    self.e23 * other.e1 +
    self.e234 * other.e41 +
    self.e3 * other.e12 +
    self.e34 * other.e412 -
    self.e13 * other.e2 -
    self.e4 * other.e1234 -
    self.e41 * other.e234 -
    self.e412 * other.e34 +
    self.e341 * other.e24
  let e234 = self.scalar * other.e234 +
    self.e4 * other.e23 +
    self.e41 * other.e123 -
    self.e412 * other.e13 -
    self.e24 * other.e3 +
    self.e1 * other.e1234 +
    self.e2 * other.e34 +
    self.e23 * other.e4 +
    self.e234 * other.scalar -
    self.e3 * other.e24 +
    self.e34 * other.e2 +
    self.e341 * other.e12 -
    self.e12 * other.e341 -
    self.e123 * other.e41 -
    self.e1234 * other.e1 +
    self.e13 * other.e412
  let e341 = self.scalar * other.e341 +
    self.e41 * other.e3 +
    self.e412 * other.e23 +
    self.e1 * other.e34 +
    self.e12 * other.e234 -
    self.e123 * other.e24 +
    self.e1234 * other.e2 +
    self.e3 * other.e41 +
    self.e34 * other.e1 +
    self.e341 * other.scalar +
    self.e4 * other.e13 +
    self.e24 * other.e123 -
    self.e2 * other.e1234 -
    self.e23 * other.e412 -
    self.e234 * other.e12 +
    self.e13 * other.e4
  let e412 = self.scalar * other.e412 +
    self.e4 * other.e12 +
    self.e41 * other.e2 +
    self.e412 * other.scalar +
    self.e12 * other.e4 +
    self.e123 * other.e34 +
    self.e2 * other.e41 +
    self.e23 * other.e341 +
    self.e3 * other.e1234 -
    self.e13 * other.e234 +
    self.e24 * other.e1 +
    self.e1 * other.e24 -
    self.e1234 * other.e3 +
    self.e234 * other.e13 -
    self.e34 * other.e123 -
    self.e341 * other.e23
  let e1234 = self.scalar * other.e1234 +
    self.e1 * other.e234 +
    self.e12 * other.e34 +
    self.e123 * other.e4 +
    self.e1234 * other.scalar +
    self.e3 * other.e412 +
    self.e34 * other.e12 +
    self.e341 * other.e2 -
    self.e4 * other.e123 -
    self.e41 * other.e23 -
    self.e412 * other.e3 -
    self.e24 * other.e13 -
    self.e2 * other.e341 -
    self.e23 * other.e41 -
    self.e234 * other.e1 -
    self.e13 * other.e24
  return GeometricAlgebra4D::new(
    s, e1, e2, e3, e4, e12, e23, e34, e41, e13, e24, e123, e234, e341, e412, e1234,
  )
}

///| inner product
pub fn GeometricAlgebra4D::inner_product(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> Double {
  let s = self.scalar * other.scalar +
    self.e4 * other.e4 +
    self.e1 * other.e1 +
    self.e2 * other.e2 +
    self.e3 * other.e3 +
    self.e41 * other.e41 +
    self.e13 * other.e13 +
    self.e24 * other.e24 +
    self.e12 * other.e12 +
    self.e34 * other.e34 +
    self.e23 * other.e23 +
    self.e412 * other.e412 +
    self.e123 * other.e123 +
    self.e234 * other.e234 +
    self.e341 * other.e341 +
    self.e1234 * other.e1234
  return s
}

///|
pub fn GeometricAlgebra4D::magnitude2(self : GeometricAlgebra4D) -> Double {
  return self.self_inner_product().abs()
}

///|
pub fn GeometricAlgebra4D::magnitude(self : GeometricAlgebra4D) -> Double {
  return self.magnitude2().sqrt()
}

///|
pub fn GeometricAlgebra4D::conjugate(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.scalar,
    self.e1,
    self.e2,
    self.e3,
    self.e4,
    -self.e12,
    -self.e23,
    -self.e34,
    -self.e41,
    -self.e13,
    -self.e24,
    -self.e123,
    -self.e234,
    -self.e341,
    -self.e412,
    self.e1234,
  )
}

///|
pub fn GeometricAlgebra4D::self_inner_product(
  self : GeometricAlgebra4D
) -> Double {
  return self.scalar * self.scalar +
    self.e1 * self.e1 +
    self.e2 * self.e2 +
    self.e3 * self.e3 +
    self.e4 * self.e4 -
    self.e12 * self.e12 -
    self.e23 * self.e23 -
    self.e34 * self.e34 -
    self.e41 * self.e41 -
    self.e13 * self.e13 -
    self.e24 * self.e24 -
    self.e123 * self.e123 -
    self.e234 * self.e234 -
    self.e341 * self.e341 -
    self.e412 * self.e412 +
    self.e1234 * self.e1234
}

///|
pub fn GeometricAlgebra4D::vector_length(self : GeometricAlgebra4D) -> Double {
  return (self.e1 * self.e1 +
  self.e2 * self.e2 +
  self.e3 * self.e3 +
  self.e4 * self.e4).sqrt()
}

///|
fn GeometricAlgebra4D::scale(
  self : GeometricAlgebra4D,
  f : Double
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.scalar * f,
    self.e1 * f,
    self.e2 * f,
    self.e3 * f,
    self.e4 * f,
    self.e12 * f,
    self.e23 * f,
    self.e34 * f,
    self.e41 * f,
    self.e13 * f,
    self.e24 * f,
    self.e123 * f,
    self.e234 * f,
    self.e341 * f,
    self.e412 * f,
    self.e1234 * f,
  )
}

///| only works for 1-vector
pub fn GeometricAlgebra4D::normalize(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D!GaErr {
  if not(self.is_vector()) {
    raise GaErr("normalize() only implemented for vector")
  }
  let length = self.vector_length()
  if length == 0.0 {
    return GeometricAlgebra4D::make(scalar=1.0)
  } else {
    return self.scale(1.0 / length)
  }
}

///|
pub fn GeometricAlgebra4D::alongside(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D!GaErr {
  let m2 = other.magnitude2()
  if m2 == 0.0 {
    raise GaErr("other is a zero vector")
  }
  self.scale(self.inner_product(other) / m2)
}

///|
pub fn GeometricAlgebra4D::wedge(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  let v = self * other
  { ..v, scalar: 0.0 }
}

///|
pub fn GeometricAlgebra4D::perpendicular(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D!GaErr {
  let m2 = other.magnitude2()
  if m2 == 0.0 {
    raise GaErr("other is a zero vector")
  }
  self.wedge(other).scale(1.0 / m2) * other
}

///|
pub fn GeometricAlgebra4D::reflect(
  self : GeometricAlgebra4D,
  b : GeometricAlgebra4D
) -> GeometricAlgebra4D!GaErr {
  // if not(self.is_zero()) {
  //   raise GaErr("a is not a zero vector")
  // }
  let parallel = self.alongside!(b)
  let perpendicular = self.perpendicular!(b)
  return parallel - perpendicular
}

///|
pub fn GeometricAlgebra4D::is_scalar_zero(self : GeometricAlgebra4D) -> Bool {
  return self.scalar == 0.0
}

///|
pub fn GeometricAlgebra4D::is_vector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.e1 == 0.0 && self.e2 == 0.0 && self.e3 == 0.0 && self.e4 == 0.0
}

///| only 1-vector
pub fn GeometricAlgebra4D::is_vector(self : GeometricAlgebra4D) -> Bool {
  return self.is_trivector_zero() &&
    self.is_bivector_zero() &&
    self.is_pseudoscalar_zero()
}

///|
fn GeometricAlgebra4D::is_bivector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.e12 == 0.0 &&
    self.e23 == 0.0 &&
    self.e34 == 0.0 &&
    self.e41 == 0.0 &&
    self.e13 == 0.0 &&
    self.e24 == 0.0
}

///|
fn GeometricAlgebra4D::is_trivector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.e123 == 0.0 &&
    self.e234 == 0.0 &&
    self.e341 == 0.0 &&
    self.e412 == 0.0
}

///|
pub fn GeometricAlgebra4D::is_pseudoscalar_zero(
  self : GeometricAlgebra4D
) -> Bool {
  return self.e1234 == 0.0
}

///|
pub fn GeometricAlgebra4D::is_zero(self : GeometricAlgebra4D) -> Bool {
  return self.is_scalar_zero() &&
    self.is_vector_zero() &&
    self.is_bivector_zero() &&
    self.is_trivector_zero() &&
    self.is_pseudoscalar_zero()
}

///|
pub fn GeometricAlgebra4D::is_unit(self : GeometricAlgebra4D) -> Bool {
  self.scalar == 1 &&
  self.is_vector_zero() &&
  self.is_bivector_zero() &&
  self.is_trivector_zero() &&
  self.is_pseudoscalar_zero()
}

///|
pub fn GeometricAlgebra4D::unit() -> GeometricAlgebra4D {
  return GeometricAlgebra4D::make(scalar=1.0)
}

///|
pub fn GeometricAlgebra4D::inverse(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D!GaErr {
  let value = self.self_inner_product()
  if value == 0 {
    raise GaErr("Cannot invert a zero multivector")
  } else {
    return self.scale(1.0 / value)
  }
}

// ///|
// pub fn GeometricAlgebra4D::reflect(
//   self : GeometricAlgebra4D,
//   rotor : GeometricAlgebra4D
// ) -> GeometricAlgebra4D!GaErr {
//   return rotor * self * rotor.inverse!()
// }
