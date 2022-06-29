Rails.application.routes.draw do
  resources :tasks
  resources :desechados
  resources :logs
  resources :inputs
  resources :outputs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "tasks#index"
  get "logs_delete/delete"
  get "outputs_delete/delete"
  get  "inputs/index"
  get  "outputs/index"
  get  "logs/index"

end
