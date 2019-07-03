Rails.application.routes.draw do
  
  get 'users/new'
  resources :users

  resources :tasks do
    get 'complete', on: :collection
  end

  root 'tasks#index'
end
