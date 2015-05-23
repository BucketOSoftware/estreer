module Estreet
  class LabeledStatement < Statement
    def initialize(label, body)

      @label = Identifier.new(label)
      @body = body.to_statement
    end

    def attributes
      super.merge(
        label: @label,
        body: @body
      )
    end

  end
end
