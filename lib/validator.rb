require_relative './schema/string'
require_relative './schema/integer'

class Validator 
  def self.object (context)
    @context = context
  end

  def self.string (context)
    if !context.is_a?(String)
      raise TypeError.new("#{context} is not matched type")      
    end

    return StringSchema.new(context)
  end

  def self.number (context)
    if !context.is_a?(Integer)
      raise TypeError.new("#{context} is not type")
    end
    return IntegerSchema.new(context)
  end
end