class Validate
  def is_valid_email? email
    regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    return regex.match(email)
  end
end