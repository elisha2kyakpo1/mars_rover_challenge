require_relative 'information'

class Rover
  attr_reader :x_axis, :y_axis, :position

  def turn_left
    @position.left!
  end

  def turn_right
    @position.right!
  end

  def move
    case direction
    when 'N'
      move_north
    when 'S'
      move_south
    when 'E'
      move_east
    when 'W'
      move_west
    end
  end

  def rover_position(x_axis, y_axis)
    @x = x_axis
    @y = y_axis
  end

  private

  def move_north
    @y = y_axis + 1
  end

  def move_south
    @y = y_axis - 1
  end

  def move_east
    @x = x_axis + 1
  end

  def move_west
    @x = x_axis - 1
  end
end
