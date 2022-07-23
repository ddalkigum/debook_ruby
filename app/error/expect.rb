class ExpectedError < StandardError
  def initialize(name, message)
    @message = message
    super(name)
  end
end