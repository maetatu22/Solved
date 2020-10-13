Rails.application.routes.draw do
  devise_for :users
  root to: "problems#index"
  resources :problems , only: [:index, :new, :create, :show]
  
end
