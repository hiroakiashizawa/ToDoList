Rails.application.routes.draw do
  get 'user/show'

  resources :tasks
  
  root 'tasks#index'

  get 'tasks', to: 'tasks#index'
  get 'tasks/complete'
  get 'tasks/new'
  post 'tasks' => 'tasks#create'
  patch 'tasks' => 'tasks#update'
end
