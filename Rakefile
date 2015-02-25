require "rake"
require "rake/testtask"

require "bundler"
Bundler.setup(:default)

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"]
  t.verbose = true
end

task :start do
  brain = ConwayGameOfLife::Brain.new
  visualizer = ConwayGameOfLife::Visualizer.new(brain)
  visualizer.show
end

task default: :start