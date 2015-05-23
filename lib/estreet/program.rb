module Estreet
  class Program < Node
    def initialize(body)
      @body = Array(body).map {|s| s.to_statement }
    end

    def attributes
      super.merge(body: @body)
    end
  end
end