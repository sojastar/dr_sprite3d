require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Body do
  it 'initializes' do
    body = Engine3D::Body.new do
      add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0)
      add_vertex Engine3D::Vertex.new(4.0, 5.0, 6.0)
      add_vertex Engine3D::Vertex.new(7.0, 8.0, 9.0)
    end

    assert_equal Engine3D::Matrix.identity, body.world_matrix
    assert_equal 3, body.vertices.length
  end

  it 'can store vertices' do
    body = Engine3D::Body.new do
      add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0)
      add_vertex Engine3D::Vertex.new(4.0, 5.0, 6.0)
      add_vertex Engine3D::Vertex.new(7.0, 8.0, 9.0)
    end

    assert_equal 3, body.vertices.length
    assert_equal Engine3D::Vector.new(1.0, 2.0, 3.0, 1.0), body.vertices[0].local
    assert_equal Engine3D::Vector.new(4.0, 5.0, 6.0, 1.0), body.vertices[1].local
    assert_equal Engine3D::Vector.new(7.0, 8.0, 9.0, 1.0), body.vertices[2].local
  end

  it 'directly moves to' do
    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.move_to(1.0,2.0,3.0)
    body.move_to(4.0,5.0,6.0)

    assert_equal Engine3D::Matrix.new([[ 1.0, 0.0, 0.0, 4.0],
                                       [ 0.0, 1.0, 0.0, 5.0],
                                       [ 0.0, 0.0, 1.0, 6.0],
                                       [ 0.0, 0.0, 0.0, 1.0]]), body.world_matrix
  end

  it 'translates' do
    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.translate(1.0,2.0,3.0)
    body.translate(4.0,5.0,6.0)

    assert_equal Engine3D::Matrix.new([[ 1.0, 0.0, 0.0, 5.0],
                                       [ 0.0, 1.0, 0.0, 7.0],
                                       [ 0.0, 0.0, 1.0, 9.0],
                                       [ 0.0, 0.0, 0.0, 1.0]]), body.world_matrix
  end

  it 'can return its coordinates' do
    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.move_to(1.0,2.0,3.0)
    
    assert_equal 1.0, body.x
    assert_equal 2.0, body.y
    assert_equal 3.0, body.z
  end

  it "it can rotate along the y axis" do
    u       = Engine3D::Vector.new(1.0,0.0,0.0,1.0)
    v       = Engine3D::Vector.new(0.0,1.0,0.0,1.0)
    w       = Engine3D::Vector.new(0.0,0.0,1.0,1.0)

    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.rotate_x(Math::PI/2)

    assert_equal                                         u, body.world_matrix * u
    assert_equal  Engine3D::Vector.new(0.0, 0.0, 1.0, 1.0), body.world_matrix * v
    assert_equal  Engine3D::Vector.new(0.0,-1.0, 0.0, 1.0), body.world_matrix * w
  end

  it "it can rotate along the y axis" do
    u       = Engine3D::Vector.new(1.0,0.0,0.0,1.0)
    v       = Engine3D::Vector.new(0.0,1.0,0.0,1.0)
    w       = Engine3D::Vector.new(0.0,0.0,1.0,1.0)

    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.rotate_y(Math::PI/2)

    assert_equal  Engine3D::Vector.new(0.0, 0.0,-1.0, 1.0), body.world_matrix * u
    assert_equal                                         v, body.world_matrix * v
    assert_equal  Engine3D::Vector.new(1.0, 0.0, 0.0, 1.0), body.world_matrix * w
  end

  it "it can rotate along the z axis" do
    u       = Engine3D::Vector.new(1.0,0.0,0.0,1.0)
    v       = Engine3D::Vector.new(0.0,1.0,0.0,1.0)
    w       = Engine3D::Vector.new(0.0,0.0,1.0,1.0)

    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.rotate_z(Math::PI/2)

    assert_equal  Engine3D::Vector.new( 0.0, 1.0, 0.0, 1.0), body.world_matrix * u
    assert_equal  Engine3D::Vector.new(-1.0, 0.0, 0.0, 1.0), body.world_matrix * v
    assert_equal                                          w, body.world_matrix * w
  end

  it "can compose rotations" do
    u       = Engine3D::Vector.new(1.0,0.0,0.0,1.0)
    v       = Engine3D::Vector.new(0.0,1.0,0.0,1.0)
    w       = Engine3D::Vector.new(0.0,0.0,1.0,1.0)

    body = Engine3D::Body.new { add_vertex Engine3D::Vertex.new(1.0, 2.0, 3.0) }
    body.rotate( { :x => Math::PI/2, :y => Math::PI/2, :z => Math::PI/2 } )

    assert_equal Engine3D::Vector.new( 0.0, 0.0, 1.0, 1.0), body.world_matrix * u
    assert_equal Engine3D::Vector.new( 0.0,-1.0, 0.0, 1.0), body.world_matrix * v
    assert_equal Engine3D::Vector.new( 1.0, 0.0, 0.0, 1.0), body.world_matrix * w
  end
end

