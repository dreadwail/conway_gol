module ConwayGameOfLife
  class Brain

    attr_reader :cells

    def initialize
      @cells = Hash.new({})
    end

    def spawn(x, y)
      @cells[x][y] = true
    end

    def tick
      cells.clear
      self
    end

  end
end
