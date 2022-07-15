Rails.application.routes.draw do
  resources :posts
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/dashboard" => "accounts#index"
  get "/profile/:username" => "accounts#profile", as: :profile
  post "follow/account" => "accounts#follow_account", as: :follow_account

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create]
  resources :posts do
    resources :likes
  end

  root to: "public#homepage"
  # Defines the root path route ("/")
  # root "articles#index"
end
