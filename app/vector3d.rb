module Engine3D
  class Vector
    attr_accessor :components

    def initialize(x, y, z, w)
      @components     = [x,y,z,w]
    end

    def [](i)     @components[i] end

    def x() @components.value(0) end
    def y() @components.value(1) end
    def z() @components.value(2) end
    def w() @components.value(3) end

    def []=(i,v)  @components[i] = v end

    def x=(x) @components[0] = x end
    def y=(y) @components[1] = y end
    def z=(z) @components[2] = z end
    def w=(v) @components[3] = v end

    def set(x,y,z,w)
      @components[0] = x
      @components[1] = y
      @components[2] = z
      @components[3] = w
    end

    def translate(dx, dy, dz)
      @components[0] += dx
      @components[1] += dy
      @components[2] += dz
    end

    def ==(other)
      equality = true
      4.times { |i| equality = false if ( @components.value(i) - other.components.value(i) ).abs >= Engine3D::PRECISION }

      equality
    end

    def reverse
      Vector.new( -@components.value(0),
                  -@components.value(1),
                  -@components.value(2),
                   @components.value(3) )
    end

    def reverse!
      @components[0] *= -1.0 
      @components[1] *= -1.0 
      @components[2] *= -1.0 
    end

    def *(scalar)
      Vector.new( scalar * @components.value(0),
                  scalar * @components.value(1),
                  scalar * @components.value(2),
                  1.0 )
    end

    def squared_magnitude
      @components.value(0) * @components.value(0) +
      @components.value(1) * @components.value(1) +
      @components.value(2) * @components.value(2)
    end

    def magnitude
      Math::sqrt( @components.value(0) * @components.value(0) +
                  @components.value(1) * @components.value(1) +
                  @components.value(2) * @components.value(2) )
    end

    def normalized
      m = magnitude
      Vector.new( @components.value(0) / m,
                  @components.value(1) / m,
                  @components.value(2) / m,
                  1.0 )
    end

    def normalized!
      m               = magnitude
      @components[0] /= m
      @components[1] /= m
      @components[2] /= m
      @components[3]  = 1.0

      self 
    end

    def rotate_x(angle)
      s = Math::sin(angle)
      c = Math::cos(angle)

      Vector.new( @components.value(0),
                  @components.value(1) * c - @components.value(2) * s,
                  @components.value(1) * s + @components.value(2) * c,
                  @components.value(3) )
    end

    def rotate_y(angle)
      s = Math::sin(angle)
      c = Math::cos(angle)

      Vector.new(  @components.value(0) * c + @components.value(2) * s,
                   @components.value(1),
                  -@components.value(0) * s + @components.value(2) * c,
                   @components.value(3) )
    end

    def rotate_z(angle)
      s = Math::sin(angle)
      c = Math::cos(angle)

      Vector.new( @components.value(0) * c - @components.value(1) * s,
                  @components.value(0) * s + @components.value(1) * c,
                  @components.value(2),
                  @components.value(3) )
    end

    def cross(other)
      cx = @components.value(1) * other.components.value(2) - @components.value(2) * other.components.value(1)
      cy = @components.value(2) * other.components.value(0) - @components.value(0) * other.components.value(2)
      cz = @components.value(0) * other.components.value(1) - @components.value(1) * other.components.value(0)

      Vector.new(cx, cy, cz, 1.0)
    end

    def to_s()
      "x:#{x}, y:#{y}, z:#{z}, w:#{w}"
    end
  end 
end
