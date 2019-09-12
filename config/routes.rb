Rails.application.routes.draw do

  get 'admin/index'
  root 'tasks#index'
  
  resources :users
  get 'users/new'

  resources :tasks do
    collection do
      get 'completed' => 'tasks#completed'
      get 'deleted' => 'tasks#deleted'
      get 'search' => 'tasks#search'
      post 'search' => 'tasks#search'
    end
    
    member do
      patch 'edit_completed' => 'tasks#edit_completed'
      patch 'pre_destroy' => 'tasks#pre_destroy'
    end
  end

  resources :projects do
    resources :tasks, controller: 'projects/tasks'
  end

  get '/login/index' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
  get '/login/guest' => 'sessions#login_as_guest'

  get '/admin' => 'admin#index'
  get '/admin/users' => 'admin#users_show'
  get '/admin/tasks' => 'admin#tasks_show'

  post '/callback' => 'linebot#callback'
end
