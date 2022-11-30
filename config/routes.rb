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
  end
  get "leagues/:id/invitation", to: "leagues#invitation", as: :invitation
  # post "leagues/:id/invitation", to: "user_leagues#create",
end
