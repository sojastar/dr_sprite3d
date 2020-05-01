module Engine3D 
  class Vertex
    attr_accessor :local, :world, :view,
                  :processed, # :unprocessed
                              # :world_coords_calculated
                              # :view_coords_calculated
                  :in_frustum,
                  :screen_x, :screen_y

    def initialize(x,y,z)
      @local      = Engine3D::Vector.new(x,y,z,1.0)
      @processed  = :unprocessed
      @in_frustum = false
      @screen_x = 0
      @screen_y = 0
    end

    def compute_world_coordinates(matrix)
      # the matrix is a matrix describing the vertex's parent body's ...
      # ... position and orientation in world space
      #@world      = matrix * @local if @processed != :world_coords_calculated
      @world      = matrix.mul_vect_3d(@local) if @processed != :world_coords_calculated
      @processed  = :world_coords_calculated
    end

    def compute_view_coordinates(matrix)
      # the matrix is a matrix describing the camera's position ...
      # ... and orientation in world space
      #if @processed != :view_coords_calculated then
      #  @view       = matrix * @world
      #  @processed  = :view_coords_calculated
      #end
      @view       = matrix.mul_vect_3d(@world) if @processed != :view_coords_calculated
      @processed  = :view_coords_calculated 
    end

    def reset() @processed = :unprocessed end

    def ==(other) @local == other.local end

    def serialize
      { local: @local, world: @world, view: @view }
    end

    def inspect
      case @processed
      when :unprocessed
        "--- local: (#{@local.x},#{@local.y},#{@local.z})"

      when :world_coords_calculated
        "--- local: (#{@local.x},#{@local.y},#{@local.z})\n" \
        "--- world: (#{@world.x},#{@world.y},#{@world.z})"

      when :view_coords_calculated
        "--- local: (#{@local.x},#{@local.y},#{@local.z})\n " \
        "--- world: (#{@world.x},#{@world.y},#{@world.z})\n" \
        "--- view:  (#{@view.x},#{@view.y},#{@view.z})"
      end
    end

    def to_s
      inspect
    end
  end
end
