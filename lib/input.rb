require_relative 'plateau'
require_relative 'rover'

class InputProcessor
  def initialize(input, output = nil, error = nil)
    @input_buffer = input
    @output = output || $stdout
    @err = error || $stderr
  end

  def process
    @rovers.each_with_index do |rover, idx|
      move_rover(idx)
      @output.puts "#{rover.x} #{rover.y} #{rover.direction_heading}"

      if rover.x.negative? || rover.y.negative? || rover.x > plateau.width || rover.y > plateau.height
        @err.puts "Warning: You are OUT of the plateau (#{rover.x}, #{rover.y})"
      end
    end
  end

  def plateau
    @plateau ||= begin
      width, height = *input_buffer.lines.first.strip.split
      Plateau.new(width.to_i, height.to_i)
    end
  end

  def rovers
    @rovers ||= begin
      the_rovers = []

      input_buffer.lines.each_with_index do |line, idx|
        line = line.strip
        next if idx.even? || line.empty?

        x, y, direction = *line.split

        rover = Rover.new
        rover.position(x.to_i, y.to_i)
        rover.heading = direction

        the_rovers << rover
      end

      the_rovers
    end
  end

  def move_rover(idx)
    rover = rovers[idx]

    instructions_to_rover[idx].each do |instruction|
      process_instruction(rover, instruction)
    end
  end

  protected

  attr_reader :input_buffer, :output

  def instructions_to_rover
    @instructions_to_rover ||= begin
      the_instructions = []

      input_buffer.lines.each_with_index do |line, idx|
        line = line.strip
        next if idx.odd? || idx.zero? || line.empty?

        the_instructions << line.each_char
      end

      the_instructions
    end
  end

  def process_instruction(rover, instruction)
    case instruction
    when 'L'
      rover.turn_left
    when 'R'
      rover.turn_right
    when 'M'
      rover.move
    end
  end
end
