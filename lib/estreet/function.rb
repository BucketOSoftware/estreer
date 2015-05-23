module Estreet
  module Function
    def initialize(params, body)
      # TODO: join multiple blocks in the body, or whatever?
      # TODO: allow body to be an expression -- ES6 expression closure

      @params = params.map(&:to_pattern)
      @body   = body.to_block
    end

    def attributes
      # does super work here (i.e. in a module)?
      super.merge(
        generator: false, # ES6?
        expression: false, # ES6?
        defaults: [], # ES6?
        rest: nil, # ??
        params: @params,
        body: @body
      )
    end
  end

  class FunctionExpression < Expression
    include Function
  end

  class FunctionDeclaration < Statement
    include Function

    def to_declaration
      self
    end
  end
end


# interface FunctionDeclaration <: Function, Declaration {
#     type: "FunctionDeclaration";
#     id: Identifier;
#     params: [ Pattern ];
#     defaults: [ Expression ];
#     rest: Identifier | null;
#     body: BlockStatement | Expression;
#     generator: boolean;
#     expression: boolean;
# }

# interface FunctionExpression <: Function, Expression {
#     type: "FunctionExpression";
#     id: Identifier | null;
#     params: [ Pattern ];
#     defaults: [ Expression ];
#     rest: Identifier | null;
#     body: BlockStatement | Expression;
#     generator: boolean;
#     expression: boolean;
# }