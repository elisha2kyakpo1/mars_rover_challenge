require_relative '../lib/rover'

rover1 = Rover.new(1, 3, 'N')
%w[L M L M L M L M M].each do |command|
  rover1.control_signal(command)
end
puts "Position = #{rover1.x_axis}, #{rover1.y_axis} #{rover1.direction}"

rover2 = Rover.new(3, 5, 'S')
%w[M M R M M R M R R M].each do |command|
  rover2.control_signal(command)
end
puts "Position = #{rover2.x_axis}, #{rover2.y_axis} #{rover2.direction}"
