require 'spec_helper'

require_relative '../lib/mars_rover'
require_relative '../lib/exceptions'

describe MarsRover do
  describe 'Creation' do
    it 'is in its initial position when initialized' do
      rover = MarsRover.new
      expect(rover.x_axis).to eql(0)
      expect(rover.y_axis).to eql(0)
      expect(rover.direction).to eql('N')
    end

    it 'has the position passed on creation' do
      rover = MarsRover.new(2, 3, 'S')
      expect(rover.x_axis).to be(2)
      expect(rover.y_axis).to eql(3)
      expect(rover.direction).to eql('S')
    end
  end

  describe 'Move' do
    it 'update its postion to the given displacement' do
      rover = MarsRover.new(1, 5)
      rover.move(1, 2)
      expect(rover.x_axis).to eql(1)
      expect(rover.y_axis).to eql(7)
      rover.move(8, -2)
      expect(rover.x_axis).to eql(1)
      expect(rover.y_axis).to eql(5)
    end
  end

  describe 'Rotate' do
    it 'turn to left' do
      rover = MarsRover.new(1, 5, 'N')
      rover.change_direction('R')
      expect(rover.direction).to eql('E')
      rover.change_direction('R')
      expect(rover.direction).to eql('S')
      rover.change_direction('R')
      expect(rover.direction).to eql('W')
      rover.change_direction('R')
      expect(rover.direction).to eql('N')
    end

    it 'turn left and right' do
      rover = MarsRover.new(1, 5, 'N')
      rover.change_direction('R')
      expect(rover.direction).to eql('E')
      rover.change_direction('L')
      expect(rover.direction).to eql('N')
    end
  end

  describe 'Rotate and move' do
    it 'turn and move' do
      rover = MarsRover.new(3, 5, 'W')
      rover.change_direction('L')
      rover.move(5, 4)
      expect(rover.x_axis).to eql(3)
      expect(rover.y_axis).to eql(1)
    end
  end

  describe 'Control signal' do
    it 'gives signals to the rover' do
      rover = MarsRover.new(3, 5, 'N')
      rover.control_signal('L')
      rover.control_signal('M')
      rover.control_signal('L')
      rover.control_signal('M')
      expect(rover.x_axis).to equal(2)
      expect(rover.y_axis).to eql(4)
      expect(rover.direction).to eql('S')
    end
  end

  describe 'Validation' do
    it 'raise invalid control signal' do
      rover = MarsRover.new(1, 3, 'N')
      expect { rover.control_signal('D') }.to raise_error(InvalidControlSignal)
    end
  end
end
