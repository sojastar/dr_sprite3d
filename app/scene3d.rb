module Engine3D
  class Scene
    attr_accessor :bodies

    def initialize(&block)
      @bodies = []

      instance_eval &block
    end

    def self.load(filepath)
      scene_description = $gtk.read_file filepath
      instance_eval scene_description
    end

    def load_and_move_to(filepath, x, y, z)
      body = Engine3D::Body.load filepath
      body.move_to x, y, z 
      @bodies << body 
    end

    def serialize
      { id:     object_id,
        bodies: @bodies }
    end

    def inspect
      serialize.to_s
    end

    def to_s
      serialize.to_s
    end
  end
end
