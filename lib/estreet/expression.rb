module Estreet
  class Expression < Node
    def to_expression
      self
    end

    def to_statement
      ExpressionStatement.new(self, source_location)
    end

  end

  class ThisExpression < Expression; end
end

require 'estreet/identifier'
require 'estreet/literal'
require 'estreet/call_expression'
require 'estreet/binary_expression'
require 'estreet/unary_expression'
