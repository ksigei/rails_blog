Rails.application.routes.draw do
  root "posts#index"
  get 'comments/comments'
  get 'likes/likes'
  get 'users/users'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
