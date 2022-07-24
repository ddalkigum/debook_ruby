class IntegerSchema 
  def initialize (context)
    @context = context
  end

  def min (length)
    if @context.length < length
      raise TypeError.new("#{@context} must be at least #{length}")
    end
    self
  end

  def max (length)
    if @context.length > length
      raise TypeError.new("#{@context} must be at least #{length}")
    end
    self
  end
end