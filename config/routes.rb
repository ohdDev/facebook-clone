Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end