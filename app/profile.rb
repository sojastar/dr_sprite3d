require './sprite3dengine/app/constants3d.rb'
require './sprite3dengine/app/vector3d.rb'
require './sprite3dengine/app/matrix3d.rb'
require './sprite3dengine/app/vertex3d.rb'
require './sprite3dengine/app/body3d.rb'
require './sprite3dengine/app/camera3d.rb'
require './sprite3dengine/app/render3d.rb'
require './sprite3dengine/app/sprite3d.rb'
require './sprite3dengine/app/scene3d.rb'





# ---=== CONSTANTS : ===---
SPRITE_SCALE      = 80 
HALF_SPRITE_SCALE = SPRITE_SCALE >> 1





# ---=== SETUP : ===---
position    = Engine3D::Vector.new 0.0, 0.0, 0.0, 1.0
direction   = Engine3D::Vector.new 0.0, 0.0,-1.0, 1.0
@camera     = Engine3D::Camera.new position, direction
@renderer   = Engine3D::Render.new 1280, 720, @camera, 1.0, 300.0

#@scene    = Engine3D::Scene.load 'sprite3dengine/data/scenes/debug.rb'
#@scene    = Engine3D::Scene.load 'sprite3dengine/data/scenes/scene1.rb'
@scene      = Engine3D::Scene.load 'sprite3dengine/data/scenes/demo.rb'

puts "setup finished!!!"
puts Process.pid





# ---=== MAIN LOOP : ===---
loop do
 
  # 1. GAME LOGIC :
  @scene.bodies[0].translate(0.0, 0.0, 0.25)
  if @scene.bodies[0].z >= -46.0 then
    @scene.bodies[0].move_to(0.0, -6.0, -50.0)
  end


  # 2. RENDERING :
  render_list = []
  @scene.bodies.each do |body|
    body.vertices.each { |vertex| vertex.compute_world_coordinates(body.world_matrix) }

    @renderer.project_vertices(body.vertices)
    render_list << body.vertices.select { |vertex| vertex.in_frustum }
  end

  ordered_render_list = render_list.flatten.sort_by { |v| v.view.z }.reverse

  ordered_render_list.each do |vertex|
    vertex.update(SPRITE_SCALE)
    #args.outputs.sprites << vertex
  end

end
