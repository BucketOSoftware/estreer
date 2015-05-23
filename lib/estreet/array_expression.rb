module Estreet
  class ArrayExpression < Expression
    def initialize(elements)
      @elements = elements.map do |e|
        e.nil? ? e : Expression.coerce(e)
      end
    end

    def attributes
      super.merge(elements: @elements)
    end
  end
end
