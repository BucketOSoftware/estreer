module Estreet
  class BinaryExpression < Expression
    def initialize(operator, left, right)
      # unless BINARY_OPERATORS.include?(operator)
        # raise ArgumentError, "Invalid binary operator: #{operator} (valid operators: #{BINARY_OPERATORS.join(' ')})"
      # end
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
end