module Engine3D
  class Game
    attr_accessor :scene,
                  :loop

    def initialize(state,scene,&block)
      @state  = state
      @scene  = nil#Engine3D::Scene.load scene
      @loop   = block
    end

    def run() instance_eval @loop end
  end
end
