Rails.application.routes.draw do
  resources 'images' do
    collection do
      post :confirm
    end
  end
end