Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#index"

  namespace :admin do
    root "dashboard#index"

    resources :ports
    resources :container_stocks,
          only: %i[index new create edit update destroy]
    resources :routes
    resources :voyages
  end

  resources :ports, only: %i[index show]

  resources :users, only: %i[new create]

  get    "login",  to: "user_sessions#new"
  post   "login",  to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  get "guide", to: "guides#show"
end
