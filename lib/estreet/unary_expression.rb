module Estreet
  class UnaryExpression < Expression
    def initialize(operator, argument)
      Estreet.assert_valid_operator(UNARY_OPERATORS, operator)

      @operator = operator
      @argument = argument.to_expression
    end

    def attributes
      super.merge(
        operator: @operator,
        argument: @argument,
        prefix: true # TODO: when is it false?
      )
    end

  end
end
