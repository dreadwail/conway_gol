module ConwayGameOfLife
  class Brain

    Cell = Struct.new(:x, :y)

    def initialize
      @lookup = {}
    end

    def cells
      lookup.map { |(x, y)| y.values }.flatten
    end

    def <<(cell)
      (lookup[cell.x] ||= {})[cell.y] = cell
    end

    def tick
      lookup.clear
      self
    end

    private

    attr_reader :lookup

  end
end
