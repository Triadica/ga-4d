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
  e31 : Double
  e42 : Double
  e123 : Double
  e234 : Double
  e341 : Double
  e412 : Double
  e1234 : Double
} derive(Show)

///|
pub impl Eq for GeometricAlgebra4D with op_equal(self, other) -> Bool {
  let delta = self - other
  let m2 = delta.magnitude2()
  return m2 < 1.0e-20
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
  if a.e31 != 0.0 {
    ret += " e31: " + a.e31.to_string() + ","
  }
  if a.e42 != 0.0 {
    ret += " e42: " + a.e42.to_string() + ","
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
  e31 : Double,
  e42 : Double,
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
    e31,
    e42,
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
  e31~ : Double = 0,
  e42~ : Double = 0,
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
    e31,
    e42,
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
    self.e31 + other.e31,
    self.e42 + other.e42,
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
    -self.e31,
    -self.e42,
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
    self.e1234 * other.e1234 +
    self.e2 * other.e2 +
    self.e3 * other.e3 -
    self.e41 * other.e41 -
    self.e412 * other.e412 -
    self.e42 * other.e42 -
    self.e12 * other.e12 -
    self.e123 * other.e123 -
    self.e23 * other.e23 -
    self.e234 * other.e234 -
    self.e34 * other.e34 -
    self.e341 * other.e341 -
    self.e31 * other.e31
  let e1 = self.scalar * other.e1 +
    self.e4 * other.e41 +
    self.e412 * other.e42 +
    self.e42 * other.e412 +
    self.e1 * other.scalar +
    self.e12 * other.e2 +
    self.e234 * other.e1234 +
    self.e3 * other.e31 -
    self.e41 * other.e4 -
    self.e123 * other.e23 -
    self.e1234 * other.e234 -
    self.e2 * other.e12 -
    self.e23 * other.e123 -
    self.e34 * other.e341 -
    self.e341 * other.e34 -
    self.e31 * other.e3
  let e2 = self.scalar * other.e2 +
    self.e4 * other.e42 +
    self.e1 * other.e12 +
    self.e1234 * other.e341 +
    self.e2 * other.scalar +
    self.e23 * other.e3 -
    self.e41 * other.e412 -
    self.e412 * other.e41 -
    self.e42 * other.e4 -
    self.e12 * other.e1 -
    self.e123 * other.e31 -
    self.e234 * other.e34 -
    self.e3 * other.e23 -
    self.e34 * other.e234 -
    self.e341 * other.e1234 -
    self.e31 * other.e123
  let e3 = self.scalar * other.e3 +
    self.e412 * other.e1234 +
    self.e2 * other.e23 +
    self.e3 * other.scalar +
    self.e34 * other.e4 +
    self.e31 * other.e1 -
    self.e4 * other.e34 -
    self.e41 * other.e341 -
    self.e42 * other.e234 -
    self.e1 * other.e31 -
    self.e12 * other.e123 -
    self.e123 * other.e12 -
    self.e1234 * other.e412 -
    self.e23 * other.e2 -
    self.e234 * other.e42 -
    self.e341 * other.e41
  let e4 = self.scalar * other.e4 +
    self.e4 * other.scalar +
    self.e41 * other.e1 +
    self.e42 * other.e2 +
    self.e1234 * other.e123 +
    self.e3 * other.e34 +
    self.e341 * other.e31 -
    self.e412 * other.e12 -
    self.e1 * other.e41 -
    self.e12 * other.e412 -
    self.e123 * other.e1234 -
    self.e2 * other.e42 -
    self.e23 * other.e234 -
    self.e234 * other.e23 -
    self.e34 * other.e3 +
    self.e31 * other.e341
  let e12 = self.scalar * other.e12 +
    self.e4 * other.e412 +
    self.e412 * other.e4 +
    self.e42 * other.e41 +
    self.e1 * other.e2 +
    self.e12 * other.scalar +
    self.e123 * other.e3 +
    self.e234 * other.e341 +
    self.e3 * other.e123 -
    self.e41 * other.e42 -
    self.e1234 * other.e34 -
    self.e2 * other.e1 -
    self.e23 * other.e31 -
    self.e34 * other.e1234 -
    self.e341 * other.e234 +
    self.e31 * other.e23
  let e23 = self.scalar * other.e23 +
    self.e4 * other.e234 +
    self.e41 * other.e1234 +
    self.e42 * other.e34 +
    self.e1 * other.e123 +
    self.e12 * other.e31 +
    self.e123 * other.e1 +
    self.e1234 * other.e41 +
    self.e2 * other.e3 +
    self.e23 * other.scalar +
    self.e234 * other.e4 +
    self.e341 * other.e412 -
    self.e412 * other.e341 -
    self.e3 * other.e2 -
    self.e34 * other.e42 -
    self.e31 * other.e12
  let e34 = self.scalar * other.e34 +
    self.e412 * other.e123 +
    self.e1 * other.e341 +
    self.e2 * other.e234 +
    self.e23 * other.e42 +
    self.e234 * other.e2 +
    self.e3 * other.e4 +
    self.e34 * other.scalar +
    self.e341 * other.e1 -
    self.e4 * other.e3 +
    self.e41 * other.e31 -
    self.e42 * other.e23 -
    self.e12 * other.e1234 -
    self.e123 * other.e412 -
    self.e1234 * other.e12 -
    self.e31 * other.e41
  let e41 = self.scalar * other.e41 +
    self.e4 * other.e1 +
    self.e41 * other.scalar +
    self.e412 * other.e2 +
    self.e12 * other.e42 +
    self.e123 * other.e234 +
    self.e1234 * other.e23 +
    self.e2 * other.e412 +
    self.e23 * other.e1234 +
    self.e3 * other.e341 +
    self.e341 * other.e3 -
    self.e42 * other.e12 -
    self.e1 * other.e4 -
    self.e234 * other.e123 -
    self.e34 * other.e31 +
    self.e31 * other.e34
  let e31 = self.scalar * other.e31 +
    self.e42 * other.e1234 +
    self.e123 * other.e2 +
    self.e1234 * other.e42 +
    self.e2 * other.e123 +
    self.e23 * other.e12 +
    self.e234 * other.e412 +
    self.e3 * other.e1 +
    self.e34 * other.e41 +
    self.e31 * other.scalar -
    self.e4 * other.e341 -
    self.e41 * other.e34 -
    self.e412 * other.e234 -
    self.e1 * other.e3 -
    self.e12 * other.e23 -
    self.e341 * other.e4
  let e42 = self.scalar * other.e42 +
    self.e4 * other.e2 +
    self.e41 * other.e12 +
    self.e42 * other.scalar +
    self.e1234 * other.e31 +
    self.e234 * other.e3 +
    self.e3 * other.e234 +
    self.e34 * other.e23 +
    self.e341 * other.e123 +
    self.e31 * other.e1234 -
    self.e412 * other.e1 -
    self.e1 * other.e412 -
    self.e12 * other.e41 -
    self.e123 * other.e341 -
    self.e2 * other.e4 -
    self.e23 * other.e34
  let e123 = self.scalar * other.e123 +
    self.e42 * other.e341 +
    self.e1 * other.e23 +
    self.e12 * other.e3 +
    self.e123 * other.scalar +
    self.e1234 * other.e4 +
    self.e2 * other.e31 +
    self.e23 * other.e1 +
    self.e234 * other.e41 +
    self.e3 * other.e12 +
    self.e34 * other.e412 +
    self.e31 * other.e2 -
    self.e4 * other.e1234 -
    self.e41 * other.e234 -
    self.e412 * other.e34 -
    self.e341 * other.e42
  let e234 = self.scalar * other.e234 +
    self.e4 * other.e23 +
    self.e41 * other.e123 +
    self.e412 * other.e31 +
    self.e42 * other.e3 +
    self.e1 * other.e1234 +
    self.e2 * other.e34 +
    self.e23 * other.e4 +
    self.e234 * other.scalar +
    self.e3 * other.e42 +
    self.e34 * other.e2 +
    self.e341 * other.e12 -
    self.e12 * other.e341 -
    self.e123 * other.e41 -
    self.e1234 * other.e1 -
    self.e31 * other.e412
  let e341 = self.scalar * other.e341 +
    self.e41 * other.e3 +
    self.e412 * other.e23 +
    self.e1 * other.e34 +
    self.e12 * other.e234 +
    self.e123 * other.e42 +
    self.e1234 * other.e2 +
    self.e3 * other.e41 +
    self.e34 * other.e1 +
    self.e341 * other.scalar -
    self.e4 * other.e31 -
    self.e42 * other.e123 -
    self.e2 * other.e1234 -
    self.e23 * other.e412 -
    self.e234 * other.e12 -
    self.e31 * other.e4
  let e412 = self.scalar * other.e412 +
    self.e4 * other.e12 +
    self.e41 * other.e2 +
    self.e412 * other.scalar +
    self.e12 * other.e4 +
    self.e123 * other.e34 +
    self.e2 * other.e41 +
    self.e23 * other.e341 +
    self.e3 * other.e1234 +
    self.e31 * other.e234 -
    self.e42 * other.e1 -
    self.e1 * other.e42 -
    self.e1234 * other.e3 -
    self.e234 * other.e31 -
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
    self.e42 * other.e31 -
    self.e2 * other.e341 -
    self.e23 * other.e41 -
    self.e234 * other.e1 -
    self.e31 * other.e42
  return GeometricAlgebra4D::new(
    s, e1, e2, e3, e4, e12, e23, e34, e41, e31, e42, e123, e234, e341, e412, e1234,
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
    self.e31 * other.e31 +
    self.e42 * other.e42 +
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
  return self.scalar * self.scalar +
    self.e1 * self.e1 +
    self.e2 * self.e2 +
    self.e3 * self.e3 +
    self.e4 * self.e4 +
    self.e12 * self.e12 +
    self.e23 * self.e23 +
    self.e34 * self.e34 +
    self.e41 * self.e41 +
    self.e31 * self.e31 +
    self.e42 * self.e42 +
    self.e123 * self.e123 +
    self.e234 * self.e234 +
    self.e341 * self.e341 +
    self.e412 * self.e412 +
    self.e1234 * self.e1234
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
    -self.e31,
    -self.e42,
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
    self.e4 * self.e4 +
    self.e12 * self.e12 +
    self.e23 * self.e23 +
    self.e34 * self.e34 +
    self.e41 * self.e41 +
    self.e31 * self.e31 +
    self.e42 * self.e42 +
    self.e123 * self.e123 +
    self.e234 * self.e234 +
    self.e341 * self.e341 +
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
    self.e31 * f,
    self.e42 * f,
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
    self.e31 == 0.0 &&
    self.e42 == 0.0
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
  let value = self.magnitude2()
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
