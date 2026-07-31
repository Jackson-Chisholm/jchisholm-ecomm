Rails.application.routes.draw do
  devise_for :customers
  get "orders/index"
  get "orders/new"
  get "customers/index"
  get "customers/new"
  get "items/index"
  get "items/show"

  post "/cart/add", to: "items#add_to_cart", as: :add_to_cart
  get "/cart", to: "items#cart", as: :cart

  patch "/cart/increase/:item_id",
      to: "items#increase_quantity",
      as: :increase_quantity

  patch "/cart/decrease/:item_id",
      to: "items#decrease_quantity",
      as: :decrease_quantity

  delete "/cart/remove/:item_id",
       to: "items#remove_from_cart",
       as: :remove_from_cart
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  root "items#index"
  resources :items
  resources :orders
  resources :provinces

  # Defines the root path route ("/")
  # root "posts#index"
end
