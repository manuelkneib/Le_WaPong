Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'leagues', to: 'leagues#index'
  # get 'leagues/new', to: 'leagues#new'
  # get 'leagues/:id', to: 'leagues#show'
  resources :leagues do
    resources :user_leagues, only: :create
    resources :matches, only: %i[new create index]
    member do
      post "setmatches", to: "leagues#setmatches"
      delete "delete_player", to: "user_leagues#destroy"
    end
  end


  get "leagues/:id/invitation", to: "leagues#invitation", as: :invitation
  # post "leagues/:id/invitation", to: "user_leagues#create",

  resources :matches, only: [] do
    member do
      post "setwinner", to: "matches#setwinner"
    end
    collection do
      post "reload_round", to: "matches#reload_round"
    end
  end
end
