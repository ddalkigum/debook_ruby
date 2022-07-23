class GenerateRandom 
  def hexGenerator (length = 10)
    chars = 'abcdefghjkmnpqrstuvwxyz0123456789'
    hex = ''
    length.times { hex << chars[rand(chars.size)] }
    return hex
  end
end