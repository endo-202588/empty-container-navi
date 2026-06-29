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
    resources :bookings,
          only: %i[index show destroy]
  end

  resources :ports, only: %i[index show]

  resources :users, only: %i[new create]

  resource :profile, only: %i[show edit update]

  get    "login",  to: "user_sessions#new"
  post   "login",  to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  resources :voyages,
            only: %i[show] do
    resources :bookings,
              only: %i[new create]
  end

  get "guide", to: "guides#show", as: :guide

  resources :bookings,
          only: %i[index show destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine,
          at: "/letter_opener"
  end
end
