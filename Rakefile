require "rake"
require "rake/testtask"

require "bundler"
Bundler.setup(:default)
require "conway_gol"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

task :start do
  brain = ConwayGameOfLife::Brain.new
  brain << ConwayGameOfLife::Brain::Cell.new(0, 1)
  brain << ConwayGameOfLife::Brain::Cell.new(1, 1)
  brain << ConwayGameOfLife::Brain::Cell.new(2, 1)

  brain << ConwayGameOfLife::Brain::Cell.new(52, 51)
  brain << ConwayGameOfLife::Brain::Cell.new(51, 53)
  brain << ConwayGameOfLife::Brain::Cell.new(52, 53)

  brain << ConwayGameOfLife::Brain::Cell.new(54, 52)
  brain << ConwayGameOfLife::Brain::Cell.new(55, 53)
  brain << ConwayGameOfLife::Brain::Cell.new(56, 53)
  brain << ConwayGameOfLife::Brain::Cell.new(57, 53)

  visualizer = ConwayGameOfLife::Visualizer.new(brain)
  visualizer.show
end

task default: :start
