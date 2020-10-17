Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "problems#index"
  resources :users, only: [:show] do
    member do
      get 'profile'
      patch 'profile_update'
      get 'profile_edit'
    end
  end

  resources :problems do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
