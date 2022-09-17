Rails.application.routes.draw do
  root "posts#index"
  resources :posts do 
    resources :comments
    resources :likes
  end
  

  resources :users do
    resources :posts do
      resources :comments
    end
  end
  
  get '/about', to: 'about#about'
  # get 'comments/comments'
  # get 'likes/likes'
  # get 'users/users'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
