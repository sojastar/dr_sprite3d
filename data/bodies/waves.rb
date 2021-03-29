# ---=== WAVES : ===---

Engine3D::Body.new do
  # VARIABLES :
  width         = 20
  width_scale   = 3.92#4.0
  length        = 18 
  length_scale  = 4.0

  # WAVES MULTIPLICATION CODE :
  length.times do |z|
    width.times do |x|
      add_vertex Engine3D::Sprite3D.new width_scale * ( x - width / 2.0 + 0.5),
                                        0.0,
                                        4.0 * z.to_f - length / 2.0,
                                        'dr_sprite3d/data/sprites/wave1.png', 32, 16
    end
  end
end
