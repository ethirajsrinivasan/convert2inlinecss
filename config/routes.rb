Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'premailer#index'

post "/", to: 'premailer#index'
end
