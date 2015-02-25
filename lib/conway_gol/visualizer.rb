require "gosu"

module ConwayGameOfLife
  class Visualizer < Gosu::Window
    COLOR = Gosu::Color::WHITE

    WIDTH = 800
    HEIGHT = 800
    CELL_SIZE = 10
    CELL_PADDING = 1
    CELLS_X = WIDTH / CELL_SIZE
    CELLS_Y = WIDTH / CELL_SIZE

    TICK_DELAY = 200

    def initialize(brain)
      super(WIDTH, HEIGHT, false, TICK_DELAY)
      self.caption = "Conway's Game of Life"
      @brain = brain
    end

    def update
      brain.tick
    end

    def draw
      brain.cells.select do |cell|
        cell.x.between?(0, CELLS_X) && cell.y.between?(0, CELLS_Y)
      end.each do |cell|
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
