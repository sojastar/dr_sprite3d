require 'app/constants3d.rb'
require 'app/vector3d.rb'
require 'app/matrix3d.rb'
require 'app/vertex3d.rb'
require 'app/body3d.rb'
require 'app/camera3d.rb'
require 'app/render3d.rb'
require 'app/sprite3d.rb'
require 'app/scene3d.rb'





# ---=== CONSTANTS : ===---
SPRITE_SCALE      = 80 
HALF_SPRITE_SCALE = SPRITE_SCALE >> 1

# DEBUG :
FRAME_SKIP        = 15 





# ---=== SETUP : ===---
def setup(args)
  position              = Engine3D::Vector.new 0.0, 0.0, 0.0, 1.0
  direction             = Engine3D::Vector.new 0.0, 0.0,-1.0, 1.0
  args.state.camera     = Engine3D::Camera.new position, direction
  args.state.renderer   = Engine3D::Render.new 1280, 720, args.state.camera, 1.0, 300.0

  #args.state.scene      = Engine3D::Scene.load 'sprite3dengine/data/scenes/debug.rb'
  args.state.scene      = Engine3D::Scene.load 'sprite3dengine/data/scenes/scene1.rb'
  #args.state.scene      = Engine3D::Scene.load 'sprite3dengine/data/scenes/demo.rb'

  args.state.angle        = 0.01
  #args.state.camera_angle = 0.001

  # DEBUG :
  #args.state.frame_counter  = 0
  
  args.state.static_sprites <<  Array.new(600) do
                                  Engine3D::Sprite3D.new  0.0, 0.0, 100.0,
                                                          'sprite3dengine/data/sprites/sphere_blue.png',
                                                          16, 16
                                end

  args.state.setup_done = true

  puts "setup finished!!!"
end





# ---=== MAIN LOOP : ===---
def tick(args)
  
  # SETUP :
  setup(args) unless args.state.setup_done

  # MAIN LOOP :
  
  # 1. GAME LOGIC :

  args.state.scene.bodies.each do |body|
    body.rotate_absolute( { :x => args.state.angle, :y => 2*args.state.angle, :z => 1.5*args.state.angle } )

  #  args.state.camera.rotate_y args.state.camera_angle
    args.state.angle += 0.01
  end


  # 2. RENDERING :
  args.outputs.solids << [0,   0, 1280, 306, 0, 0, 231]
  args.outputs.solids << [0, 306, 1280, 719, 180, 180, 231]

  render_list = []
  args.state.scene.bodies.each do |body|
    body.vertices.each { |vertex| vertex.compute_world_coordinates(body.world_matrix) }

    args.state.renderer.project_vertices(body.vertices)
    render_list << body.vertices.select { |vertex| vertex.in_frustum }
  end

  ordered_render_list = render_list.flatten.sort_by { |v| v.view.z }.reverse

  #ordered_render_list.each do |vertex|
  #  vertex.update(SPRITE_SCALE)
  #  args.outputs.sprites << vertex
  #end

  args.outputs.sprites << ordered_render_list.map { |vertex| vertex.update(SPRITE_SCALE); vertex }

  # DEBUG :
  args.outputs.labels << [10, 30, "FPS: #{args.gtk.current_framerate.to_s.to_i}", 0, 0, 0, 255]
  #args.state.frame_counter -= 1
end
