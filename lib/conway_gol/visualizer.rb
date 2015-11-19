require "gosu"

module ConwayGameOfLife
  class Visualizer < Gosu::Window
    COLOR = Gosu::Color::WHITE

    CELL_SIZE = 20
    CELL_PADDING = 1
    TICK_DELAY = 50

    def initialize(world)
      super(
        world.width * CELL_SIZE,
        world.height * CELL_SIZE, 
        false,
        TICK_DELAY
      )
      self.caption = "Conway's Game of Life"
      @world = world
    end

    def update
      world.tick
    end

    def draw
      world.cells
        .select { |(x, y)| x.between?(0, world.width) && y.between?(0, world.height) }
        .each { |(x, y)| draw_cell(x, y) }
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    def draw_cell(x, y)
      x1, y1 = x * CELL_SIZE, y * CELL_SIZE
      cell_dimension = CELL_SIZE - CELL_PADDING
      x2, y2 = x1 + cell_dimension, y1 + cell_dimension
      draw_quad(
        x1, y1, COLOR,
        x1, y2, COLOR,
        x2, y2, COLOR,
        x2, y1, COLOR
      )
    end
    
    private

    attr_reader :world

  end
end
