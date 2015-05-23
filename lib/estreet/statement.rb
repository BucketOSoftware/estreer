class Estreet::Statement < Estreet::Node
  def to_statement
    self
  end
end

require 'estreet/block_statement'
require 'estreet/break_statement'
require 'estreet/empty_statement'
require 'estreet/expression_statement'
require 'estreet/if_statement'
require 'estreet/labeled_statement'
require 'estreet/return_statement'
require 'estreet/switch_statement'
