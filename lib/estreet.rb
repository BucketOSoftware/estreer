require "estreet/version"

module Estreet
  UNARY_OPERATORS = %w{ - + ! ~ typeof void delete }.freeze

  BINARY_OPERATORS = %w{
    == != === !==
    < <= > >= << >> >>>
    + - * / % | ^ & in
    instanceof
  }.freeze
  
  ASSIGNMENT_OPERATORS = %w{ = += -= *= /= %= <<= >>= >>>= |= ^= &= }.freeze

  LOGICAL_OPERATORS = %w{ || && }.freeze
  
  def self.assert_valid_operator(acceptable, actual)
    unless acceptable.include?(actual)
      raise ArgumentError, "Invalid operator: #{operator} (valid operators: #{acceptable.join(' ')})"
    end
  end
end

require 'estreet/node'
require 'estreet/program'
require 'estreet/statement'
require 'estreet/expression'
require 'estreet/function'