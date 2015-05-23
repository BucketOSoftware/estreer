module Estreet
  class Literal < Expression
    def initialize(value)
      # TODO: Regexp? I guess?
      @value = value
    end

    def self.from_ruby(value)
      case value
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

    def attributes
      super.merge(value: @value)
    end
  end
end