Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  resources :task_lists do
    resources :tasks, only: [:new, :create, :destroy]
  end
  post "tasks" => "tasks#destroy", as: :delete_task
end
