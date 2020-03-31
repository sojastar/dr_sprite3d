module Engine3D
  class Scene
    attr_accessor :bodies

    def initialize(&block)
      @bodies = []

      instance_eval &block
    end

    def self.load(filepath)
      scene_description = nil
      #File.open(filepath, 'r') { |f| body_description = f.read }
      f=File.open(filepath, 'r')
      scene_description = f.read
      f.close

      instance_eval scene_description
    end

    def load_and_move_to(filepath, x, y, z)
      body = Engine3D::Body.load filepath
      body.move_to x, y, z 
      @bodies << body 
    end
  end
end
