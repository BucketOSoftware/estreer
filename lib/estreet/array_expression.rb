module Estreet
  class ArrayExpression < Expression
    def initialize(*elements, loc=nil)
      super(loc)

      @elements = elements.map do |e|
        e.nil? ? e : e.to_expression
      end
    end

    def attributes
      super.merge(elements: @elements)
    end
  end
end
