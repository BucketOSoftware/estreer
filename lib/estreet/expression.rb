module Estreet
  class Expression < Node
    def to_expression
      self
    end

    def to_statement
      ExpressionStatement.new(self, source_location)
    end

    # Return an expression if at all possible
    def self.coerce(thing)
      case thing
      when Expression
        thing
      when Array
        ArrayExpression.new(thing.map {|element| element })
      when Symbol, String
        Identifier.new(thing)
      else
        raise TypeError, "Can't convert to expression: #{thing.inspect}"
      end
    end
  end

  class ThisExpression < Expression; end
end

require 'estreet/identifier'
require 'estreet/literal'
require 'estreet/call_expression'
require 'estreet/member_expression'
require 'estreet/binary_expression'
require 'estreet/unary_expression'
require 'estreet/assignment_expression'
require 'estreet/array_expression'
require 'estreet/object_expression'