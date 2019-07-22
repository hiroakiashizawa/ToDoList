Rails.application.routes.draw do

  get 'admin/index'
  root 'tasks#index'
  
  resources :users
  get 'users/new'

  resources :tasks do
    get 'completed', on: :collection
    patch 'edit_completed', on: :member
    get 'deleted', on: :collection
    patch 'pre_destroy', on: :member
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
