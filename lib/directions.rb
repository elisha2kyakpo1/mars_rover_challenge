class RoverInput
  VALID_INPUT = %w[N E S W].freeze

  attr_reader :direction

  def initialize(direction)
    direction = direction.to_s.upcase

    throw ArgumentError.new('Invalid heading') unless VALID_INPUT.include?(direction)

    @direction = direction
  end

  def left!
    @direction = left
  end

  def left
    idx = VALID_INPUT.index(direction)
    next_move_index = (VALID_INPUT.count + (idx - 1)) % VALID_INPUT.count
    VALID_INPUT[next_move_index]
  end

  def right!
    @direction = right
  end

  def right
    idx = VALID_INPUT.index(direction)
    next_move_index = (idx + 1) % VALID_INPUT.count
    VALID_INPUT[next_move_index]
  end
end
