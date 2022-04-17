class Plateau
  GRID_X = 5
  GRID_Y = 5

  def initialize(end_point, x_axis = 0, y_axis = 0)
    @start_point = [x_axis, y_axis]
    @end_point = end_point
    @rovers = []
  end

  def add_rover(rover)
    @rovers.each do |item|
      raise DuplicateRoverError, 'The current position has a rover' if item.x_axis
    end
    @rovers << rover
  end

  def start_rovers
    @rovers.each do |rover|
      if @x_axis > GRID_X || @y_axis > GRID_Y
        puts 'Your Rover has reached the upper limit of the grid'
        abort
      elsif @x_axis.negative? || @y_axis.negative?
        puts 'Your Rover has reached the lower limit of the grid'
        abort
      end

      rover.move
    end
  end

  def rover_positions
    @rovers
  end
end
