Rails.application.routes.draw do
  resources :zipcodes
  resources :routes
  resources :routesses
  resources :airports
  resources :airlines
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
