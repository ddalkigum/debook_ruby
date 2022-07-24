require "minitest/autorun"
require_relative '../lib/validator'

valid_email = 'sol35352000@gmail.com'
invalid_email = 'sol35352000'

valid_code = '12345asdfg'
invalid_code = { :upper => '12345ASDFG', :length => '123456789'}


describe 'Validation email' do
  it 'Success - Safe email' do
    validate_result = Validator.string(valid_email).email()
    assert_equal(validate_result.class, StringSchema)
  end

  it 'Fail - Invalid email - invalid form' do
    begin 
      Validator.string(invalid_email).email()
    rescue => error
      assert_equal(error.class, TypeError)
    end
  end
end

describe 'Validation email code test' do
  it 'Success - Valid code' do
    validate_result = Validator.string(valid_code)
    assert_equal(validate_result.class, StringSchema)
  end

  it 'Fail - Invalid code - upper case' do
    begin 
      Validator.string(invalid_code[:upper]).code()
    rescue => error
      assert_equal(error.class, TypeError)
    end
  end

  it 'Fail - Invalid code - length' do
    begin 
      Validator.string(invalid_code[:length]).code()
    rescue => error
      assert_equal(error.class, TypeError)
    end
  end
end
