module Estreet
  class Identifier < Expression
    def initialize(name)
      @name = name.to_s
    end

    def attributes
      super.merge(name: @name)
    end

    def to_pattern
      self
    end
    
  end
end