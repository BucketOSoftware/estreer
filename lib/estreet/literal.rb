module Estreet
  class Literal < Expression
    def initialize(value)
      # TODO: Regexp? I guess?
      @value = case value
      when String then value
      when TrueClass, FalseClass then value
      when NilClass then value
      when Fixnum, Bignum, Float then value
      else
        raise ArgumentError, "Can't convert to a literal: #{value}"
      end
    end

    def attributes
      super.merge(value: @value)
    end
  end
end