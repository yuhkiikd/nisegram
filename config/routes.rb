Rails.application.routes.draw do
  root 'images#index'
  resources :images do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
end