Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders
      resources :products
      resources :pharmacies do
        member do
          post :create_order
          post :sale
        end
      end
      resources :laboratories
    end
  end
end
