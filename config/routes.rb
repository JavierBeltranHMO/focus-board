Rails.application.routes.draw do
  devise_for :users

  resources :boards do
    resources :lists, except: [ :index, :show ] do
      member do
        put :sort
      end
    end
  end

  resources :tasks do
    member do
      put :sort
      patch :complete
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
