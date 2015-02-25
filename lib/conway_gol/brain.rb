module ConwayGameOfLife
  class Brain

    Cell = Struct.new(:x, :y)

    def initialize
      @lookup = {}
    end

    def cells
      lookup.map { |(x, y)| y.values }.flatten.sort_by { |c| [c.x, c.y] }
    end

    def <<(cell)
      (lookup[cell.x] ||= {})[cell.y] = cell
    end

    def tick
      to_kill = reap_candidates
      to_birth = reproduce_candidates
      to_kill -= to_birth
      to_kill.each do |(x,y)|
        cell = cell_at(x,y)
        kill(cell) unless cell.nil?
      end
      to_birth.each do |(x,y)|
        self << Cell.new(x,y)
      end
      self
    end

    private

    def reap_candidates
      cells.select do |cell|
        neighbor_count = neighbors(cell.x, cell.y).length
        neighbor_count < 2 || neighbor_count > 3
      end.map do |cell|
        [cell.x, cell.y]
      end
    end

    def reproduce_candidates
      cells
        .map { |c| search_space(c.x, c.y) }.flatten(1).uniq
        .select { |(x,y)| cell_at(x, y).nil? }
        .select { |(x,y)| neighbors(x, y).length == 3 }
    end

    def neighbors(x, y)
      search_space(x, y).map { |(x,y)| cell_at(x, y) }.compact
    end

    def search_space(x, y)
      xspace = [x - 1, x, x + 1]
      yspace = [y - 1, y, y + 1]
      xspace.product(yspace) - [[x, y]]
    end

    def cell_at(x, y)
      lookup.fetch(x, {})[y]
    end

    def kill(cell)
      lookup.fetch(cell.x, {}).delete(cell.y)
    end

    attr_reader :lookup

  end
end
