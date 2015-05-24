module Estreet
  class Literal < Expression
    def initialize(value)
      # TODO: Regexp? I guess?
      @value = value
    end

    # Convert a ruby literal into a node that represents the same value
    def self.from_ruby(value)
      case value
      when Array
        # values are expected to be JS nodes already
        ArrayExpression.new(value)
      when String, TrueClass, FalseClass, NilClass
        Literal.new(value)
      when Fixnum, Bignum, Float
        if value < 0 # negative numbers have to be specially handled -- a negative literal is apparently not allowed?
          UnaryExpression.new("-", Literal.new(value.abs))
        else
          Literal.new(value)
        end
      else
        raise ArgumentError, "Can't convert to a literal: #{value}"
      end
    end

    def self.[](value)
      from_ruby(value)
    end

    def attributes
      super.merge(value: @value)
    end
  end
end