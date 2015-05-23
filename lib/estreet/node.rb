require 'json'

class Estreet::Node
  attr_reader :source_location

  def initialize(loc=nil)
    @source_location = loc
  end

  def loc(source_location)
    @source_location = loc # TODO: construct the thing
    self # suitable for chaining
  end

  def type
    self.class.name.gsub(/\AEstreet::/, '')
  end
  
  def attributes
    { type: type }.tap do |h|
      h[:loc] = @source_location if @source_location
    end
  end

  def as_json
    attributes.map {|k,v|
      case v
      when Estreet::Node
        [k, v.as_json]
      when Array
        [k, v.map(&:as_json)]
      else
        [k, v]
      end
    }.to_h
    # raise NotImplementedError
  end
end