Rails.application.routes.draw do
  devise_for :users

  resources :boards

  resources :tasks do
    member do
      put :sort
    end
  end

  resources :lists do
    member do
      put :sort
    end
  end

  # health check
  get "up" => "rails/health#show", as: :rails_health_check

  # dynamic root
  authenticated :user do
    root to: "boards#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "boards#index", as: :unauthenticated_root
  end
end
