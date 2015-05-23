module Estreet
  class Program < Node
    def initialize(body, loc=nil)
      super(loc)
      @body = body
    end

    def attributes
      super.merge(body: Array(@body))
    end
  end
end