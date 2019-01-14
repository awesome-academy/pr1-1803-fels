Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/show", to: "users#show"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:index, :show]
  resources :words, only: :index
  resources :lessions
  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy]
    resources :categories, only: [:index, :show]
    resources :words, only: [:index, :destroy]
  end
end
