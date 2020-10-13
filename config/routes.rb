Rails.application.routes.draw do
  devise_for :users
  root to: "problems#index"
  
  resources :users, only: :show 
  resources :problems
end
