Rails.application.routes.draw do

  get 'admin/index'
  root 'tasks#index'
  
  resources :users
  get 'users/new'

  resources :tasks do
    get 'complete', on: :collection
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy' 

  get '/admin' => 'admin#index'
  get '/admin/users' => 'admin#users_show'
  get '/admin/tasks' => 'admin#tasks_show'
end
