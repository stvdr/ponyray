use "collections"

class val Vec3 is (Equatable[Vec3] & Stringable)
		let x: F64
		let y: F64
		let z: F64

		new val create(x': F64, y': F64, z': F64) =>
			x = x'
			y = y'
			z = z'

		fun add(u: Vec3): Vec3 =>
			Vec3(x + u.x, y + u.y, z + u.z)

		fun sub(u: Vec3): Vec3 =>
			Vec3(x - u.x, y - u.y, z - u.z)

		fun div(s: F64): Vec3 =>
			Vec3(x/s, y/s, z/s)

		fun mul(s: F64): Vec3 =>
			Vec3(x*s, y*s, z*s)

		fun neg(): Vec3 =>
			Vec3(-x, -y, -z)

		fun eq(u: Vec3): Bool =>
			(x == u.x) and (y == u.y) and (z == u.z)

		fun ne(u: Vec3): Bool =>
			not eq(u)

		fun dot(u: Vec3): F64 =>
			(x * u.x) + (y * u.y) + (z * u.z)

		fun cross(u: Vec3): Vec3 =>
			Vec3((y*u.z) - (z*u.y), (z*u.x) - (x*u.z), (x*u.y) - (y*u.x))

		fun magnitude_squared(): F64 =>
			(x*x) + (y*y) + (z*z)

		fun magnitude(): F64 =>
			magnitude_squared().sqrt()

		fun string(fmt: FormatSettings = FormatSettingsDefault): String iso^ =>
			("(" + x.string() + "," + y.string() + "," + z.string() + ")").string(fmt)
