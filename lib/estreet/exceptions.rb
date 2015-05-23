module Estreet
  class ThrowStatement < Statement
    def initialize(argument)
      @argument = argument.to_expression
    end

    def attributes
      super.merge(argument: @argument)
    end
  end
end