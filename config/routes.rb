Rails.application.routes.draw do
  get 'user/show'

  root 'tasks#index'

  get 'tasks', to: 'tasks#index'
  get 'tasks/complete'
  get 'tasks/edit'
  get 'tasks/new'

  post 'tasks' => 'tasks#create'
end
