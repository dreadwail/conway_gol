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

end
