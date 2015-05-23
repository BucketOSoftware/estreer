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
require 'estreet/call_expression'