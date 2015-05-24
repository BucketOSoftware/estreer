module Estreet
  class Identifier < Expression
    def initialize(name)
      # TODO: raise if it's not a valid JS identifier
      @name = name.to_s
    end

    def attributes
      super.merge(name: @name)
    end

    def to_pattern
      self
    end

    def to_s
      @name.to_s # this allows us to do Identifier.new(Identifier.new('hello')) and get an identifier
    end

    def self.[](name)
      return name if name.is_a?(self)
      new(name)
    end
    
  end
end