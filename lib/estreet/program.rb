module Estreet
  class Program < Node
    def initialize(body)
      @body = body
    end

    def attributes
      super.merge(body: @body)
    end
  end
end