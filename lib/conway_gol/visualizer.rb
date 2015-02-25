require "gosu"

module ConwayGameOfLife
  class Visualizer < Gosu::Window
    COLOR = Gosu::Color::WHITE

    CELL_SIZE = 10
    CELL_PADDING = 1

    def initialize(brain)
      super(800, 800, false)
      self.caption = "Conway's Game of Life"
      @brain = brain
    end

    def update
      brain.tick
    end

    def draw
      brain.cells.each do |cell|
        draw_cell(cell)
      end
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    def draw_cell(cell)
      x1, y1 = cell.x * CELL_SIZE, cell.y * CELL_SIZE
      cell_dimension = CELL_SIZE - CELL_PADDING
      x2, y2 = x1 + cell_dimension, y1 + cell_dimension
      draw_quad(x1, y1, COLOR, x1, y2, COLOR, x2, y2, COLOR, x2, y1, COLOR)
    end
    
    private

    attr_reader :brain

  end
end
