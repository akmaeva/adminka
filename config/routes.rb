Rails.application.routes.draw do

  resources :countries
  resources :regions
  resources :towns 
  resources :turbasas

  # Маршруты для экшенов загрузки списков
  get '/countrieslist', to: 'turbasas#countrieslist'
  get '/regionslist', to: 'turbasas#regionslist'
  get '/townslist', to: 'turbasas#townslist'

  get '/countrieslist', to: 'towns#countrieslist'
  get '/regionslist', to: 'towns#regionslist'

  root 'home#index'
end
