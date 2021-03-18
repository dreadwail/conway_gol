$:.push File.expand_path("../lib", __FILE__)
require "conway_gol/version"

Gem::Specification.new do |s|

  s.name = "conway_gol"
  s.version = ConwayGameOfLife::VERSION
  s.authors = ["Dreadwail"]
  s.summary = "Conway's Game of Life implemented in ruby."
  s.description = "This is an implementation of Conway's Game of Life for a Seattle.rb workshop."
  s.licenses = ["MIT"]
  s.homepage = "https://github.com/dreadwail/conway_gol"
  s.email = "dreadwail42@gmail.com"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_runtime_dependency "gosu", "~> 0.8"

end
