require_relative '../../lib/util/validate'
require_relative '../../lib/util/generate'
require_relative '../../lib/logger/logger'
require_relative '../mailers/auth_mailer'
require_relative '../error/expect'

class AuthController < ApplicationController
  def send_email
    begin
      email = send_email_params[:email];

      is_valid = ValidateUtil.new.is_valid_email?(email);
      if !is_valid
        raise ExpectedError.new('BadRequest', 'InvalidEmail');
      end

      code = GenerateRandom.new.hexGenerator(10);

      begin
        found_user = User.find(email);
      rescue ActiveRecord::RecordNotFound => error
        puts "Record not found error"
        raise error
      end

      puts "found_user: #{found_user}"

      # AuthMailer.new.send(email, 'asdf', true)
      render :json => { :name => 'name' };
    rescue => error
      puts error
      render :json => { 
        :status => 'Error', 
        :result => { 
          :name => error.class, 
          :message => error.message
          }
        };
    end
  end

  private 
  def send_email_params
    params.permit(:email)
  end
end
