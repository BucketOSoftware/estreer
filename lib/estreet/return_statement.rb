module Estreet
  class ReturnStatement < Statement
    def initialize(argument=nil, loc=nil)
      super(loc)
      @argument = argument.to_expression if argument
    end

    def attributes
      super.merge(argument: @argument)
    end
  end
end
