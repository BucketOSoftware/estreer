module Estreet
  class AssignmentExpression < Expression
    def initialize(left, right, operator="=")
      # TODO: InvalidOperatorError
      Estreet.assert_valid_operator(ASSIGNMENT_OPERATORS, operator)

      @op = operator
      @right = right.to_expression
      @left = if left.respond_to? :to_pattern
        left.to_pattern
      else
        left.to_expression
      end
    end

    def attributes
      super.merge(operator: @op, left: @left, right: @right)
    end
  end
end