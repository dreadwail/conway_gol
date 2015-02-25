require "test_helper"

class BrainTest < Minitest::Test

  attr_reader :subject

  def setup
    @subject = ConwayGameOfLife::Brain.new
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
    cell = ConwayGameOfLife::Cell.new(5, 2)
    subject.cells << cell
    assert_equal [cell], subject.cells
  end

  def test_single_cell_dies_alone
    subject.cells << ConwayGameOfLife::Cell.new(2, 2)
    subject.tick
    assert_empty subject.cells
  end

  def test_isolated_cells_die
    [
      ConwayGameOfLife::Cell.new(0, 0),
      ConwayGameOfLife::Cell.new(2, 2),
      ConwayGameOfLife::Cell.new(4, 4)
    ].each do |cell|
      subject.cells << cell
    end
    subject.tick
    assert_empty subject.cells
  end

end
