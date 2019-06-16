Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :tasks
  root 'tasks#index'

  get 'tasks/complete'
  get 'tasks/edit'
  get 'tasks/new'
end
