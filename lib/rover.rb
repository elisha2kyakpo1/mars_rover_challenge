require_relative 'exceptions'

class Rover
  TURN = { 'L' => -90, 'R' => 90 }.freeze
  DIRECTION = { 'N' => 0, 'E' => 90, 'S' => 180, 'W' => 270 }.freeze
  DIRECTION_COORDINATES = {
    'N' => [0, 1],
    'E' => [1, 0],
    'S' => [0, -1],
    'W' => [-1, 0]
  }.freeze

  attr_accessor :x_axis, :y_axis, :direction

  def initialize(x_axis = 0, y_axis = 0, direction = 'N')
    valid_position(x_axis, y_axis)
    valid_direction(direction)
    @x_axis = x_axis
    @y_axis = y_axis
    @direction = direction
    set_direction_cordinates
  end

  def control_signal(command)
    valid_control_signal(command)
    change_direction(command) and return if TURN.keys.include?(command)
    move(1, 1) and return if command == 'M'
  end

  def move(displacement_x, displacement_y)
    set_direction_cordinates
    @x_axis += displacement_x * @direction_x
    @y_axis += displacement_y * @direction_y
  end

  def change_direction(turn)
    current_direction_value = DIRECTION[@direction]
    turn_value = TURN[turn]
    @new_direction_value = current_direction_value + turn_value
    check_boundaries
    @direction = DIRECTION.key(@new_direction_value)
  end

  private

  def check_boundaries
    @new_direction_value = 270 if @new_direction_value.negative?
    @new_direction_value = 0 if @new_direction_value > 270
  end

  def set_direction_cordinates
    @direction_x = DIRECTION_COORDINATES[@direction][0]
    @direction_y = DIRECTION_COORDINATES[@direction][1]
  end

  def valid_position(x_axis, y_axis)
    raise InvalidPosition, 'Position should be a number' unless x_axis.is_a?(Integer) || y_axis.is_a?(Integer)
  end

  def valid_direction(direction)
    raise InvalidDirection, 'Invalid direction input ' unless DIRECTION.keys.include?(direction)
  end

  def valid_control_signal(command)
    raise InvalidControlSignal, 'Invalid signal control' unless (TURN.keys + ['M']).include?(command)
  end
end
