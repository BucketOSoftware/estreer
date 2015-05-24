module Estreet
  class Identifier < Expression
    # @param [Estreet::Identifier, String]
    def initialize(name)
      raise ArgumentError, "Invalid identifier: #{name}" unless self.class.valid?(name)
      @name = name.to_s
    end

    def attributes
      super.merge(name: @name)
    end

    def to_pattern
      self
    end

    # Returns the identifier as a Ruby string.
    def to_s
      @name.to_s # this allows us to do Identifier.new(Identifier.new('hello')) and get an identifier
    end

    # Returns an identifier created with name, or returns name if it is already an identifier.
    def self.[](name)
      return name if name.is_a?(self)
      new(name)
    end

    # @returns true if name is a valid identifier.
    def self.valid?(name)
      !!JS_IDENTIFIER.match(name.to_s)
    end

private
  
    JS_IDENTIFIER = /[[:alpha:]$_][[:alnum:]$_]*/ # TODO: this is probably too conservative. Not sure if it would handle unicode chars, and it doesn't check against reserved words.

  end
end
