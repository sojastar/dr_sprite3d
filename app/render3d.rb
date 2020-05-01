module Engine3D
  class Render
    attr_accessor :width, :height, :ratio,
                  :camera,
                  :near, :far

    def initialize(width, height, camera, near, far)
      @width        = width
      @height       = height
      @half_width   = @width  / 2
      @half_height  = @height / 2
      @ratio        = width.to_f / height

      @camera = camera

      @near   = near
      @far    = far
    end

    def vertex_in_frustum?(vertex)
      x = vertex.view.x
      y = vertex.view.y
      z = vertex.view.z
      
      ( z > @near && z < @far && z.abs > x.abs && z.abs > @ratio * y.abs )
    end

    def project_vertex(vertex)
      vertex.compute_view_coordinates(@camera.view_matrix)

      if vertex_in_frustum?(vertex) then
        vertex.x          = @half_width +  (         @half_width  * vertex.view.x / vertex.view.z ).to_i
        vertex.y          = @half_height + (@ratio * @half_height * vertex.view.y / vertex.view.z ).to_i
        vertex.in_frustum = true
      else
        vertex.in_frustum = false
      end
    end

    def project_vertices(vertices)
      @camera.reset_view_matrix

      vertices.each do |vertex|
        vertex.compute_view_coordinates(@camera.view_matrix)

        if vertex_in_frustum?(vertex) then
          vertex.x          = @half_width +  (         @half_width  * vertex.view.x / vertex.view.z ).to_i
          vertex.y          = @half_height + (@ratio * @half_height * vertex.view.y / vertex.view.z ).to_i
          vertex.in_frustum = true
        else
          vertex.in_frustum = false
        end
      end
    end

    def serialize
      { width:  @width,
        height: @height,
        camera: @camera.object_id,
        near:   @near,
        far:    @far }
    end

    def inspect
      serialize.to_s
    end

    def to_s
      serialize.to_s
    end
  end
end
