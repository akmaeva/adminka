Rails.application.routes.draw do
  resources :hostels
  root 'home#index'
end
