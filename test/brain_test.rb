require "test_helper"

class BrainTest < Minitest::Test
  include ConwayGameOfLife

  attr_reader :subject

  def setup
    @subject = Brain.new
  end

  def test_new_game_has_no_cells
    assert_empty subject.cells
  end

  def test_tick_returns_self
    assert_same subject, subject.tick
  end

  def test_nothing_ticks_to_nothing
    assert_empty subject.tick.cells
  end

  def test_cells_are_tracked
    cell = Brain::Cell.new(5, 2)
    subject << cell
    assert_equal [cell], subject.cells
  end

  def test_single_cell_dies_alone
    subject << Brain::Cell.new(2, 2)
    subject.tick
    assert_empty subject.cells
  end

  def test_isolated_cells_die
    subject << Brain::Cell.new(0, 0)
    subject << Brain::Cell.new(2, 2)
    subject << Brain::Cell.new(4, 4)
    subject.tick
    assert_empty subject.cells
  end

  def test_reproduction_row
    subject << Brain::Cell.new(0, 1)
    subject << Brain::Cell.new(1, 1)
    subject << Brain::Cell.new(2, 1)
    subject.tick
    assert_equal [
      Brain::Cell.new(1, 0),
      Brain::Cell.new(1, 1),
      Brain::Cell.new(1, 2),
    ].sort_by { |c| [c.x, c.y] }, subject.cells
  end

end
