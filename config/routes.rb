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
end
