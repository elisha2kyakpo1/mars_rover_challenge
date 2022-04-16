#!/usr/bin/env ruby

require_relative '../lib/input'

input = $stdin.read

unless input.empty?
  processor = InputProcessor.new(input, $stdin)
  processor.process
end

# rover = Rover.new('1 2 N')
# puts '************INITIALMOVES************'
# puts rover.x_coordinate
# puts rover.y_coordinate
# puts rover.direction
# puts '************VALUES AFTER MOVE LEFT************'
# rover.command('LMLMLMLMM')
# puts rover.x_coordinate
# puts rover.y_coordinate
# puts rover.direction

# rover2 = Rover.new('3 3 E')
# puts '>>>>>>>>>>>>************INITIALMOVES************<<<<<<<<<<<<<<'
# puts rover2.x_coordinate
# puts rover2.y_coordinate
# puts rover2.direction

# puts '*************VAUES AFTER MOVE RIGHT***********'
# rover2.command('MMRMMRMRRM')
# puts rover2.x_coordinate
# puts rover2.y_coordinate
# puts rover2.direction
