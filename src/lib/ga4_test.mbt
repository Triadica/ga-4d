test "length after multiplication of vector" {
  let a = @lib.GeometricAlgebra4D::make(x=1, y=2, z=3, w=4)
  let b = @lib.GeometricAlgebra4D::make(x=5, y=6, z=7, w=8)
  let c = a * b
  // almost equal but not exactly equal since floating point arithmetic
  assert_true!((c.length() - a.length() * b.length()).abs() < 1.0e-12)
}

test "length after multiplication of bivector" {
  let a = @lib.GeometricAlgebra4D::make(xy=1, zx=2, wx=3, yz=4, wy=5)
  let b = @lib.GeometricAlgebra4D::make(xy=7, zx=8, wx=9, yz=10, wy=11)
  let c = a * b
  assert_eq!(c.length(), a.length() * b.length())
  // assert_true!((c.length() - a.length() * b.length()).abs() < 1.0e-12)

}

test "length after multiplication of trivector" {
  let a = @lib.GeometricAlgebra4D::make(xyz=1, yzw=2, zwx=3, wxy=4)
  let b = @lib.GeometricAlgebra4D::make(xyz=5, yzw=6, zwx=7, wxy=8)
  let c = a * b
  // assert_eq!(c.length(), a.length() * b.length())
  assert_true!((c.length() - a.length() * b.length()).abs() < 1.0e-12)
}

test "length after multiplication of quadvector" {
  let a = @lib.GeometricAlgebra4D::make(xyzw=1)
  let b = @lib.GeometricAlgebra4D::make(xyzw=2)
  let c = a * b
  assert_eq!(c.length(), a.length() * b.length())
}
