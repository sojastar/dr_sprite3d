require           'minitest/pride'

require_relative  '../app/constants3d.rb'
require_relative  '../app/vector3d.rb'
require_relative  '../app/matrix3d.rb'
require_relative  '../app/vertex3d.rb'
require_relative  '../app/sprite3d.rb'
require_relative  '../app/body3d.rb'
require_relative  '../app/camera3d.rb'
require_relative  '../app/render3d.rb'
require_relative  '../app/game3d.rb'

class Array
  alias_method :value, :[] 
end
