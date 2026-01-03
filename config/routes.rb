Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # admin and users
  namespace :admin do
    resources :users
  end

  # pages
  get "/", to: "pages#home", as: "home"
  get "/main", to: "pages#landing_page", as: "landing_page"

  # marketplace
  get "/marketplace/stock-list", to: "marketplace#stock_list", as: "marketplace_stock_list"
  get "/marketplace/stock", to: "marketplace#stock", as: "marketplace_stock"

  # portfolio
  get "/portfolio/stock-list", to: "portfolio#stock_list", as: "portfolio_stock_list"
  get "/portfolio/stock", to: "portfolio#stock", as: "portfolio_stock"

  # root page
  root "pages#home"
end
