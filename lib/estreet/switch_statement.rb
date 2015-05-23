module Estreet
  class SwitchStatement < Statement
    # kases is an array of 2-element arrays, or 1 for the default case
    def initialize(discriminant, kases)
      @kases = kases.map do |kase|
        raise TypeError, "Invalid case: #{kase}" unless kase.is_a? Array

        case kase.length
        when 2 then SwitchCase.new(*kase)
        when 1 then SwitchCase.default(kase.first)
        else raise TypeError, "Invalid case: #{kase}"
        end
      end
      
      @discriminant = discriminant.to_expression
    end

    def attributes
      super.merge(
        discriminant: @discriminant,
        cases: @kases,
        lexical: false, # TODO: an ES6 thing?
      )
    end
  end

  class SwitchCase < Node
    def initialize(test, consequent)
      @test = test.to_expression if test
      @consequent = Array(consequent).map {|c| c.to_statement }
    end

    def self.default(consequent)
      self.new(nil, consequent)
    end

    def attributes
      super.merge(test: @test, consequent: @consequent)
    end
  end

end
