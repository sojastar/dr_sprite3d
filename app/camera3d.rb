module Engine3D 
  class Camera
    #attr_accessor :view_matrix
    attr_accessor :position, :direction,
                  :view_matrix_status

    def initialize(position, direction)
      @position           = position
      @direction          = direction
      @view_matrix        = nil
      @view_matrix_status = :not_computed 
    end 

    def move_to(x,y,z)
      @position.x = x
      @position.y = y
      @position.z = z
    end

    def translate(dx,dy,dz)
      @position.x += dx
      @position.y += dy
      @position.z += dz
    end

    def look_at(x,y,z)
      @direction.x = x
      @direction.y = y
      @direction.z = z
    end

    def rotate_x(angle) @direction = @direction.rotate_x(angle) end
    def rotate_y(angle) @direction = @direction.rotate_y(angle) end
    def rotate_z(angle) @direction = @direction.rotate_z(angle) end

    def rotate(rotations)
      rotations.each_pair { |axis,angle| self.send("rotate_#{axis}".to_sym,angle) }
    end

    def reset_view_matrix() @view_matrix_status = :not_computed  end

    def view_matrix
      if @view_matrix_status == :not_computed
        right_axis          = Engine3D::Vector.new(0.0, 1.0, 0.0, 1.0).cross(@direction).normalized
        up_axis             = @direction.cross(right_axis).normalized
        rotation_matrix     = Engine3D::Matrix.new([[right_axis.x, right_axis.y, right_axis.z, 0.0],
                                                    [   up_axis.x,    up_axis.y,    up_axis.z, 0.0],
                                                    [@direction.x, @direction.y, @direction.z, 0.0],
                                                    [         0.0,          0.0,          0.0, 1.0]]) 

        translation_matrix  = Engine3D::Matrix.new([[1.0, 0.0, 0.0, -@position.x],
                                                    [0.0, 1.0, 0.0, -@position.y],
                                                    [0.0, 0.0, 1.0, -@position.z],
                                                    [0.0, 0.0, 0.0,          1.0]])

        @view_matrix        = rotation_matrix * translation_matrix
        @view_matrix_status = :computed
      end

      @view_matrix
    end

    def inspect
      "- camera #{object_id}\n" \
      "- position:  (#{@position.x}, #{@position.y}, #{@position.z})\n" \
      "- direction: (#{@direction.x}, #{@direction.y}, #{@direction.z})"
    end
  end
end
