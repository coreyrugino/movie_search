Rails.application.routes.draw do
  resources :movies
  resources :users
  resources :lists

  root 'users#index'

  get "add_movie_to_likes", to: "users#add_movie_to_likes"
  get "remove_movie_from_likes", to: "users#remove_movie_from_likes"
end
