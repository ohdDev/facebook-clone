Rails.application.routes.draw do
  resources :likes
  resources :events
  get "/friends/requests" , to: "friends#requests", as: 'friends_requests'
  get "/friends/list" , to: "friends#list", as: 'friends_list'
  post "/friends/confirm" , to: "friends#confirm"
  post "/friends/delete" , to: "friends#delete"
  post "/friends/block" , to: "friends#block"
  post "/friends/add_friend" , to: "friends#add_friend"
  get '/profiles/:id', to: 'profiles#show_profile', as: 'profile'
  put '/users/:id/edit', to: 'users#edit', as: 'edit_user_path'
  resources :friends
  resources :comments
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
