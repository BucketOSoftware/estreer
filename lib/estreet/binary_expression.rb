module Estreet
  class BinaryExpression < Expression
    def initialize(operator, left, right)
      Estreet.assert_valid_operator(BINARY_OPERATORS, operator)

      @operator = operator
      @left     = left.to_expression
      @right    = right.to_expression
    end

    def attributes
      super.merge(
        operator: @operator,
        left: @left,
        right: @right
      )
    end
  end

  class LogicalExpression < BinaryExpression
    def initialize(operator, left, right)
      Estreet.assert_valid_operator(LOGICAL_OPERATORS, operator)

      @operator = operator
      @left     = left.to_expression
      @right    = right.to_expression
    end
  end
  
end