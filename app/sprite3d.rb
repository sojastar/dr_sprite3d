module Engine3D
  class Sprite3D < Vertex
    attr_accessor :x, :y, :w, :h,
                  :path, :angle,
                  :a, :r, :g, :b,
                  :tile_x, :tile_y, :tile_w, :tile_h,
                  :source_x, :source_y, :source_w, :source_h,
                  :flip_horizontally, :flip_vertically,
                  :angle_anchor_x, :angle_anchor_y

    def primitive_marker
      :sprite
    end
    
    def initialize(x,y,z,path,width,height)
      super(x,y,z)

      @path   = path

      @width  = width
      @height = height

      @x      = -1280
      @y      = -720
      @w      = 15
      @h      = 15
      @r      = 255
      @g      = 255
      @b      = 255
      @a      = 255
    end

    def sprite
      self
    end

    def z_scale(sprite_scale)
      @w = ( sprite_scale *  @width / @view.z.abs ).to_i 
      @h = ( sprite_scale * @height / @view.z.abs ).to_i 
      @x -= @w / 2
      @y -= @h / 2

      self
    end

    def serialize
      { path:   path,
        width:  width,
        height: height }
    end

    def inspect
      serialize.to_s
    end

    def to_s
      serialize.to_s
    end
  end
end
