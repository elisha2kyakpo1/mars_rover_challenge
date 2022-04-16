require_relative '../lib/mars_rover'

rover1 = MarsRover.new(1, 2, 'N')
%w[L M L M L M L M M].each do |command|
  rover1.control_signal(command)
end
puts "Position => #{rover1.x_axis} #{rover1.y_axis} #{rover1.direction}"

rover2 = MarsRover.new(3, 3, 'E')
%w[M M R M M R M R R M].each do |command|
  rover2.control_signal(command)
end
puts "Position => #{rover2.x_axis} #{rover2.y_axis} #{rover2.direction}"

rover3 = MarsRover.new(3, 5, 'S')
%w[M M R M M R M R R M].each do |command|
  rover3.control_signal(command)
end
puts "Position => #{rover3.x_axis} #{rover3.y_axis} #{rover3.direction}"
