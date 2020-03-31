module SpriteAttributes
  attr_accessor :x, :y, :w, :h, :path, :angle, :a, :r, :g, :b, :tile_x,
    :tile_y, :tile_w, :tile_h, :flip_horizontally,
    :flip_vertically, :angle_anchor_x, :angle_anchor_y

  def primitive_marker
    :sprite
  end
end

module Engine3D
  class Sprite3D < Vertex
    include SpriteAttributes
    attr_accessor :file, :width, :height
    
    def initialize(x,y,z,file,width,height)
      super(x,y,z)

      #@file   = file
      @width  = width
      @height = height

      @x    = -1280
      @y    = -720
      @w    = 15
      @h    = 15
      @r    = 255
      @g    = 255
      @b    = 255
      @a    = 255
      @path = file
    end

    def sprite
      self
    end

    def update(sprite_scale)
      @w = ( sprite_scale *  @width / @view.z.abs ).to_i 
      @h = ( sprite_scale * @height / @view.z.abs ).to_i 
      @x -= @w / 2
      @y -= @h / 2
    end

    def inspect
      super
    end
  end
end
