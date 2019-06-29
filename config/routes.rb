Rails.application.routes.draw do
  get 'user/show'

  resources :tasks do
    get 'complete', on: :collection
  end

  root 'tasks#index'
end
