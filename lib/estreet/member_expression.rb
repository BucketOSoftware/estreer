module Estreet
  class MemberExpression < Expression
    def initialize(object, property, computed)
      @obj = object.to_expression
      # computed: true is e.g. "object[index]"
      # computer: false is "object.property"
      @computed = !!computed
      @property = if @computed
        property.to_expression
      else
        Identifier.new(property)
      end
    end

    def attributes
      super.merge(object: @obj, property: @property, computed: @computed)
    end

    def to_pattern
      self
    end
  end

end

