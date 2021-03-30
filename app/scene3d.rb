module Engine3D
  class Scene
    attr_reader :bodies

    def initialize(&block)
      @bodies = []

      instance_eval &block
    end

    def self.load(args,filepath,scale)
      scene_description = $gtk.read_file filepath
      new_scene = instance_eval scene_description

      new_scene.sprites.each { |sprite| sprite.set_scale(scale) }
    
      args.outputs.static_sprites << new_scene.sprites

      new_scene
    end

    def load_and_move_to(filepath, x, y, z)
      body = Engine3D::Body.load filepath
      body.move_to x, y, z 
      @bodies << body 
    end

    def sprites
      @bodies.inject([]) { |all_sprites,body| all_sprites += body.sprites }
    end

    def count_sprites
      @bodies.inject(0) { |count,body| count += body.sprites.length }
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
