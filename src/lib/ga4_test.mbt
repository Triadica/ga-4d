///|
// let epsilon : Double = 1.0 / 100000000.0

// /// test rotor, after a rotation, length should be the same
// test {
//   let a = @lib.GeometricAlgebra4D::new(
//     1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
//   )
//   let rotor = @lib.GeometricAlgebra4D::make(xy=0.1, yz=0.2)
//   let b = a.reflect!(rotor)
//   assert_true!((a.vector_length() - b.vector_length()).abs() < epsilon)

//   // another case
//   ///|
//   let a = @lib.GeometricAlgebra4D::make(x=1, y=2, z=3, w=4)
//   let rotor = @lib.GeometricAlgebra4D::make(xy=10)
//   let b = a.reflect!(rotor)
//   assert_true!((a.vector_length() - b.vector_length()).abs() < epsilon)
//   let a = @lib.GeometricAlgebra4D::make(x=1, y=2, z=3, w=4)
//   let b = @lib.GeometricAlgebra4D::make(x=7, y=8, z=9, w=10)
//   let rotor = @lib.GeometricAlgebra4D::make(xy=10, yz=11, zw=12, zx=13)
//   let a2 = a.reflect!(rotor)
//   let b2 = b.reflect!(rotor)
//   assert_eq!((a - b).vector_length(), (a2 - b2).vector_length())
// }

test "inverse" {
  let a = @lib.GeometricAlgebra4D::make(e1=1, e2=2, e3=3, e4=4)
  assert_eq!(a * a.inverse!(), @lib.GeometricAlgebra4D::unit())
  let b = @lib.GeometricAlgebra4D::make(e1=7, e2=8, e3=9, e4=10)
  assert_eq!(b * b.inverse!(), @lib.GeometricAlgebra4D::unit())
  let c = @lib.GeometricAlgebra4D::make(e12=1, e23=2, e34=3, e13=4)
  assert_eq!(c * c.inverse!(), @lib.GeometricAlgebra4D::unit())
}

// test "reflect" {
//   let a = @lib.GeometricAlgebra4D::make(x=1, y=2, z=3, w=4)
//   let b = @lib.GeometricAlgebra4D::make(x=7, y=8, z=9, w=10)
//   let reflected = a.reflect!(b)
//   let another = a * b * a.inverse!()
//   assert_eq!(reflected, another)
// }
