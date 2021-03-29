module Engine3D
  class Sprite3D < Vertex
    attr_sprite

    def primitive_marker
      :sprite
    end
    
    def initialize(x,y,z,atlas,atlas_x,atlas_y,atlas_w,atlas_h)
      super(x,y,z)

      @path     = atlas

      @width    = atlas_w
      @height   = atlas_h

      @x        = -1280
      @y        = -720
      @w        = 15
      @h        = 15
      @angle    = 0
      @r        = 255
      @g        = 255
      @b        = 255
      @a        = 255
      @source_x = atlas_x
      @source_y = atlas_y
      @source_w = atlas_w
      @source_h = atlas_h
    end

    def sprite
      self
    end

    #def draw_override(ffi_draw)
    #  draw_width  = ( sprite_scale *  @width / @view.z.abs ).to_i
    #  draw_height = ( sprite_scale * @height / @view.z.abs ).to_i 

    #  ffi_draw.draw_sprite  @x - ( draw_width >> 1 ),
    #                        @y - ( draw_height >> 1),
    #                        draw_width,
    #                        draw_height,
    #                        @path,
    #                        @angle,
    #                        255, 255, 255, 255, 
    #                        false, false,
    #                        nil, nil, nil, nil,
    #                        0.0, 0.0,
    #                        @source_x, @source_y, @source_w, @source_h
    #end

    def rotate(delta_angle)
      @angle  = ( @angle + delta_angle ) % 360
    end

    def rotate_absolute(angle)
      @angle  = angle
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
