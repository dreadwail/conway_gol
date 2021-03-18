# Conway's Game of Life

This is an implementation of [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in Ruby.


Install
=======

To use:

    gem install conway_gol


Run
===

    conway_gol


Hacking on it
=============

You may need some libs for gosu. See this page for details:

[http://www.libgosu.org/](http://www.libgosu.org/)

Install some dependencies:

    bundle install

If developing locally you can run it with:

    ruby -Ilib bin/conway_gol

Or more conveniently:

    rake start


Tests
=====

    rake test

or:

    rake


Rules
=====

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
