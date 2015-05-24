module Estreet
  class Statement < Node
    def to_statement
      self
    end

    # Returns a block the receiver is the first statment and `statement` is the second
    def <<(statement)
      BlockStatement.flatten(self, statement)
    end

  end
end

require 'estreet/loops'
require 'estreet/block_statement'
require 'estreet/break_statement'
require 'estreet/empty_statement'
require 'estreet/expression_statement'
require 'estreet/if_statement'
require 'estreet/labeled_statement'
require 'estreet/return_statement'
require 'estreet/switch_statement'
require 'estreet/variable_declaration'
