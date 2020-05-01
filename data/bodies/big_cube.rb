Engine3D::Body.new do
  size = 10

  # Blue balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        -1.0 - size,
                                        'sprite3dengine/data/sprites/sphere_blue.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        1.0 + size,
                                        'sprite3dengine/data/sprites/sphere_blue.png',
                                        16, 16
    end
  end

  # Green balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new -1.0 - size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'sprite3dengine/data/sprites/sphere_green.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 1.0 + size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'sprite3dengine/data/sprites/sphere_green.png',
                                        16, 16
    end
  end

  # Red balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        -1.0 - size,
                                        2 * j - size + 1,
                                        'sprite3dengine/data/sprites/sphere_red.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        1.0 + size,
                                        2 * j - size + 1,
                                        'sprite3dengine/data/sprites/sphere_red.png',
                                        16, 16
    end
  end
end
