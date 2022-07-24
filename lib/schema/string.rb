class StringSchema 
  def initialize (context)
    @context = context
  end
  
  def email
    regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    if !regex.match(@context)
      raise TypeError.new("#{@context} is invalid email")
    end
    self
  end

  def uuid
    regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    if !regex.match(@context)
      raise TypeError.new("#{@context} is invalid uuid")
    end
    self
  end

  def code
    regex = /^[0-9a-z]{10}$/
    if !regex.match(@context)
      raise TypeError.new("#{@context} is invalid code")
    end
    self
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