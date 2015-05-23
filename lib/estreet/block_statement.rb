class Estreet::BlockStatement < Estreet::Statement
  def initialize(statements)
    @statements = Array(statements).map do |st|
      st.to_statement
      # raise TypeError, "Not a statement: #{st}" unless st.is_a? Statement
    end
  end

  def attributes
    super.merge(body: @statements)
  end

  def self.flatten(statements)
    new(statements.flat_map do |stmt|
      if stmt.is_a? self
        stmt.statements
      else
        stmt.to_statement
      end
    end)
  end
  
  attr_reader :statements
end
