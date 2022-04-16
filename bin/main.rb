#!/usr/bin/env ruby

require_relative '../lib/input'

input = $stdin.read

unless input.empty?
  processor = InputProcessor.new(input, $stdin)
  processor.process
end

