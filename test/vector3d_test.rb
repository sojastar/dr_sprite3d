require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Vector do
  it 'initializes' do
    vector = Engine3D::Vector.new(12.3, 45.67, 89.10, 11.12)

    assert_equal  12.3,  vector.components[0]
    assert_equal  45.67, vector.components[1]
    assert_equal  89.10, vector.components[2]
    assert_equal  11.12, vector.components[3]
  end

  it 'can get each component by index' do
    vector = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.0)

    assert_equal  1.0, vector[0]
    assert_equal  2.0, vector[1]
    assert_equal  3.0, vector[2]
    assert_equal  4.0, vector[3]
  end

  it 'can get each component by name' do
    vector = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.0)

    assert_equal  1.0, vector.x
    assert_equal  2.0, vector.y
    assert_equal  3.0, vector.z
    assert_equal  4.0, vector.w
  end

  it 'can set each component by index' do
    vector    = Engine3D::Vector.new(0.0, 0.0, 0.0, 0.0)
    vector[0] = 1.0
    vector[1] = 2.0
    vector[2] = 3.0
    vector[3] = 4.0

    assert_equal  1.0, vector.x
    assert_equal  2.0, vector.y
    assert_equal  3.0, vector.z
    assert_equal  4.0, vector.w
  end

  it 'can set each component by name' do
    vector    = Engine3D::Vector.new(0.0, 0.0, 0.0, 0.0)
    vector.x  = 1.0
    vector.y  = 2.0
    vector.z  = 3.0
    vector.w  = 4.0

    assert_equal  1.0, vector.x
    assert_equal  2.0, vector.y
    assert_equal  3.0, vector.z
    assert_equal  4.0, vector.w
  end

  it 'can set x, y, z and w at the same time' do
    vector = Engine3D::Vector.new(0.0, 0.0, 0.0, 0.0)
    vector.set(1.0, 2.0, 3.0, 4.0)

    assert_equal  1.0, vector.x
    assert_equal  2.0, vector.y
    assert_equal  3.0, vector.z
    assert_equal  4.0, vector.w
  end

  it 'can translate x, y and z componants at the same time' do
    vector = Engine3D::Vector.new(1.0, 1.0, 1.0, 1.0)
    vector.translate(1.0, 2.0, 3.0)

    assert_equal  2.0, vector.x
    assert_equal  3.0, vector.y
    assert_equal  4.0, vector.z
    assert_equal  1.0, vector.w
  end

  it 'can chack for equality' do
    vector          = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.0)
    vector_eq1      = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.0)
    vector_eq2      = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.0000005)
    vector_not_eq1  = Engine3D::Vector.new(1.0, 2.0, 3.0, 4.000001)
    vector_not_eq2  = Engine3D::Vector.new(1.0, 2.0, 3.0, 5.0)
    
    assert  vector == vector_eq1 
    assert  vector == vector_eq2
    assert  vector != vector_not_eq1
    assert  vector != vector_not_eq2
  end

  it 'can get reversed' do
    vector = Engine3D::Vector.new(1.0, -2.0, 3.0, -4.0)
    vector.reverse!

    assert_equal Engine3D::Vector.new(-1.0, 2.0, -3.0, -4.0), vector
  end

  it 'can return a reversed version of itself' do
    vector   = Engine3D::Vector.new(1.0, -2.0, 3.0, -4.0)
    reversed = vector.reverse

    assert_equal Engine3D::Vector.new(-1.0, 2.0, -3.0, -4.0), reversed
    refute_equal reversed.object_id, vector.object_id
  end

  it 'can get multiplied by a scalar' do
    vector  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    vector *= 2.5

    assert_equal 2.5, vector.x
    assert_equal 5.0, vector.y
    assert_equal 7.5, vector.z
    assert_equal 1.0, vector.w
  end

  it "can compute it's squared magnitude in 3D" do
    vector1 = Engine3D::Vector.new(1.0, 0.0, 0.0, 10.0)
    vector2 = Engine3D::Vector.new(2.0, 1.0, 2.0, -3.0)

    assert_equal  1.0, vector1.squared_magnitude
    assert_equal  9.0, vector2.squared_magnitude
  end

  it "can compute it's magnitude in 3D" do
    vector1 = Engine3D::Vector.new(1.0, 0.0, 0.0, 10.0)
    vector2 = Engine3D::Vector.new(2.0, 1.0, 2.0, -3.0)

    assert_equal  1.0, vector1.magnitude
    assert_equal  3.0, vector2.magnitude
  end

  it 'can return a normalized version of itself' do
    vector1   = Engine3D::Vector.new(23.0, 0.0,  0.0, 1.0)
    vector1n  = vector1.normalized
    vector2   = Engine3D::Vector.new( 0.0, 8.0,  0.0, 1.0)
    vector2n  = vector2.normalized
    vector3   = Engine3D::Vector.new( 0.0, 0.0, 12.0, 1.0)
    vector3n  = vector3.normalized

    assert_equal 1.0, vector1n.x
    assert_equal 0.0, vector1n.y
    assert_equal 0.0, vector1n.z
    assert_equal 1.0, vector1n.w
    refute_equal  vector1.object_id, vector1n.object_id

    assert_equal 0.0, vector2n.x
    assert_equal 1.0, vector2n.y
    assert_equal 0.0, vector2n.z
    assert_equal 1.0, vector2n.w
    refute_equal  vector2.object_id, vector2n.object_id

    assert_equal 0.0, vector3n.x
    assert_equal 0.0, vector3n.y
    assert_equal 1.0, vector3n.z
    assert_equal 1.0, vector3n.w
    refute_equal  vector3.object_id, vector3n.object_id
  end

  it 'can get normalized' do
    vector1 = Engine3D::Vector.new(23.0, 0.0,  0.0, 1.0)
    vector1.normalized!
    vector2 = Engine3D::Vector.new( 0.0, 8.0,  0.0, 1.0)
    vector2.normalized!
    vector3 = Engine3D::Vector.new( 0.0, 0.0, 12.0, 1.0)
    vector3.normalized!

    assert_equal 1.0, vector1.x
    assert_equal 0.0, vector1.y
    assert_equal 0.0, vector1.z
    assert_equal 1.0, vector1.w

    assert_equal 0.0, vector2.x
    assert_equal 1.0, vector2.y
    assert_equal 0.0, vector2.z
    assert_equal 1.0, vector2.w

    assert_equal 0.0, vector3.x
    assert_equal 0.0, vector3.y
    assert_equal 1.0, vector3.z
    assert_equal 1.0, vector3.w
  end

  it 'can rotate along the x axis' do
    u = Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0)
    v = Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0)
    w = Engine3D::Vector.new(0.0, 0.0, 1.0, 1.0)

    assert_equal         u, u.rotate_x(Math::PI/2.0)
    assert_equal         w, v.rotate_x(Math::PI/2.0)
    assert_equal v.reverse, w.rotate_x(Math::PI/2.0)
  end

  it 'can rotate along the y axis' do
    u = Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0)
    v = Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0)
    w = Engine3D::Vector.new(0.0, 0.0, 1.0, 1.0)

    assert_equal w.reverse, u.rotate_y(Math::PI/2.0)
    assert_equal         v, v.rotate_y(Math::PI/2.0)
    assert_equal         u, w.rotate_y(Math::PI/2.0)
  end

  it 'can rotate along the z axis' do
    u = Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0)
    v = Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0)
    w = Engine3D::Vector.new(0.0, 0.0, 1.0, 1.0)

    assert_equal         v, u.rotate_z(Math::PI/2.0)
    assert_equal u.reverse, v.rotate_z(Math::PI/2.0)
    assert_equal         w, w.rotate_z(Math::PI/2.0)
  end

  it 'can return its cross product with another vector' do
    vector1       = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    vector2       = Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0)
    cross_product = vector1.cross(vector2)

    assert_equal -3.0, cross_product.x
    assert_equal  6.0, cross_product.y
    assert_equal -3.0, cross_product.z
    assert_equal  1.0, cross_product.w
  end
end
