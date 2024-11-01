Rails.application.routes.draw do
  get "plans/destroy"
  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :books, only: %i[index new create show edit update destroy] do
    resources :plans, only: %i[destroy]
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  get "created_book", to: "books#created_index"
end
