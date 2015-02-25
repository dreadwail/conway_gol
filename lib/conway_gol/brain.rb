module ConwayGameOfLife
  class Brain

    Cell = Struct.new(:x, :y)

    def tick
    end

    def cells
      [Cell.new(5, 6)]
    end

  end
end
