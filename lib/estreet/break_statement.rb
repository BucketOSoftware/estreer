module Estreet
  class BreakStatement < Statement
    def initialize(label=nil, loc=nil)
      super(loc)
      @label = Identifier.new(label) if label
    end

    def attributes
      super.merge(label: @label)
    end
  end

  class ContinueStatement < BreakStatement; end

end
