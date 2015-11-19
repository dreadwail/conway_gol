require "test_helper"

class WorldTest < Minitest::Test
  include ConwayGameOfLife

  def test_new_unspecified_cells_game_has_minimum_width
    assert_equal World::MIN_WIDTH, World.new.width
  end

  def test_new_unspecified_cells_game_has_minimum_height
    assert_equal World::MIN_HEIGHT, World.new.height
  end

  def test_tick_returns_self
    subject = World.new
    assert_same subject, subject.tick
  end

  def test_nothing_ticks_to_nothing
    assert_empty World.new.tick.cells
  end

  def test_cells_are_tracked
    subject = World.new(cells: [[5, 2]])
    assert_equal [[5, 2]], subject.cells
  end

  def test_single_cell_dies_alone
    assert_empty World.new(cells: [[2, 2]]).tick.cells
  end

  def test_isolated_cells_die
    assert_empty World.new(cells: [
      [0, 0],
      [2, 2],
      [4, 4]
    ]).tick.cells
  end

  def test_reproduction_row
    subject = World.new(cells: [
      [0, 1],
      [1, 1],
      [2, 1]
    ])
    subject.tick
    assert_equal [[1, 0], [1, 1], [1, 2]].sort, subject.cells.sort
  end

end
