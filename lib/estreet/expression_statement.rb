module Estreet
  class ExpressionStatement < Statement
    def initialize(expr, loc=nil)
      super(loc)

      @expr = expr.to_expression
    end

    def attributes
      super.merge(expression: @expr)
    end
  end
end