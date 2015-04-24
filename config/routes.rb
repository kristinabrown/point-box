Rails.application.routes.draw do
  resource :user
  
  namespace :admin do 
    resources :users 
    resources :rewards
  end  
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
