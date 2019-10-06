Rails.application.routes.draw do
  root 'images#index'
  resources :images do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :likes
    end
  end
  resources :relatiionships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy, :show]
end