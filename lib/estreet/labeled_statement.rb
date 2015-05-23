module Estreet
  class LabeledStatement < Statement
    def initialize(label, body, loc=nil)
      super(loc)

      @body = body.to_statement
      @label = Identifier.new(label)
    end

    def attributes
      super.merge(
        label: @label,
        body: @body
      )
    end

  end
end
