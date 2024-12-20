Rails.application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

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
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :contacts, only: %i[new create]

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  get "created_book", to: "books#created_index"
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider
end
