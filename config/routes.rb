Rails.application.routes.draw do
  get "plans/index"
  get "books/index"
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :books, only: %i[index new create] do
    resources :plans, only: %i[new create]
  end

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
end
