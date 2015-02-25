module ConwayGameOfLife
  class Cell

    attr_reader :x, :y

    def initialize(brain, x, y)
      @x, @y = x, y
      @brain = brain
    end

    private

    attr_reader :brain

  end
end
