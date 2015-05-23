module Estreet
  class ObjectExpression < Expression
    def initialize(properties)
      raise TypeError unless properties.all? {|p| p.is_a? Property }
    end

    def attributes
      super.merge(properties: @props)
    end
  end

  class Property < Node
    # TODO: getters and setters
    def initialize(key, value)
      @key = Identifier.new(key)
      puts "Val #{value.inspect}"
      @value = value.to_expression
    end

    def attributes
      super.merge(kind: "init".freeze, key: @key, value: @value)
    end
  end

end
