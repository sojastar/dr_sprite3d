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
SPRITE_SCALE  = 80 





# ---=== SETUP : ===---
def setup(args)
  # Camera
  position              = Engine3D::Vector.new 0.0, 0.0, 0.0, 1.0
  direction             = Engine3D::Vector.new 0.0, 0.0,-1.0, 1.0
  args.state.camera     = Engine3D::Camera.new position, direction
  
  # Renderer :
  args.state.renderer   = Engine3D::Render.new  1280, 720,          # viewport size 
                                                args.state.camera,  # camera
                                                1.0, 300.0          # near and far planes

  # Scene :
  args.state.scene      = Engine3D::Scene.load  args,
                                                'data/scenes/scene1.rb',
                                                SPRITE_SCALE

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
  
  # Backgound :
  args.outputs.solids << [0,   0, 1280, 306, 0, 0, 231]
  args.outputs.solids << [0, 306, 1280, 719, 180, 180, 231]

  # Sprites :
  args.state.renderer.render_scene args, args.state.scene


  # DEBUG :
  args.outputs.labels << [10, 700, "FPS: #{args.gtk.current_framerate.to_s.to_i}", 0, 0, 0, 255]
end
