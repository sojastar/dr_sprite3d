Engine3D::Body.new do
  size = 6

  # Blue balls :
  size.times do |i|
    size.times do |j|
      add_sprite Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        -1.0 - size,
                                        'data/sprites/spheres_all.png',
                                        0, 0, 16, 16
      add_sprite Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        1.0 + size,
                                        'data/sprites/spheres_all.png',
                                        0, 0, 16, 16
    end
  end

  # Green balls :
  size.times do |i|
    size.times do |j|
      add_sprite Engine3D::Sprite3D.new -1.0 - size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        16, 0, 16, 16
      add_sprite Engine3D::Sprite3D.new 1.0 + size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        16, 0, 16, 16
    end
  end

  # Red balls :
  size.times do |i|
    size.times do |j|
      add_sprite Engine3D::Sprite3D.new 2 * i - size + 1,
                                        -1.0 - size,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        32, 0, 16, 16
      add_sprite Engine3D::Sprite3D.new 2 * i - size + 1,
                                        1.0 + size,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        32, 0, 16, 16
    end
  end
end
