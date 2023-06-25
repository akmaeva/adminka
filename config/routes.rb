Rails.application.routes.draw do
  resources :hostels 
  
  # Маршруты для экшенов загрузки списков
  get '/countries', to: 'hostels#countries'
  get '/regions', to: 'hostels#regions'
  get '/towns', to: 'hostels#towns'

  root 'home#index'
end
