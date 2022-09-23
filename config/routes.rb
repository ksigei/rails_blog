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
  
  get '/posts/:id', to: 'posts#show'
  get '/posts/:id/comments', to: 'comments#comments'
  get '/posts/:id/likes', to: 'likes#likes'
  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/about', to: 'about#about'

end
