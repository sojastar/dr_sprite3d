Engine3D::Body.new do
  size = 6

  # Blue balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        -1.0 - size,
<<<<<<< HEAD
                                        'data/sprites/spheres_all.png',
                                        0, 0, 16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        1.0 + size,
                                        'data/sprites/spheres_all.png',
                                        0, 0, 16, 16
=======
                                        'dr_sprite3d/data/sprites/sphere_blue.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        2 * j - size + 1,
                                        1.0 + size,
                                        'dr_sprite3d/data/sprites/sphere_blue.png',
                                        16, 16
>>>>>>> 44fa4e81e369f47c0cf2a0bc33c3542dae28661c
    end
  end

  # Green balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new -1.0 - size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
<<<<<<< HEAD
                                        'data/sprites/spheres_all.png',
                                        16, 0, 16, 16
      add_vertex Engine3D::Sprite3D.new 1.0 + size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        16, 0, 16, 16
=======
                                        'dr_sprite3d/data/sprites/sphere_green.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 1.0 + size,
                                        2 * i - size + 1,
                                        2 * j - size + 1,
                                        'dr_sprite3d/data/sprites/sphere_green.png',
                                        16, 16
>>>>>>> 44fa4e81e369f47c0cf2a0bc33c3542dae28661c
    end
  end

  # Red balls :
  size.times do |i|
    size.times do |j|
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        -1.0 - size,
                                        2 * j - size + 1,
<<<<<<< HEAD
                                        'data/sprites/spheres_all.png',
                                        32, 0, 16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        1.0 + size,
                                        2 * j - size + 1,
                                        'data/sprites/spheres_all.png',
                                        32, 0, 16, 16
=======
                                        'dr_sprite3d/data/sprites/sphere_red.png',
                                        16, 16
      add_vertex Engine3D::Sprite3D.new 2 * i - size + 1,
                                        1.0 + size,
                                        2 * j - size + 1,
                                        'dr_sprite3d/data/sprites/sphere_red.png',
                                        16, 16
>>>>>>> 44fa4e81e369f47c0cf2a0bc33c3542dae28661c
    end
  end
end
