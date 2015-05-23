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

  def flatten(statements)
    BlockStatement.new(statements.flat_map do |stmt|
      if stmt.is_a? BlockStatement
        stmt.statements
      else
        stmt
      end
    end)
  end
  
  attr_reader :statements
end
