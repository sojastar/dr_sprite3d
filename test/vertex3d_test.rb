require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Vertex do
  it "can initializes as a vertex part of something else (an object, or body, maybe)" do
    vertex = Engine3D::Vertex.new(1.0,2.0,3.0)

    assert_equal  Engine3D::Vector.new(1.0,2.0,3.0,1.0), vertex.local
    assert_nil    vertex.world
    assert_nil    vertex.view
    assert_equal  :unprocessed, vertex.processed
  end

  #it "can be translated in the parent object's local space" do
  #  vertex = Engine3D::Vertex.new(1.0,2.0,3.0)
  #  vertex.local_translate(1.0,1.0,1.0)

  #  assert_equal  Engine3D::Vector.new(2.0,3.0,4.0,1.0), vertex.local
  #  assert_equal  :unprocessed, vertex.processed
  #end

  it "can compute its world coordinates from its local coordinates and a transformation matrix (usually passeb by the parent body)" do
    vertex      = Engine3D::Vertex.new(1.0,2.0,3.0)
    body_matrix = Engine3D::Matrix.new([[ 1.0, 2.0, 3.0, 4.0],
                                        [ 5.0, 6.0, 7.0, 8.0],
                                        [ 9.0,10.0,11.0,12.0],
                                        [13.0,14.0,15.0,16.0]])  # the transformation matrix is ...
                                                                 # ... passed by the parent body 
    vertex.compute_world_coordinates(body_matrix)

    assert_equal   18.0, vertex.world.x
    assert_equal   46.0, vertex.world.y
    assert_equal   74.0, vertex.world.z
    assert_equal  102.0, vertex.world.w

    assert_equal  :world_coords_calculated, vertex.processed
  end

  it "can compute its view coordiantes from its world coordinates and the camera's transformation matrix" do
    vertex        = Engine3D::Vertex.new(1.0,2.0,3.0)
    body_matrix   = Engine3D::Matrix.new([[ 1.0, 2.0, 3.0, 4.0],
                                          [ 5.0, 6.0, 7.0, 8.0],
                                          [ 9.0,10.0,11.0,12.0],
                                          [13.0,14.0,15.0,16.0]])
    camera_matrix = Engine3D::Matrix.new([[17.0,18.0,19.0,20.0],
                                          [21.0,22.0,23.0,24.0],
                                          [25.0,26.0,27.0,28.0],
                                          [29.0,30.0,31.0,32.0]])
    vertex.compute_world_coordinates(body_matrix)
    vertex.compute_view_coordinates(camera_matrix)

    assert_equal  4580, vertex.view.x
    assert_equal  5540, vertex.view.y
    assert_equal  6500, vertex.view.z
    assert_equal  7460, vertex.view.w

    assert_equal  :view_coords_calculated, vertex.processed
  end

  it "can test for equality" do
    vertex        = Engine3D::Vertex.new(1.0,2.0,3.0)
    other_vertex  = Engine3D::Vertex.new(1.0,2.0,3.0000005)

    assert  vertex == other_vertex
  end

  it "#reset" do
    vertex  = Engine3D::Vertex.new(1.0,2.0,3.0)
    matrix1 = Engine3D::Matrix.new([[ 1.0, 2.0, 3.0, 4.0],
                                    [ 5.0, 6.0, 7.0, 8.0],
                                    [ 9.0,10.0,11.0,12.0],
                                    [13.0,14.0,15.0,16.0]])
    matrix2 = Engine3D::Matrix.new([[17.0,18.0,19.0,20.0],
                                    [21.0,22.0,23.0,24.0],
                                    [25.0,26.0,27.0,28.0],
                                    [29.0,30.0,31.0,32.0]])
    vertex.compute_world_coordinates(matrix1)
    vertex.compute_view_coordinates(matrix2)
    vertex.reset
    
    assert_equal  :unprocessed, vertex.processed
  end
end

