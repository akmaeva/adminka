Rails.application.routes.draw do

  resources :turbasas 
  resources :countries
  resources :regions

  # Маршруты для экшенов загрузки списков
  get '/countries', to: 'turbasas#countries'
  get '/regions', to: 'turbasas#regions'
  get '/towns', to: 'turbasas#towns'

  root 'home#index'
end
