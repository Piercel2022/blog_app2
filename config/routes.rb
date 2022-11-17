Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  
  #get "/users", to: "users#index"
  #get "/users/user_id", to: "users#show"
  #get "/users/:user_id/posts", to: "posts#index"
  #get "/user/:user_id/post/id", to: "posts#show"
  
end
