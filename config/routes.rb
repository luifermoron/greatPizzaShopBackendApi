Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: [:index]
      resources :product_properties, only: [:index]
      resources :products, only: [:index]
      resources :orders, only: [:create, :show]
    end
  end
end
