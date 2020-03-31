require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Camera do
  it 'initializes' do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0)
    camera    = Engine3D::Camera.new position, direction

    assert_equal  position, camera.position
    assert_equal direction, camera.direction 
  end

  it 'directly moves to' do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.move_to(1.0, 2.0, 3.0)
    camera.move_to(4.0, 5.0, 6.0)

    assert_equal Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0), camera.position 
  end

  it 'translates' do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.translate(1.0, 2.0, 3.0)
    camera.translate(4.0, 5.0, 6.0)

    assert_equal Engine3D::Vector.new(6.0, 9.0, 12.0, 1.0), camera.position 
  end

  it 'can look at somewhere else' do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.look_at(-3.0, -2.0, -1.0)

    assert_equal Engine3D::Vector.new(-3.0, -2.0, -1.0, 1.0), camera.direction
  end

  it "it can rotate along the x axis" do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(0.0, 0.0,-1.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.rotate_x(Math::PI/2.0)

    assert_equal Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0), camera.direction
  end

  it "it can rotate along the y axis" do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.rotate_y(Math::PI/2.0)

    assert_equal Engine3D::Vector.new(0.0, 0.0,-1.0, 1.0), camera.direction
  end

  it "it can rotate along the z axis" do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.rotate_z(Math::PI/2.0)

    assert_equal Engine3D::Vector.new(-1.0, 0.0, 0.0, 1.0), camera.direction
  end

  it "can compose rotations" do
    position  = Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0)
    direction = Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0)
    camera    = Engine3D::Camera.new position, direction
    camera.rotate( { :y => Math::PI/2, :x => Math::PI/2, :z => Math::PI/2 } )

    assert_equal Engine3D::Vector.new(-1.0, 0.0, 0.0, 1.0), camera.direction
  end
end
