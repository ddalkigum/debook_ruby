require 'securerandom'
require_relative '../../lib/validator'
require_relative '../../lib/util/generate'
require_relative '../../lib/logger/logger'
require_relative '../mailers/auth_mailer'
require_relative '../error/expect'

class AuthController < ApplicationController
  def send_email
    begin
      email = send_email_params[:email];

      Validator.string(email).email()

      code = GenerateRandom.new.hexGenerator(10);
      found_user = User.where(email: email)

      is_signup = found_user.size == 0 ? true : false
      certification_id = SecureRandom.uuid;
      delete_time = Time.new;

      # AuthMailer.new.send(email, 'asdf', true)
      certification = Certification.new(id: certification_id, code: code, email: email, isSignup: is_signup, deleteTime: delete_time)
      certification.save();
      return render :json => { :name => 'Success' };
    rescue => error
      logger.error "{ name => #{error.class}, message: #{error.message} }"
      render :json => { :status => 'Error', :result => { :name => error.class, :message => error.message }};
    end
  end

  def signin 
    begin
      code = request.query_parameters[:code]
      
      logger.debug "code: #{code}"
      render :json => { :status => 'Success' }
    rescue => error
      logger.error "{ name => #{error.class}, message: #{error.message} }"
      render :json => { :status => 'Error', :result => { :name => error.class, :message => error.message }};
    end
  end

  def check_signup_request
    begin
      code = check_signup_params[:code]
      logger.debug "code: #{code}, type: #{code.class}"
      found_certification = Certification.where(code: code)
      logger.debug "certification: #{found_certification}"

      if found_certification.size == 0
        raise ExpectedError.new('Unauthorized', 'DoesNotExistCertification')
      end

      # Optional chaining 
      # email = found_certification.try(:email) || 'sol';
      # is_signup = found_certification.try(:isSignup) || true;
      
      email = found_certification.email
      is_signup = found_certification.isSignup
      logger.debug "email: #{email}, is_signup: #{is_signup}"

      return render :json => { :status => 'Succes', :result => { :email => email, :is_signup => is_signup}}
    rescue => error
      logger.error "{ name => #{error.class}, message: #{error.message} }"
      # stack trace 너무 길어 
      # logger.error error.backtrace.join("\n")
      return render :json => { :status => 'Error', :result => { :name => error.class, :message => error.message }};
    end
  end

  private 
    def send_email_params
      params.permit(:email)
    end

    def check_signup_params
      params.permit(:code)
    end
end
