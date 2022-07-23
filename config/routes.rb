Rails.application.routes.draw do
  get '/v1/auth/send-email', to: 'auth#send_email'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "auth#send_email"
end
