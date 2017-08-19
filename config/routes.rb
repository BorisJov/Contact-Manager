Rails.application.routes.draw do
  resources :companies
  resources :email_adresses
  resources :phone_numbers
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'people#index'
end
