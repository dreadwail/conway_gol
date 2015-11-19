module ConwayGameOfLife
  class World

    MIN_WIDTH  = 40
    MIN_HEIGHT = 40

    attr_accessor :cells

    def initialize(cells: Array.new(MIN_HEIGHT, Array.new(MIN_WIDTH, 0)))
      @cells = cells
    end

    def width
      [cells[0] && cells[0].length, MIN_WIDTH].max
    end

    def height
      [cells.length, MIN_HEIGHT].max
    end

    def tick
      self.cells = (cells - reaped + sown).uniq
      self
    end

    private

    def reaped
      cells.select { |(x, y)| !neighbors(x, y).length.between?(2, 3) }
    end

    def sown
      cells
        .map { |(x,y)| search_space(x, y) }
        .flatten(1).uniq
        .select { |(x,y)| !cells.include?([x, y]) }
        .select { |(x,y)| neighbors(x, y).length == 3 }
    end

    def neighbors(x, y)
      search_space(x, y).select { |(x, y)| cells.include?([x, y]) }
    end

    def search_space(x, y)
      xspace = [x - 1, x, x + 1]
      yspace = [y - 1, y, y + 1]
      xspace.product(yspace) - [[x, y]]
    end

  end
end
