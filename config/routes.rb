Rails.application.routes.draw do

  get 'admin/index'
  root 'tasks#index'
  
  resources :users
  get 'users/new'

  resources :tasks do
    get 'completed' => 'tasks#completed', on: :collection
    patch 'edit_completed' => 'tasks#edit_completed', on: :collection
    get 'deleted' => 'tasks#deleted', on: :collection
    patch 'pre_destroy' => 'tasks#pre_destroy', on: :collection
    get 'search' => 'tasks#search', on: :collection
  end

  get '/login/index' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get '/login/guest' => 'sessions#login_as_guest'

  get '/admin' => 'admin#index'
  get '/admin/users' => 'admin#users_show'
  get '/admin/tasks' => 'admin#tasks_show'
end
