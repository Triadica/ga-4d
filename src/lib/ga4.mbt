///| struct holding 4D geometric algebra
pub(all) struct GeometricAlgebra4D {
  s : Double
  x : Double
  y : Double
  z : Double
  w : Double
  xy : Double
  yz : Double
  zw : Double
  wx : Double
  zx : Double
  wy : Double
  xyz : Double
  yzw : Double
  zwx : Double
  wxy : Double
  xyzw : Double
}

///|
pub fn GeometricAlgebra4D::to_string(a : GeometricAlgebra4D) -> String {
  // return "GeometricAlgebra4D { s: \{a.s}, x: \{a.x}, y: \{a.y}, z: \{a.z}, w: \{a.w}, xy: \{a.xy}, yz: \{a.yz}, zw: \{a.zw}, wx: \{a.wx}, zx: \{a.zx}, wy: \{a.wy}, xyz: \{a.xyz}, yzw: \{a.yzw}, zwx: \{a.zwx}, wxy: \{a.wxy}, xyzw: \{a.xyzw} }"
  let mut ret = "GeometricAlgebra4D {"
  if a.s != 0.0 {
    ret += " s: " + a.s.to_string() + ","
  }
  if a.x != 0.0 {
    ret += " x: " + a.x.to_string() + ","
  }
  if a.y != 0.0 {
    ret += " y: " + a.y.to_string() + ","
  }
  if a.z != 0.0 {
    ret += " z: " + a.z.to_string() + ","
  }
  if a.w != 0.0 {
    ret += " w: " + a.w.to_string() + ","
  }
  if a.xy != 0.0 {
    ret += " xy: " + a.xy.to_string() + ","
  }
  if a.yz != 0.0 {
    ret += " yz: " + a.yz.to_string() + ","
  }
  if a.zw != 0.0 {
    ret += " zw: " + a.zw.to_string() + ","
  }
  if a.wx != 0.0 {
    ret += " wx: " + a.wx.to_string() + ","
  }
  if a.zx != 0.0 {
    ret += " zx: " + a.zx.to_string() + ","
  }
  if a.wy != 0.0 {
    ret += " wy: " + a.wy.to_string() + ","
  }
  if a.xyz != 0.0 {
    ret += " xyz: " + a.xyz.to_string() + ","
  }
  if a.yzw != 0.0 {
    ret += " yzw: " + a.yzw.to_string() + ","
  }
  if a.zwx != 0.0 {
    ret += " zwx: " + a.zwx.to_string() + ","
  }
  if a.wxy != 0.0 {
    ret += " wxy: " + a.wxy.to_string() + ","
  }
  if a.xyzw != 0.0 {
    ret += " xyzw: " + a.xyzw.to_string() + ","
  }
  if ret.ends_with(",") {
    ret = ret.substring(end=ret.length() - 1)
  }
  ret += " }"
  return ret
}

///|
fn GeometricAlgebra4D::new(
  s : Double,
  x : Double,
  y : Double,
  z : Double,
  w : Double,
  xy : Double,
  yz : Double,
  zw : Double,
  wx : Double,
  zx : Double,
  wy : Double,
  xyz : Double,
  yzw : Double,
  zwx : Double,
  wxy : Double,
  xyzw : Double
) -> GeometricAlgebra4D {
  return { s, x, y, z, w, xy, yz, zw, wx, zx, wy, xyz, yzw, zwx, wxy, xyzw }
}

///|
fn GeometricAlgebra4D::make(
  s~ : Double = 0,
  x~ : Double = 0,
  y~ : Double = 0,
  z~ : Double = 0,
  w~ : Double = 0,
  xy~ : Double = 0,
  yz~ : Double = 0,
  zw~ : Double = 0,
  wx~ : Double = 0,
  zx~ : Double = 0,
  wy~ : Double = 0,
  xyz~ : Double = 0,
  yzw~ : Double = 0,
  zwx~ : Double = 0,
  wxy~ : Double = 0,
  xyzw~ : Double = 0
) -> GeometricAlgebra4D {
  return { s, x, y, z, w, xy, yz, zw, wx, zx, wy, xyz, yzw, zwx, wxy, xyzw }
}

///|
fn GeometricAlgebra4D::from_4(
  x : Double,
  y : Double,
  z : Double,
  w : Double
) -> GeometricAlgebra4D {
  return {
    s: 0.0,
    //
    x,
    y,
    z,
    w,
    //
    xy: 0.0,
    yz: 0.0,
    zw: 0.0,
    wx: 0.0,
    zx: 0.0,
    wy: 0.0,
    //
    xyz: 0.0,
    yzw: 0.0,
    zwx: 0.0,
    wxy: 0.0,
    xyzw: 0.0,
  }
}

///|
fn GeometricAlgebra4D::from_v4f(v : Array[Double]) -> GeometricAlgebra4D {
  guard v.length() == 4 else {
    println("GeometricAlgebra4D::from_v4f: v.length() != 4")
    panic()
  }
  return GeometricAlgebra4D::from_4(v[0], v[1], v[2], v[3])
}

///| only return the first 4 elements
fn GeometricAlgebra4D::to_v4f(self : GeometricAlgebra4D) -> Array[Double] {
  return [self.x, self.y, self.z, self.w]
}

///|
pub fn GeometricAlgebra4D::default() -> GeometricAlgebra4D {
  return GeometricAlgebra4D::from_4(0.0, 0.0, 0.0, 0.0)
}

///|
fn GeometricAlgebra4D::i() -> GeometricAlgebra4D {
  return GeometricAlgebra4D::make(xyzw=1.0)
}

///|
fn GeometricAlgebra4D::op_add(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.s + other.s,
    self.x + other.x,
    self.y + other.y,
    self.z + other.z,
    self.w + other.w,
    self.xy + other.xy,
    self.yz + other.yz,
    self.zw + other.zw,
    self.wx + other.wx,
    self.zx + other.zx,
    self.wy + other.wy,
    self.xyz + other.xyz,
    self.yzw + other.yzw,
    self.zwx + other.zwx,
    self.wxy + other.wxy,
    self.xyzw + other.xyzw,
  )
}

///|
fn GeometricAlgebra4D::negate(self : GeometricAlgebra4D) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    -self.s,
    -self.x,
    -self.y,
    -self.z,
    -self.w,
    -self.xy,
    -self.yz,
    -self.zw,
    -self.wx,
    -self.zx,
    -self.wy,
    -self.xyz,
    -self.yzw,
    -self.zwx,
    -self.wxy,
    -self.xyzw,
  )
}

///|
pub fn GeometricAlgebra4D::op_sub(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return self + other.negate()
}

///| this is a huge equation of Geometric Algebra 4D multiplication(aka. Clifford product)
/// https://gist.github.com/tiye/c96ceb4345162ca5a4e3b37478e1e0bd#file-result-txt-L1
/// this polynomial contains 256 terms, hard to garantee correctness, will check again and again in future
fn GeometricAlgebra4D::op_mul(
  self : GeometricAlgebra4D,
  other : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  let s = self.s * other.s +
    self.w * other.w +
    self.x * other.x +
    self.xyzw * other.xyzw +
    self.y * other.y +
    self.z * other.z -
    self.wx * other.wx -
    self.wxy * other.wxy -
    self.wy * other.wy -
    self.xy * other.xy -
    self.xyz * other.xyz -
    self.yz * other.yz -
    self.yzw * other.yzw -
    self.zw * other.zw -
    self.zwx * other.zwx -
    self.zx * other.zx
  let e1 = self.s * other.x +
    self.w * other.wx +
    self.wxy * other.wy +
    self.wy * other.wxy +
    self.x * other.s +
    self.xy * other.y +
    self.yzw * other.xyzw +
    self.z * other.zx -
    self.wx * other.w -
    self.xyz * other.yz -
    self.xyzw * other.yzw -
    self.y * other.xy -
    self.yz * other.xyz -
    self.zw * other.zwx -
    self.zwx * other.zw -
    self.zx * other.z
  let e2 = self.s * other.y +
    self.w * other.wy +
    self.x * other.xy +
    self.xyzw * other.zwx +
    self.y * other.s +
    self.yz * other.z -
    self.wx * other.wxy -
    self.wxy * other.wx -
    self.wy * other.w -
    self.xy * other.x -
    self.xyz * other.zx -
    self.yzw * other.zw -
    self.z * other.yz -
    self.zw * other.yzw -
    self.zwx * other.xyzw -
    self.zx * other.xyz
  let e3 = self.s * other.z +
    self.wxy * other.xyzw +
    self.y * other.yz +
    self.z * other.s +
    self.zw * other.w +
    self.zx * other.x -
    self.w * other.zw -
    self.wx * other.zwx -
    self.wy * other.yzw -
    self.x * other.zx -
    self.xy * other.xyz -
    self.xyz * other.xy -
    self.xyzw * other.wxy -
    self.yz * other.y -
    self.yzw * other.wy -
    self.zwx * other.wx
  let e4 = self.s * other.w +
    self.w * other.s +
    self.wx * other.x +
    self.wy * other.y +
    self.xyzw * other.xyz +
    self.z * other.zw +
    self.zwx * other.zx -
    self.wxy * other.xy -
    self.x * other.wx -
    self.xy * other.wxy -
    self.xyz * other.xyzw -
    self.y * other.wy -
    self.yz * other.yzw -
    self.yzw * other.yz -
    self.zw * other.z -
    self.zx * other.zwx
  let e12 = self.s * other.xy +
    self.w * other.wxy +
    self.wxy * other.w +
    self.wy * other.wx +
    self.x * other.y +
    self.xy * other.s +
    self.xyz * other.z +
    self.yzw * other.zwx +
    self.z * other.xyz -
    self.wx * other.wy -
    self.xyzw * other.zw -
    self.y * other.x -
    self.yz * other.zx -
    self.zw * other.xyzw -
    self.zwx * other.yzw -
    self.zx * other.yz
  let e23 = self.s * other.yz +
    self.w * other.yzw +
    self.wx * other.xyzw +
    self.wy * other.zw +
    self.x * other.xyz +
    self.xy * other.zx +
    self.xyz * other.x +
    self.xyzw * other.wx +
    self.y * other.z +
    self.yz * other.s +
    self.yzw * other.w +
    self.zwx * other.wxy -
    self.wxy * other.zwx -
    self.z * other.y -
    self.zw * other.wy -
    self.zx * other.xy
  let e34 = self.s * other.zw +
    self.wxy * other.xyz +
    self.x * other.zwx +
    self.y * other.yzw +
    self.yz * other.wy +
    self.yzw * other.y +
    self.z * other.w +
    self.zw * other.s +
    self.zwx * other.x -
    self.w * other.z -
    self.wx * other.zx -
    self.wy * other.yz -
    self.xy * other.xyzw -
    self.xyz * other.wxy -
    self.xyzw * other.xy -
    self.zx * other.wx
  let e41 = self.s * other.wx +
    self.w * other.x +
    self.wx * other.s +
    self.wxy * other.y +
    self.xy * other.wy +
    self.xyz * other.yzw +
    self.xyzw * other.yz +
    self.y * other.wxy +
    self.yz * other.xyzw +
    self.z * other.zwx +
    self.zwx * other.z -
    self.wy * other.xy -
    self.x * other.w -
    self.yzw * other.xyz -
    self.zw * other.zx -
    self.zx * other.zw
  let e31 = self.s * other.zx +
    self.wy * other.xyzw +
    self.xyz * other.y +
    self.xyzw * other.wy +
    self.y * other.xyz +
    self.yz * other.xy +
    self.yzw * other.wxy +
    self.z * other.x +
    self.zw * other.wx +
    self.zx * other.s -
    self.w * other.zwx -
    self.wx * other.zw -
    self.wxy * other.yzw -
    self.x * other.z -
    self.xy * other.yz -
    self.zwx * other.w
  let e42 = self.s * other.wy +
    self.w * other.y +
    self.wx * other.xy +
    self.wy * other.s +
    self.xyzw * other.zx +
    self.yzw * other.z +
    self.z * other.yzw +
    self.zw * other.yz +
    self.zwx * other.xyz +
    self.zx * other.xyzw -
    self.wxy * other.x -
    self.x * other.wxy -
    self.xy * other.wx -
    self.xyz * other.zwx -
    self.y * other.w -
    self.yz * other.zw
  let e123 = self.s * other.xyz +
    self.wy * other.zwx +
    self.x * other.yz +
    self.xy * other.z +
    self.xyz * other.s +
    self.xyzw * other.w +
    self.y * other.zx +
    self.yz * other.x +
    self.yzw * other.wx +
    self.z * other.xy +
    self.zw * other.wxy +
    self.zx * other.y -
    self.w * other.xyzw -
    self.wx * other.yzw -
    self.wxy * other.zw -
    self.zwx * other.wy
  let e234 = self.s * other.yzw +
    self.w * other.yz +
    self.wx * other.xyz +
    self.wxy * other.zx +
    self.wy * other.z +
    self.x * other.xyzw +
    self.y * other.zw +
    self.yz * other.w +
    self.yzw * other.s +
    self.z * other.wy +
    self.zw * other.y +
    self.zwx * other.xy -
    self.xy * other.zwx -
    self.xyz * other.wx -
    self.xyzw * other.x -
    self.zx * other.wxy
  let e341 = self.s * other.zwx +
    self.wx * other.z +
    self.wxy * other.yz +
    self.x * other.zw +
    self.xy * other.yzw +
    self.xyz * other.wy +
    self.xyzw * other.y +
    self.z * other.wx +
    self.zw * other.x +
    self.zwx * other.s -
    self.w * other.zx -
    self.wy * other.xyz -
    self.y * other.xyzw -
    self.yz * other.wxy -
    self.yzw * other.xy -
    self.zx * other.w
  let e412 = self.s * other.wxy +
    self.w * other.xy +
    self.wx * other.y +
    self.wxy * other.s +
    self.xy * other.w +
    self.xyz * other.zw +
    self.y * other.wx +
    self.yz * other.zwx +
    self.z * other.xyzw +
    self.zx * other.yzw -
    self.wy * other.x -
    self.x * other.wy -
    self.xyzw * other.z -
    self.yzw * other.zx -
    self.zw * other.xyz -
    self.zwx * other.yz
  let e1234 = self.s * other.xyzw +
    self.x * other.yzw +
    self.xy * other.zw +
    self.xyz * other.w +
    self.xyzw * other.s +
    self.z * other.wxy +
    self.zw * other.xy +
    self.zwx * other.y -
    self.w * other.xyz -
    self.wx * other.yz -
    self.wxy * other.z -
    self.wy * other.zx -
    self.y * other.zwx -
    self.yz * other.wx -
    self.yzw * other.x -
    self.zx * other.wy
  return GeometricAlgebra4D::new(
    s, e1, e2, e3, e4, e12, e23, e34, e41, e31, e42, e123, e234, e341, e412, e1234,
  )
}

///| inner product
fn ga4_inner(a : GeometricAlgebra4D, b : GeometricAlgebra4D) -> Double {
  let s = a.s * b.s +
    a.w * b.w +
    a.x * b.x +
    a.xyzw * b.xyzw +
    a.y * b.y +
    a.z * b.z -
    a.wx * b.wx -
    a.wxy * b.wxy -
    a.wy * b.wy -
    a.xy * b.xy -
    a.xyz * b.xyz -
    a.yz * b.yz -
    a.yzw * b.yzw -
    a.zw * b.zw -
    a.zwx * b.zwx -
    a.zx * b.zx
  return s
}

///|
pub fn GeometricAlgebra4D::inner_product(
  self : Array[Double],
  other : Array[Double]
) -> Double {
  let a_v = GeometricAlgebra4D::from_v4f(self)
  let b_v = GeometricAlgebra4D::from_v4f(other)
  return ga4_inner(a_v, b_v)
}

///|
pub fn GeometricAlgebra4D::conjugate(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.s,
    self.x,
    self.y,
    self.z,
    self.w,
    -self.xy,
    -self.yz,
    -self.zw,
    -self.wx,
    -self.zx,
    -self.wy,
    self.xyz,
    self.yzw,
    self.zwx,
    self.wxy,
    -self.xyzw,
  )
}

///|
pub fn GeometricAlgebra4D::length2(self : GeometricAlgebra4D) -> Double {
  return self.s * self.s +
    self.x * self.x +
    self.y * self.y +
    self.z * self.z +
    self.w * self.w +
    self.xy * self.xy +
    self.yz * self.yz +
    self.zw * self.zw +
    self.wx * self.wx +
    self.zx * self.zx +
    self.wy * self.wy +
    self.xyz * self.xyz +
    self.yzw * self.yzw +
    self.zwx * self.zwx +
    self.wxy * self.wxy +
    self.xyzw * self.xyzw
}

///|
fn GeometricAlgebra4D::length(self : GeometricAlgebra4D) -> Double {
  let length = self.length2()
  if length == 0.0 {
    return 0.0
  } else {
    return length.sqrt()
  }
}

///|
fn GeometricAlgebra4D::scale(
  self : GeometricAlgebra4D,
  f : Double
) -> GeometricAlgebra4D {
  return GeometricAlgebra4D::new(
    self.s * f,
    self.x * f,
    self.y * f,
    self.z * f,
    self.w * f,
    self.xy * f,
    self.yz * f,
    self.zw * f,
    self.wx * f,
    self.zx * f,
    self.wy * f,
    self.xyz * f,
    self.yzw * f,
    self.zwx * f,
    self.wxy * f,
    self.xyzw * f,
  )
}

///|
fn GeometricAlgebra4D::normalize(
  self : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  let length = self.length()
  if length == 0.0 {
    return GeometricAlgebra4D::make(s=1.0)
  } else {
    return self.scale(1.0 / length)
  }
}

///|
fn GeometricAlgebra4D::reflect(
  self : GeometricAlgebra4D,
  b : GeometricAlgebra4D
) -> GeometricAlgebra4D {
  let r0 = b.normalize()
  return (r0.conjugate() * self * r0).scale(-1.0)
}

///|
fn GeometricAlgebra4D::is_scalar_zero(self : GeometricAlgebra4D) -> Bool {
  return self.s == 0.0
}

///|
fn GeometricAlgebra4D::is_vector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.x == 0.0 && self.y == 0.0 && self.z == 0.0 && self.w == 0.0
}

///|
fn GeometricAlgebra4D::is_bivector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.xy == 0.0 &&
    self.yz == 0.0 &&
    self.zw == 0.0 &&
    self.wx == 0.0 &&
    self.zx == 0.0 &&
    self.wy == 0.0
}

///|
fn GeometricAlgebra4D::is_trivector_zero(self : GeometricAlgebra4D) -> Bool {
  return self.xyz == 0.0 &&
    self.yzw == 0.0 &&
    self.zwx == 0.0 &&
    self.wxy == 0.0
}

///|
fn GeometricAlgebra4D::is_pseudoscalar_zero(self : GeometricAlgebra4D) -> Bool {
  return self.xyzw == 0.0
}

///|
fn GeometricAlgebra4D::is_empty(self : GeometricAlgebra4D) -> Bool {
  return self.is_scalar_zero() &&
    self.is_vector_zero() &&
    self.is_bivector_zero() &&
    self.is_trivector_zero() &&
    self.is_pseudoscalar_zero()
}
