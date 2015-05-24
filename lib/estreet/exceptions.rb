module Estreet
  class ThrowStatement < Statement
    def initialize(argument)
      @argument = argument.to_expression
    end

    def attributes
      super.merge(argument: @argument)
    end

    def self.error(expression)
      new(NewExpression.new(Identifier['Error'], [expression.to_expression]))
    end

  end
end