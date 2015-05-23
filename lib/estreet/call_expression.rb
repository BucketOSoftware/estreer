module Estreet
  class CallExpression < Expression
    def initialize(callee, arguments)
      @callee = callee.to_expression
      @arguments = arguments.map {|arg| arg.to_expression }
    end

    def attributes
      super.merge(callee: @callee, arguments: @arguments)
    end
  end

  class NewExpression < CallExpression; end
end

