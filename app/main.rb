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
  # Camera
  position              = Engine3D::Vector.new 0.0, 0.0, 0.0, 1.0
  direction             = Engine3D::Vector.new 0.0, 0.0,-1.0, 1.0
  args.state.camera     = Engine3D::Camera.new position, direction
  
  # Renderer :
  args.state.renderer   = Engine3D::Render.new 1280, 720, args.state.camera, 1.0, 300.0

  # Scene :
  #args.state.scene      = Engine3D::Scene.load 'dr_sprite3d/data/scenes/debug.rb'
  args.state.scene      = Engine3D::Scene.load 'dr_sprite3d/data/scenes/scene1.rb'

  # Miscellenaous :
  args.state.angle        = 0.01


  args.state.setup_done = true
end





# ---=== MAIN LOOP : ===---
def tick(args)
  
  # SETUP :
  setup(args) unless args.state.setup_done

  # MAIN LOOP :
  
  # 1. GAME LOGIC :

  args.state.scene.bodies.each do |body|
    body.rotate_absolute( { :x => args.state.angle, :y => 2*args.state.angle, :z => 1.5*args.state.angle } )
    args.state.angle += 0.01
  end


  ## 2. RENDERING :
  args.outputs.solids << [0,   0, 1280, 306, 0, 0, 231]
  args.outputs.solids << [0, 306, 1280, 719, 180, 180, 231]

  render_list = []
  args.state.scene.bodies.each do |body|
    args.state.camera.reset_view_matrix
    render_list  += body.vertices.select do |vertex|
                      vertex.compute_world_coordinates(body.world_matrix)
                      args.state.renderer.project_vertex(vertex)
                      vertex.in_frustum
                    end
    #body.vertices.each { |vertex| vertex.compute_world_coordinates(body.world_matrix) }

    #args.state.renderer.project_vertices(body.vertices)
    #render_list += body.vertices.select { |vertex| vertex.in_frustum }
  end

  ordered_render_list = render_list.sort { |v1,v2| v2.view.z <=> v1.view.z }

  args.outputs.sprites << ordered_render_list.map { |vertex| vertex.z_scale(SPRITE_SCALE) }

  # DEBUG :
  args.outputs.labels << [10, 700, "FPS: #{args.gtk.current_framerate.to_s.to_i}", 0, 0, 0, 255]
end
