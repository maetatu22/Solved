Rails.application.routes.draw do
  devise_for :users
  root to: "problems#index"
  resources :users, only: :show 
  resources :problems do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
