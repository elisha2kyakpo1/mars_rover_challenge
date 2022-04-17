class Plateau
  def initialize(end_point, x_axis = 0, y_axis = 0)
    @start_point = [x_axis, y_axis]
    @end_point = end_point
    @rovers = []
  end

  def add_rover(rover)
    @rovers.each do |item|
      if item.current_position.to_s == rover.current_position.to_s
        raise DuplicateRoverError, 'The current position has a rover'
      end
    end
    @rovers.push rover
  end

  def start_rovers
    @rovers.each do |rover|
      next_move = rover.next_coordinate
      if next_move.x_axis > @end_point.x_axis || next_move.x_axis.negative? ||
         next_move.y_axis > @end_point.y_axis || next_move.y_axis.negative?
        raise OutOfPlateauError, 'The rover is out of plateau'
      end

      rover.move
    end
  end

  def rover_positions
    @rovers
  end
end
