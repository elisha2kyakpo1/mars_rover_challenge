#!/usr/bin/env ruby

$:.unshift 'lib'
require_relative 'input'

input = STDIN.read

unless input.empty?
  processor = InputProcessor.new(input, STDOUT)
  processor.process
end

