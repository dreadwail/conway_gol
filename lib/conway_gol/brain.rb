module ConwayGameOfLife
  class Brain

    Cell = Struct.new(:x, :y)

    attr_reader :cells

    def initialize
      @cells = []
    end

    def tick
      cells.clear
      self
    end

  end
end
