Rails.application.routes.draw do

  root 'tasks#index'
  
  resources :users
  get 'users/new'

  resources :tasks do
    get 'complete', on: :collection
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy' 
end
