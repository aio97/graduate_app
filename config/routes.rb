Rails.application.routes.draw do
  get "plans/destroy"
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :books, only: %i[index new create show edit update destroy] do
    resources :plans, only: %i[destroy]
  end

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
end
