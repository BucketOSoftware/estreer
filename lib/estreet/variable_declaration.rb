module Estreet
  class VariableDeclaration < Statement
    def initialize(declarations)
      raise TypeError unless declarations.all? {|d| d.is_a? VariableDeclarator}

      @declarations = declarations
    end

    def attributes
      super.merge(declarations: @declarations, kind: "var".freeze)
    end

    def to_declaration
      self
    end
  end

  class VariableDeclarator < Node
    def initialize(ident, init)
      @ident = ident.to_pattern
      @init  = init.to_expression if init
    end

    def attributes
      super.merge(id: @ident, init: @init)
    end
  end

end