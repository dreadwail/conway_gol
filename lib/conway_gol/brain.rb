module ConwayGameOfLife
  class Brain

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
