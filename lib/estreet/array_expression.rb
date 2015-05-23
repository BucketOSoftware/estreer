module Estreet
  class ArrayExpression < Expression
    def initialize(elements)
      @elements = elements.map do |e|
        # TODO: is it OK to coerce here?
        e.nil? ? e : Expression.coerce(e)
      end
    end

    def attributes
      super.merge(elements: @elements)
    end
  end
end
