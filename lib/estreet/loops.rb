module Estreet
  class WhileStatement < Statement
    def initialize(test, body)
      @test = test.to_expression
      @body = body.to_statement
    end

    def attributes
      super.merge(test: @test, body: @body)
    end
  end

  class DoWhileStatement < WhileStatement; end

  class ForStatement < Statement
    def initialize(init, test, update, body)
      # TODO: respond_to to_declaration, maybe?
      raise TypeError unless init.is_a?(VariableDeclaration) ||
        init.is_a?(Expression) ||
        init.nil?

      @init = init if init
      @test = test.to_expression if test
      @update = update.to_expression if update
      @body = body.to_statement
    end

    def attributes
      super.merge(init: @init, test: @test, update: @update, body: @body)
    end
  end

  # TODO: for/in, for/of?
end
