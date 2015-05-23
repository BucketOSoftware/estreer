class Estreet::BlockStatement < Estreet::Statement
  def initialize(stmts, loc=nil)
    super(loc)
    
    @stmts = Array(stmts).each do |st|
      raise TypeError, "Not a statement: #{st}" unless st.is_a? Statement
    end
  end

  def attributes
    super.merge(body: @stmts)
  end
end
