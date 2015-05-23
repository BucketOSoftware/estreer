module Estreet
  class IfStatement < Statement
    def initialize(test, consequent, alternate=nil, loc=nil)
      super(loc)
      @test       = test.to_expression
      @consequent = consequent.to_statement
      @alternate  = alternate.to_statement if alternate
    end

    def attributes
      super.merge(
        test:       @test,
        consequent: @consequent,
        alternate:  @alternate
      )
    end
  end
end