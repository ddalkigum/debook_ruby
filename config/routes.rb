Rails.application.routes.draw do
  get '/v1/auth/send-email', to: 'auth#send_email'
  get '/v1/auth/signin', to: 'auth#signin'
  get '/v1/auth/check', to: 'auth#check_signup_request'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "auth#send_email"
end
