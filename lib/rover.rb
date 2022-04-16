require_relative 'information'

class Rover
  attr_reader :x, :y

  def initialize; end

  def turn_left
    @heading.left!
  end

  def turn_right
    @heading.right!
  end

  def move
    case heading
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

  def heading=(head)
    @heading = Heading.new(head)
    heading
  end

  def heading
    @heading && @heading.direction
  end

  def position(x, y)
    @x = x
    @y = y
  end

  private

  def move_north
    @y = y + 1
  end

  def move_south
    @y = y - 1
  end

  def move_east
    @x = x + 1
  end

  def move_west
    @x = x - 1
  end
end
