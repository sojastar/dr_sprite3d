require 'minitest/autorun'
require_relative 'test_helper.rb'

describe Engine3D::Sprite3D do
  it "can initializes as a vertex part of something else (an object, or body, maybe)" do
    sprite3d = Engine3D::Sprite3D.new(1.0, 2.0, 3.0, "path_to_file", 32, 16)

    assert_equal  Engine3D::Vector.new(1.0,2.0,3.0,1.0), sprite3d.local
    assert_nil    sprite3d.world
    assert_nil    sprite3d.view
    assert_equal  :unprocessed, sprite3d.processed
    assert_equal  "path_to_file", sprite3d.file
    assert_equal  32, sprite3d.width
    assert_equal  16, sprite3d.height
  end
end
